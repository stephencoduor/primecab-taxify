import { View, Text, TouchableOpacity, Keyboard, Alert } from 'react-native'
import React, { useEffect, useRef, useState } from 'react'
import styles from './styles'
import { Button, notificationHelper } from '../../../../../commonComponents'
import appColors from '../../../../../theme/appColors'
import OTPTextView from 'react-native-otp-textinput'
import { LineAnimation } from '../../../login/component'
import { useNavigation, useTheme, useRoute, useIsFocused } from '@react-navigation/native'
import { NativeStackNavigationProp } from '@react-navigation/native-stack'
import { RootStackParamList } from '../../../../../navigation/main/types'
import { useValues } from '../../../../../utils/context'
import { FirebaseOTPInterface, VerifyOtpInterface } from '../../../../../api/interface/authInterface'
import { selfDriverData, settingDataGet, userVerifyOtp, userLogin, firebaseOTPLogin } from '../../../../../api/store/action/index'
import { useDispatch, useSelector } from 'react-redux'
import { AppDispatch } from '../../../../../api/store/index'
import { getValue, setValue } from '../../../../../utils/localstorage/index'
import { UserLoginInterface } from '../../../../../api/interface/authInterface'
import auth from '@react-native-firebase/auth'

type navigation = NativeStackNavigationProp<RootStackParamList>

