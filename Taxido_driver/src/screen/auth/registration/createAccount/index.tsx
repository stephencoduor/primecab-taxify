import React, { useEffect, useState } from 'react'
import { View, TouchableOpacity, Text, TextInput, ScrollView } from 'react-native'
import appColors from '../../../../theme/appColors'
import { ProgressBar } from '../component'
import { Input, Button } from '../../../../commonComponents'
import { useNavigation, useTheme } from '@react-navigation/native'
import { Header, TitleView } from '../../component'
import styles from './styles'
import { NativeStackNavigationProp } from '@react-navigation/native-stack'
import { RootStackParamList } from '../../../../navigation/main/types'
import Icons from '../../../../utils/icons/icons'
import { useValues } from '../../../../utils/context'
import { windowWidth } from '../../../intro/onBoarding/styles'
import { useSelector } from 'react-redux'
import { useAppRoute } from '../../../../utils/navigation'
import { ValidatePhoneNumber } from '../../../../utils/validation'
import { windowHeight } from '../../../../theme/appConstant'
import CountryPicker from 'react-native-country-picker-modal';

type navigation = NativeStackNavigationProp<RootStackParamList>

export function CreateAccount() {
  const navigation = useNavigation<navigation>()
  const [showWarning, setShowWarning] = useState(false)
  const [emailFormatWarning, setEmailFormatWarning] = useState('')
  const { colors } = useTheme()
  const { textRtlStyle, viewRtlStyle, isDark, setAccountDetail, rtl } = useValues()
  const [show, setShow] = useState(false)
  const [phoneNumber, setPhoneNumber] = useState('')
  const [isPasswordVisible, setIsPasswordVisible] = useState(false)
  const [isConfirmPasswordVisible, setIsConfirmPasswordVisible] = useState(false)
  const { translateData } = useSelector(state => state.setting)
  const route = useAppRoute();
  const usercredential = route.params?.phoneNumber ?? "1234567890";
  const rawCode = route.params?.countryCode ?? "91";
  const cleanCode = rawCode.replace('+', '');
  const [countryCode, setCountryCode] = useState({
    callingCode: [cleanCode],
    cca2: route?.params?.cca2 ?? 'US',
  });


  const [email, setEmail] = useState("");
  const [isEmailUser, setIsEmailUser] = useState(false);
  const [selectedRole, setSelectedRole] = useState(null);


  useEffect(() => {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    const isEmail = emailRegex.test(usercredential.trim());

    setIsEmailUser(isEmail);

    if (isEmail) {
      setEmail(usercredential.trim());
    } else {
      setPhoneNumber(usercredential.trim());
    }
  }, [usercredential]);


  const [formData, setFormData] = useState({
    username: '',
    name: '',
    phoneNumber: '',
    email: '',
    password: '',
    confirmPassword: '',
    countryCode: countryCode,
  })

  const [error, setError] = useState({
    username: '',
    name: '',
    phoneNumber: '',
    email: '',
    password: '',
    confirmPassword: '',
    countryCode: countryCode,
  })



  useEffect(() => {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    const isEmail = emailRegex.test(usercredential.trim());
    setIsEmailUser(isEmail);

    if (isEmail) {
      const cleanEmail = usercredential.trim();
      setEmail(cleanEmail);
      setFormData(prev => ({ ...prev, email: cleanEmail }));
    } else {
      const cleanPhone = usercredential.trim();
      setPhoneNumber(cleanPhone);
      setFormData(prev => ({ ...prev, phoneNumber: cleanPhone }));
    }
  }, [usercredential]);

  const handleChange = (key: string, value: string) => {
    if (key === 'phoneNumber') {


      setFormData(prev => ({
        ...prev,
        [key]: numericValue,
      }));
    } else {
      setFormData(prev => ({
        ...prev,
        [key]: value,
      }));
    }

    if (key === 'email') {
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if (value.trim() === '') {
        setEmailFormatWarning(translateData.emailVerifyyyyy);

      } else if (!emailRegex.test(value.trim())) {
        setEmailFormatWarning(translateData.emailformateteee);

      } else {
        setEmailFormatWarning('');
      }
    }
  };



  const gotoDocument = () => {
    const phone = formData.phoneNumber.trim();
    const phoneError = ValidatePhoneNumber(phone);
    const email = formData.email.trim();
    const isPasswordEmpty = formData.password.trim() === '';
    const isConfirmPasswordEmpty = formData.confirmPassword.trim() === '';
    const doPasswordsMatch = formData.password === formData.confirmPassword;

    const newErrors = {
      phoneNumber: '',
      email: '',
      password: '',
      confirmPassword: '',
    };

    let hasError = false;

    if (isEmailUser && phoneError) {
      newErrors.phoneNumber = phoneError;
      hasError = true;
    }

    if (!isEmailUser) {
      if (email === '') {
        newErrors.email = translateData.enterYourEmail;
        hasError = true;
      } else if (emailFormatWarning !== '') {
        newErrors.email = translateData.emailformate;
        hasError = true;
      }
    }

    if (isPasswordEmpty) {
      newErrors.password = translateData.password;
      hasError = true;
    }

    if (isConfirmPasswordEmpty) {
      newErrors.confirmPassword = translateData.password;
      hasError = true;
    }

    if (!doPasswordsMatch) {
      newErrors.confirmPassword = translateData.doNotMatch;
      hasError = true;
    }

    if (hasError) {
      setShowWarning(true);
      setError(newErrors);
      return;
    }

    setShowWarning(false);
    setError({
      phoneNumber: '',
      email: '',
      password: '',
      confirmPassword: '',
    });

    setAccountDetail(formData);
    navigation.navigate('UploadedDocument');
  };


  const [visible, setVisible] = useState(false);
  const onSelect = (country) => {
    setCountryCode(country);
    setVisible(false);
  };


  return (
    <View style={{ flex: 1 }}>
      <Header backgroundColor={isDark ? colors.card : appColors.white} />
      <ProgressBar fill={1} />
      <ScrollView
        style={[styles.subView, { backgroundColor: colors.background }]}
        showsVerticalScrollIndicator={false}
      >
        <View style={styles.space}>
          <TitleView
            title={translateData.createAccount}
            subTitle={translateData.registerContent}
          />
      
          <View style={styles.name}>
            <Input
              title={translateData.name}
              titleShow={true}
              placeholder={translateData.enterYourName}
              value={formData.name}
              onChangeText={text => handleChange('name', text)}
              showWarning={showWarning && formData.name === ''}
              warning={translateData.pleaseEnterYourName}
              backgroundColor={
                isDark ? appColors.darkThemeSub : appColors.white
              }
              borderColor={colors.border}
            />
          </View>
          <Text
            style={[
              styles.mobileNumber,
              {
                color: isDark ? appColors.white : appColors.primaryFont,

                textAlign: textRtlStyle,
              },
            ]}
          >
            {translateData.mobileNumber}
          </Text>

          <View style={styles.country}>
            <View style={{ flexDirection: viewRtlStyle, width: '100%' }}>
              <View
                style={[
                  styles.codeComponent,
                  { right: rtl ? windowWidth(12) : windowWidth(0.5) },
                ]}
              >

                <TouchableOpacity

                  style={[
                    styles.countryCode,
                    {
                      backgroundColor: isDark
                        ? appColors.darkThemeSub
                        : appColors.white,
                      borderColor: colors.border,
                    },
                  ]}
                >
                  <TouchableOpacity style={styles.pickerButton}
                    onPress={() => setVisible(true)}
                  >


                    <CountryPicker
                      countryCode={countryCode.cca2}
                      withFilter={true}
                      withFlag={true}
                      withCallingCode={true}
                      withAlphaFilter={true}
                      withEmoji={true}
                      onSelect={onSelect}
                      visible={visible}

                    />

                    <Text style={[styles.codeText, { color: isDark ? appColors.white : appColors.black }]}>
                      +{countryCode.callingCode[0]}
                    </Text>


                  </TouchableOpacity>


                </TouchableOpacity>
              </View>
              <View
                style={[
                  styles.phone,
                  {
                    backgroundColor: colors.card,
                    borderColor: colors.border,
                    flexDirection: viewRtlStyle,
                  },
                ]}
              >
                <TextInput
                  editable={isEmailUser}
                  placeholder={translateData.enterPhone}
                  placeholderTextColor={isDark ? appColors.darkText : appColors.secondaryFont}
                  value={phoneNumber}

                  onChangeText={(text) => {
                    const phoneNoError = ValidatePhoneNumber(text);
                    setError(phoneNoError)

                    setPhoneNumber(text);
                    setFormData(prev => ({
                      ...prev,
                      phoneNumber: text,
                    }));
                  }}
                  keyboardType="phone-pad"
                  style={[
                    styles.number,
                    {
                      backgroundColor: isDark ? appColors.darkThemeSub : appColors.white,
                    },
                    { color: isDark ? appColors.white : appColors.black },
                  ]}
                />

              </View>

            </View>
        

            {isEmailUser && error.phoneNumber ? (
              <Text style={[styles.errorText, { textAlign: textRtlStyle }]}>
                {error.phoneNumber}
              </Text>
            ) : null}


          </View>
          <View style={styles.email}>

            <Input
              editable={!isEmailUser}
              title={translateData.email}
              titleShow={true}
              placeholder={translateData.enterEmail}
              keyboardType="email-address"
              value={email}
              onChangeText={(text) => {
                setEmail(text);
                handleChange('email', text);
              }}
              warning={translateData.emailVerify}
              backgroundColor={
                isDark ? appColors.darkThemeSub : appColors.white
              }
              borderColor={colors.border}
            />

          </View>
          <View style={{ bottom: windowHeight(0.8) }}>
            {!isEmailUser && emailFormatWarning !== '' && (
              <Text style={[styles.errorText, { textAlign: textRtlStyle }]}>
                {emailFormatWarning}
              </Text>
            )}
          </View>



          <Input
            title={translateData.createaccount}
            titleShow={true}
            placeholder={translateData.password}
            value={formData.password}
            warning={
              showWarning && formData.password === ''
                ? translateData.password
                : formData.password.length > 0 && formData.password.length < 8
                  ? translateData.passwordMinLength
                  : ''
            }
            onChangeText={text => handleChange('password', text)}
            showWarning={
              showWarning &&
              (formData.password === '' || formData.password.length < 8)
            }
            backgroundColor={isDark ? appColors.darkThemeSub : appColors.white}
            borderColor={colors.border}
            rightIcon={
              <TouchableOpacity
                activeOpacity={0.7}
                onPress={() => setIsPasswordVisible(!isPasswordVisible)}
              >
                {isPasswordVisible ? <Icons.EyeOpen /> : <Icons.EyeClose />}
              </TouchableOpacity>
            }
            secureText={!isPasswordVisible}
          />

          <View style={styles.password}>
            <Input
              title={translateData.cPw}
              titleShow={true}
              placeholder={translateData.confirmPassword}
              value={formData.confirmPassword}
              warning={
                showWarning && formData.confirmPassword === ''
                  ? translateData.confirmPassword
                  : formData.password !== formData.confirmPassword &&
                    formData.confirmPassword !== ''
                    ? translateData.doNotMatchhhhh
                    : ''
              }
              onChangeText={text => handleChange('confirmPassword', text)}
              showWarning={
                (showWarning && formData.confirmPassword === '') ||
                (formData.password !== formData.confirmPassword &&
                  formData.confirmPassword !== '')
              }
              backgroundColor={
                isDark ? appColors.darkThemeSub : appColors.white
              }
              borderColor={colors.border}
              rightIcon={
                <TouchableOpacity
                  activeOpacity={0.7}
                  onPress={() =>
                    setIsConfirmPasswordVisible(!isConfirmPasswordVisible)
                  }
                >
                  {isConfirmPasswordVisible ? (
                    <Icons.EyeOpen />
                  ) : (
                    <Icons.EyeClose />
                  )}
                </TouchableOpacity>
              }
              secureText={!isConfirmPasswordVisible}
            />
          </View>
        </View>
        <View style={styles.margin}>
          <Button
            onPress={gotoDocument}
            title={translateData.next}
            backgroundColor={appColors.primary}
            color={appColors.white}
          />
        </View>
      </ScrollView>
    </View>
  )
}




