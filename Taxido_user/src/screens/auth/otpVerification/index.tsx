import { Text, View, Keyboard, Alert } from 'react-native';
import React, { useCallback, useEffect, useRef, useState } from 'react';
import { AuthText } from '../../../components/authComponents/authText/index';
import { AuthContainer } from '../../../components/authComponents/authContainer/index';
import OTPTextInput from 'react-native-otp-textinput';
import OTPTextView from 'react-native-otp-textinput';
import { style } from './style';
import { appColors, windowHeight } from '@src/themes';
import { Button, notificationHelper } from '@src/commonComponent';
import { external } from '../../../styles/externalStyle';
import { NewUserComponent } from '../../../components/authComponents/newUserComponent/index';
import { useValues } from '../../../../App';
import { useDispatch, useSelector } from 'react-redux';
import { AppDispatch } from '../../../api/store/index';
import { FirebaseOTPInterface, VerifyOtpInterface } from '../../../api/interface/authInterface';
import { userVerifyOtp, selfData, firebaseOTPLogin } from '../../../api/store/actions/index';
import { getValue, setValue } from '../../../utils/localstorage/index';
import { useAppNavigation, useAppRoute } from '@src/utils/navigation';
import { useIsFocused } from '@react-navigation/native';
import auth from '@react-native-firebase/auth';