const OtpView: React.FC = () => {
  const route = useRoute()
  const demouser = route.params || {}
  const { confirmation, smsGateway } = route.params
  const { translateData, settingData } = useSelector(state => state.setting)
  const demoMode = settingData?.values?.activation?.demo_mode == 1
  const [warning, setWarning] = useState('')
  const [enteredOtp, setEnteredOtp] = useState(demoMode === true ? '123456' : '')
  const { colors } = useTheme()
  const { viewRtlStyle } = useValues()
  const { textRtlStyle, isDark, setToken, token } = useValues()
  const countryCode = route.params?.countryCode ?? '91'
  const phoneNumber = route.params?.phoneNumber ?? '1234567890'
  const cca2 = route?.params?.cca2 ?? 'US'
  const [firebaseloading, setFirebaseloading] = useState()
  const [message, setMessage] = useState<string>('')
  const [fcmToken, setFcmToken] = useState('')
  const [success, setSuccess] = useState<boolean>(false)
  const dispatch = useDispatch<AppDispatch>()
  const { navigate } = useNavigation<navigation>()
  const { loading } = useSelector(state => state.auth)
  const emailOrPhone = demouser?.email_or_phone ?? phoneNumber
  const isEmail = emailOrPhone.includes('@')
  const input = useRef<OTPTextView>(null)
  const isFocused = useIsFocused()

  const handleChange = (otp: string) => {
    setEnteredOtp(otp)
    if (otp.length === 6) {
      Keyboard.dismiss()
      setWarning('')
    }
  }

  useEffect(() => {
    if (enteredOtp.length === 6) {
      Keyboard.dismiss()
      setWarning('')
      handleVerify(enteredOtp)
    }
  }, [enteredOtp, fcmToken])

  useEffect(() => {
    const fetchToken = async () => {
      let fcmToken = await getValue('fcmToken')
      if (fcmToken) {
        setFcmToken(fcmToken)
      }
    }
    fetchToken()
  }, [isFocused])

  const handleVerify = async () => {
    const formatCountryCode = (code: string): string => {
      if (code.startsWith('+')) {
        return code.substring(1)
      }
      return code
    }
    let payload: VerifyOtpInterface = {
      email_or_phone: phoneNumber,
      country_code: formatCountryCode(countryCode),
      token: enteredOtp,
      email: null,
      fcm_token: fcmToken,
    }

    dispatch(userVerifyOtp(payload))
      .unwrap()
      .then((res: any) => {
        if (res.success && res.is_registered) {
          setValue('token', res.access_token)
          setToken(res.access_token)
          if (res?.is_verified == '0') {
            navigate('Verification')
          } else {
            navigate('TabNav')
          }
          dispatch(selfDriverData())
        } else if (res.success && !res.is_registered) {
          navigate('CreateAccount', {
            countryCode,
            phoneNumber,
            cca2,
          })
          dispatch(settingDataGet())
          setSuccess(false)
          setMessage(translateData.noLinkAccount)
        } else if (!res.success) {
          setSuccess(false)
          setMessage(res.message)
        }
      })
      .catch((error: any) => {
        setSuccess(false)
        setMessage(translateData.verifyWarn)
      })
  }

  const ResendOtp = () => {
    let payload: UserLoginInterface = {
      phone: phoneNumber,
      country_code: countryCode,
    }
    dispatch(userLogin(payload))
      .unwrap()
      .then((res: any) => {
        if (res?.success) {
          navigate('Otp', { countryCode, phoneNumber })
          notificationHelper('', translateData.otpSend, 'success')
        } else {
          setSuccess(false)
          setMessage(res.message)
        }
      })
  }

  const handleVerifyOtp = async () => {
    if (!enteredOtp || enteredOtp.length < 6) {
      notificationHelper('', translateData.validOtpEnter, 'error')
      return
    }
    try {
      setFirebaseloading(true)
      const result = await confirmation.confirm(enteredOtp)
      let called = false

      const unsubscribe = auth().onAuthStateChanged(async user => {
        if (called || !user) return

        called = true
        unsubscribe()

        try {
          const idToken = await user.getIdToken()
          const payload: FirebaseOTPInterface = {
            phone: phoneNumber,
            country_code: countryCode.startsWith('+')
              ? countryCode.slice(1)
              : countryCode,
            firebase_token: idToken,
          }

          const loginResult = await dispatch(firebaseOTPLogin(payload)).unwrap()
          if (loginResult?.is_registered === true) {
            setValue('token', loginResult.access_token)
            setToken(loginResult.access_token)
            await dispatch(selfDriverData())
            navigate('TabNav')
          } else {
            navigate('CreateAccount', {
              countryCode,
              phoneNumber,
              cca2,
            })
          }
        } catch (apiError) {
          console.error('API login error:', apiError)
          Alert.alert(translateData.error, translateData.loginFailed)
        } finally {
          setFirebaseloading(false)
        }
      })

      setTimeout(() => {
        if (!called) {
          called = true
          unsubscribe()
          Alert.alert(translateData.error, translateData.authenticationtimedout)
          setFirebaseloading(false)
        }
      }, 5000)
    } catch (error) {
      console.error('OTP Verification Error:', error)
      Alert.alert(translateData.error, translateData.invalidOTP)
      setFirebaseloading(false)
    }
  }

  return (
    <View
      style={[
        styles.otpView,
        { backgroundColor: isDark ? appColors.darkThemeSub : appColors.white },
      ]}
    >
      <View style={styles.subView}>
        <View style={styles.space} />
        <LineAnimation />
        <Text
          style={[
            styles.otpVef,
            { color: colors.text, textAlign: textRtlStyle },
          ]}
        >
          {translateData.otpVerification}
        </Text>

        <Text style={[styles.subtitle, { textAlign: textRtlStyle }]}>
          {isEmail
            ? `${translateData.enterOtp} ${emailOrPhone}`
            : `${translateData.enterOtp} ${countryCode} ${emailOrPhone}`}
        </Text>
        <Text
          style={[
            styles.title,
            { color: colors.text, textAlign: textRtlStyle },
          ]}
        >
          {translateData.otp}
        </Text>
        <View style={[styles.inputContainer, { flexDirection: viewRtlStyle }]}>
          <OTPTextView
            containerStyle={[
              styles.otpContainer,
              { flexDirection: viewRtlStyle },
            ]}
            textInputStyle={[
              styles.otpInput,
              {
                backgroundColor: isDark
                  ? appColors.primaryFont
                  : appColors.graybackground,
                color: colors.text,
              },
            ]}
            handleTextChange={handleChange}
            inputCount={6}
            keyboardType="numeric"
            tintColor="transparent"
            offTintColor="transparent"
            defaultValue={enteredOtp}
          />
        </View>
        {warning !== '' && <Text style={styles.warningText}>{warning}</Text>}
      </View>

      <View style={styles.buttonView}>
        {smsGateway == 'firebase' ? (
          <Button
            title={translateData.verify}
            onPress={handleVerifyOtp}
            loading={firebaseloading}
            backgroundColor={appColors.primary}
            color={appColors.white}
          />
        ) : (
          <Button
            title={translateData.verify}
            onPress={handleVerify}
            backgroundColor={appColors.primary}
            color={appColors.white}
            loading={loading}
          />
        )}
      </View>
      <View style={styles.subView}>
        <View style={[styles.retry, { flexDirection: viewRtlStyle }]}>
          <Text style={styles.notReceive}>{translateData.notReceived}</Text>
          <TouchableOpacity onPress={ResendOtp} activeOpacity={0.7}>
            <Text style={[styles.resend, { color: colors.text }]}>
              {translateData.resendIt}
            </Text>
          </TouchableOpacity>
        </View>
      </View>
    </View>
  )
}

export default OtpView
