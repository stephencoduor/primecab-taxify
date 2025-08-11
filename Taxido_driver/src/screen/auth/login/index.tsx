import React, { useState, useCallback, useMemo, useEffect } from 'react';
import { Alert, View } from 'react-native';
import { useIsFocused } from '@react-navigation/native';
import { useDispatch, useSelector } from 'react-redux';
import styles from './styles';
import appColors from '../../../theme/appColors';
import { Background, Header } from '../component';
import { LoginView } from './component/';
import { useValues } from '../../../utils/context';
import { AppDispatch } from '../../../api/store';
import { userLogin } from '../../../api/store/action';
import { notificationHelper } from '../../../commonComponents';
import { DriverLoginInterface } from '../../../api/interface/authInterface';
import { getValue, setValue } from '../../../utils/localstorage';
import { useAppNavigation } from '../../../utils/navigation';
import { getFcmToken } from '../../../utils/pushNotificationHandler';
import auth from '@react-native-firebase/auth';
import useSmartLocation from '../../../commonComponents/helper/locationHelper';


export function Login() {
  const { translateData, settingData } = useSelector((state: any) => state.setting);
  const smsGateway = settingData?.values?.general?.default_sms_gateway;
  const [cca2, setCca2] = useState(smsGateway === 'firebase' ? 'IN' : 'US');
  const { isDark, setToken } = useValues();
  const dispatch = useDispatch<AppDispatch>();
  const navigation = useAppNavigation();
  const [phoneNumber, setPhoneNumber] = useState('');
  const [countryCode, setCountryCode] = useState(smsGateway === 'firebase' ? '+91' : '+1');
  const [demouser, setDemouser] = useState(false);
  const [fcmToken, setFcmToken] = useState('');
  const isFocused = useIsFocused();
  const { currentLatitude, currentLongitude } = useSmartLocation();
  const formattedCountryCode = useMemo(() => {
    return countryCode.startsWith('+') ? countryCode.substring(1) : countryCode;
  }, [countryCode]);
  const [driverLoading, setDriverLoading] = useState(false)

  useEffect(() => {
    const fetchToken = async () => {
      try {
        const token = await getValue('fcmToken');
        if (token) {
          setFcmToken(token);
        } else {
          const newToken = await getFcmToken();
          if (newToken) {
            setFcmToken(newToken);
            await setValue('fcmToken', newToken);
          }
        }
      } catch (error) {
        console.error("Error fetching FCM token:", error);
      }
    };
    if (isFocused) {
      fetchToken();
    }
  }, [isFocused]);

  const gotoOTP = useCallback(async (userType: string) => {
    setDriverLoading(true)
    const payload: DriverLoginInterface = {
      email_or_phone: phoneNumber,
      country_code: formattedCountryCode,
      fcm_token: fcmToken
    };

    try {
      const res = await dispatch(userLogin(payload)).unwrap();
      if (res?.success) {
        await setValue('userType', userType);
        navigation.navigate('Otp', {
          countryCode,
          phoneNumber,
          demouser,
          cca2,
        });
        notificationHelper('', translateData?.otpSend || 'OTP has been sent.', 'success');
        setDriverLoading(false)
      } else {
        notificationHelper('', res.message, 'error');
        setDriverLoading(false)
      }
    } catch (error) {
      notificationHelper('', translateData.loginFailed, 'error');
      console.error('Login error:', error);
      setDriverLoading(false)
    }
  }, [dispatch, phoneNumber, formattedCountryCode, navigation, demouser, translateData, cca2, countryCode, fcmToken]);

  const gotoOTP1 = useCallback(async (userType: string) => {
    setDriverLoading(true)
    const payload: DriverLoginInterface = {
      email_or_phone: phoneNumber,
      country_code: formattedCountryCode,
      fcm_token: fcmToken
    };

    try {
      const res = await dispatch(userLogin(payload)).unwrap();
      if (res?.success) {
        await setValue('userType', userType);
        navigation.navigate('Otp', {
          countryCode,
          phoneNumber,
          demouser,
          cca2,
        });
        notificationHelper('', translateData?.otpSend || 'OTP has been sent.', 'success');
        setDriverLoading(false)
      } else {
        notificationHelper('', res.message, 'error');
        setDriverLoading(false)
      }
    } catch (error) {
      notificationHelper('', translateData.loginFailed, 'error');
      console.error('Login error:', error);
      setDriverLoading(false)
    }
  }, [dispatch, phoneNumber, formattedCountryCode, navigation, demouser, translateData, cca2, countryCode, fcmToken]);


  const handleSendOtp = async () => {
    setDriverLoading(true)
    const formatCountryCode = (code: string): string => {
      return code.startsWith('+') ? code.substring(1) : code;
    };

    const sanitizedPhone = phoneNumber.replace(/^0+/, '');

    try {
      const fullPhoneNumber = `+${formatCountryCode(countryCode)}${sanitizedPhone}`;
      const confirmation = await auth().signInWithPhoneNumber(fullPhoneNumber);
      navigation.navigate('Otp', {
        confirmation,
        countryCode: countryCode.startsWith('+') ? countryCode : `+${countryCode}`,
        phoneNumber: sanitizedPhone,
        demouser,
        cca2,
        smsGateway,
      });
      setDriverLoading(false)
    } catch (error) {
      setDriverLoading(false)
      Alert.alert(translateData.errorsendingOTP, error.message || translateData.somethingwentwrong);
    }
  };


  return (
    <View
      style={[
        styles.main,
        {
          backgroundColor: isDark ? appColors.darkThemeSub : appColors.graybackground,
        },
      ]}
    >
      <Header
        showBackButton={false}
        backgroundColor={isDark ? appColors.bgDark : appColors.graybackground}
      />
      <Background />
      <View style={styles.loginView}>
        <LoginView

          gotoOTP={() => {
            if (demouser) {
              gotoOTP('driver');
            } else if (smsGateway == 'firebase') {
              handleSendOtp();
            } else {
              gotoOTP('driver');
            }
          }}
          driverLoading={driverLoading}
          setDriverLoading={setDriverLoading}
          gotoOTP1={gotoOTP1}
          phoneNumber={phoneNumber}
          setPhoneNumber={setPhoneNumber}
          countryCode={countryCode}
          setCountryCode={setCountryCode}
          borderColor={isDark ? appColors.primaryFont : appColors.graybackground}
          setCca2={setCca2}
          demouser={demouser}
          setDemouser={setDemouser}
          smsGateway={smsGateway}
        />
      </View>
    </View>
  );
}