export function OtpVerification() {
  const route = useAppRoute();
  const isFocused = useIsFocused();
  const confirmResult = route?.params?.confirmResult;
  const { confirmation, smsGateway } = route.params;
  const countryCode = route?.params?.countryCode ?? '91';
  const phoneNumber = route?.params?.phoneNumber ?? '1234567890';
  const cca2 = route?.params?.cca2 ?? 'US';
  const demouser = route?.params || {};
  const { navigate } = useAppNavigation();
  const { bgFullLayout, textRTLStyle, isDark, viewRTLStyle, setToken } = useValues();
  const dispatch = useDispatch<AppDispatch>();
  const { loading } = useSelector((state: any) => state.auth);
  const { translateData, settingData } = useSelector((state: any) => state.setting);
  const otpInputRef = useRef(null);
  const input = useRef<OTPTextView>(null);
  const emailOrPhone = demouser?.email_or_phone ?? phoneNumber;
  const isEmail = emailOrPhone.includes('@');
  const isDemoUser = demouser?.demouser === true;
  const demoMode = settingData?.values?.activation?.demo_mode == 1
  const [otp, setOtp] = useState(demoMode === true ? '123456' : '');
  const [fcmToken, setFcmToken] = useState('')
  const [resendTimer, setResendTimer] = useState(0);
  const timerRef = useRef<NodeJS.Timeout | null>(null);
  const [firebaseloading, setFirebaseloading] = useState();

  useEffect(() => {
    if (otp.length !== 6) return;

    Keyboard.dismiss();

    if (demoMode) {
      handleVerify();
    } else if (smsGateway == 'firebase') {
      handleVerifyOtp();
    } else {
      handleVerify();
    }
  }, [otp, demoMode, smsGateway]);

  useEffect(() => {
    const fetchToken = async () => {
      let fcmToken = await getValue('fcmToken')
      if (fcmToken) {

        setFcmToken(fcmToken)
      }
    }
    if (isFocused) {
      fetchToken()
    }

  }, [isFocused])


  const handleVerify = async () => {
    const formatCountryCode = (code: string): string => {
      if (code.startsWith('+')) {
        return code.substring(1);
      }
      return code;
    };

    let payload: VerifyOtpInterface = {
      email_or_phone: phoneNumber,
      country_code: formatCountryCode(countryCode),
      token: otp,
      fcm_token: fcmToken
    };

    dispatch(userVerifyOtp(payload))
      .unwrap()
      .then(async (res: any) => {
        if (!res.success) {
          notificationHelper('', translateData.invalidOtp, 'error');
        } else if (res.success && res.is_registered) {
          notificationHelper(
            '',
            translateData.otpVerifySuccess,
            'success',
          );
          setValue('token', res.access_token);
          if (res.access_token) {
            dispatch(selfData());
          }
          navigate('MyTabs');
        } else {
          if (!res.is_registered) {

            notificationHelper(
              '',
              translateData.otpVerifySuccess,
              'success',
            );
            navigate('SignUp', {
              countryCode,
              phoneNumber,
              cca2,
            });
          } else {
            notificationHelper('', translateData.invalidOtp, 'error');
          }
        }
      })
      .catch((error: any) => {
        notificationHelper('', translateData.duringVerificationOTP, 'error');

      });
  };



  useEffect(() => {
    return () => {
      if (timerRef.current) clearInterval(timerRef.current);
    };
  }, []);


  const ResendOtp = () => {

  }

  const handleResendOtp = useCallback(() => {

    if (resendTimer > 0) return;
    ResendOtp();
    setResendTimer(30);
    timerRef.current = setInterval(() => {
      setResendTimer(prev => {
        if (prev <= 1 && timerRef.current) {
          clearInterval(timerRef.current);
          timerRef.current = null;
        }
        return prev - 1;
      });
    }, 1000);
  }, [resendTimer]);


  const handleVerifyOtp = async () => {
    if (!otp || otp.length < 6) {
      Alert.alert('Error', 'Please enter a valid OTP');
      return;
    }

    try {
      setFirebaseloading(true);
      const result = await confirmation.confirm(otp);
      let called = false;

      const unsubscribe = auth().onAuthStateChanged(async (user) => {
        if (called || !user) return;

        called = true;
        unsubscribe();

        try {
          const idToken = await user.getIdToken();

          const payload: FirebaseOTPInterface = {
            phone: phoneNumber,
            country_code: countryCode.startsWith('+') ? countryCode.slice(1) : countryCode,
            firebase_token: idToken,
          };

          const loginResult = await dispatch(firebaseOTPLogin(payload)).unwrap();

          if (loginResult?.is_registered === true) {
            setValue("token", loginResult.access_token);
            setToken(loginResult.access_token);
            await dispatch(selfData());
            navigate('MyTabs');
          } else {
            navigate('SignUp', {
              countryCode,
              phoneNumber,
              cca2,
            });
          }

        } catch (apiError) {
          console.error('API login error:', apiError);
          Alert.alert('Error', translateData.loginFailed);
        } finally {
          setFirebaseloading(false);
        }
      });

      setTimeout(() => {
        if (!called) {
          called = true;
          unsubscribe();
          Alert.alert('Failed', translateData.timeOut);
          setFirebaseloading(false);
        }
      }, 5000);

    } catch (error) {
      Alert.alert('Failed', translateData.invalidOtp);
      setFirebaseloading(false);
    }
  };


  return (
    <AuthContainer
      topSpace={windowHeight(240)}
      imageShow={true}
      container={
        <View>
          <AuthText
            title={translateData.otpVerification}
            subtitle={
              isEmail
                ? `${translateData.otpSendTo} ${emailOrPhone}`
                : `${translateData.otpSendTo} ${countryCode} ${emailOrPhone}`
            }
          />

          <Text
            style={[
              style.otpTitle,
              {
                color: isDark ? appColors.whiteColor : appColors.primaryText,
                textAlign: textRTLStyle,
              },
            ]}>
            {translateData.otp}
          </Text>
          <View style={[style.inputContainer, { flexDirection: viewRTLStyle }]}>
            <OTPTextInput
              ref={input}
              containerStyle={[
                style.otpContainer,
                { flexDirection: viewRTLStyle },
              ]}
              inputCount={6}
              handleTextChange={value => {
                setOtp(value);
                if (value.length === 6) {
                  otpInputRef.current?.blur();
                }
              }}
              textInputStyle={[
                style.otpInput,
                {
                  backgroundColor: bgFullLayout,
                  color: isDark ? appColors.whiteColor : appColors.blackColor,
                },
              ]}
              keyboardType="numeric"
              tintColor="transparent"
              offTintColor="transparent"
              defaultValue={otp}
            />
          </View>
          <View style={[external.mt_28]}>


            {smsGateway == 'firebase' ? (
              <Button title={translateData.verify} onPress={handleVerifyOtp} loading={firebaseloading} />
            ) : (
              <Button title={translateData.verify} onPress={handleVerify} loading={loading} />
            )}
          </View>
          <View style={[external.mb_15, external.mt_5]}>
            <NewUserComponent
              title={resendTimer > 0 ? `${translateData.resendOtp} ${resendTimer}s` : translateData.NoOtp}
              subtitle={translateData.resendIt}
              onPress={handleResendOtp}
            />

          </View>
        </View>
      }
    />
  );
}


