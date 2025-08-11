import { View, Text, TouchableOpacity } from 'react-native'
import React, { useCallback, useEffect, useState } from 'react'
import appColors from '../../../../../theme/appColors'
import styles from './styles'
import { Button } from '../../../../../commonComponents'
import { InputBox } from '../../../component'
import LoginViewProps from '../../types'
import { useFocusEffect, useTheme } from '@react-navigation/native'
import { useValues } from '../../../../../utils/context'
import { useDispatch, useSelector } from 'react-redux'
import { AppDispatch } from '../../../../../api/store'
import { windowHeight, windowWidth } from '../../../../../theme/appConstant'
import { AuthTitle } from '../authtitle'
import { translateDataGet } from '../../../../../api/store/action'
import { validateEmail, ValidatePhoneNumber } from '../../../../../utils/validation'
import CountryPicker, { getAllCountries } from 'react-native-country-picker-modal';

export function LoginView({ gotoOTP, gotoOTP1, phoneNumber, setPhoneNumber, setCountryCode, borderColor, setDemouser, setCca2, driverLoading, setDriverLoading, smsGateway }: LoginViewProps) {
  const [fleetLoading, setFleetLoading] = useState(false)
  const [error, setError] = useState('')
  const { colors } = useTheme()
  const { textRtlStyle, viewRtlStyle, isDark, rtl } = useValues()
  const dispatch = useDispatch<AppDispatch>()
  const { translateData, settingData, taxidoSettingData } = useSelector(state => state.setting)
  const [numberShow, setNumberShow] = useState(true)

  const [country, setCountry] = useState({
    callingCode: ['1'],
    cca2: 'US',
    emoji: '',
  });


  useEffect(() => {
    const fetchCountryFromCode = async () => {
      const code = taxidoSettingData?.taxido_values?.ride?.country_code;

      if (code) {
        try {
          const countries = await getAllCountries();
          const match = countries.find((c) =>
            c.callingCode.includes(code.toString())
          );

          if (match) {
            setCountry({
              callingCode: [code.toString()],
              cca2: match.cca2,
              emoji: '',
            });
          }
        } catch (err) {
          console.error('Error fetching countries:', err);
        }
      }
    };

    fetchCountryFromCode();
  }, [taxidoSettingData?.taxido_values?.ride?.country_code]);


  useFocusEffect(
    useCallback(() => {
      dispatch(translateDataGet())
    }, [dispatch]),
  )

  const handlePhoneNumberChange = (newPhoneNumber: string) => {
    if (smsGateway === 'firebase') {
      const onlyNumbers = newPhoneNumber.replace(/[^0-9]/g, '');
      setPhoneNumber(onlyNumbers);
      setNumberShow(true);

      const errorMsg = ValidatePhoneNumber(onlyNumbers);
      if (errorMsg) {
        setError(errorMsg);
      } else {
        setError('');
      }
      return;
    }

    setPhoneNumber(newPhoneNumber);

    const isNumeric = /^\d+$/.test(newPhoneNumber);
    setNumberShow(isNumeric);

    if (isNumeric) {
      const errorMsg = ValidatePhoneNumber(newPhoneNumber);
      if (errorMsg) {
        setError(errorMsg);
        return;
      }
    } else if (newPhoneNumber.includes('@')) {
      const errorMsg = validateEmail(newPhoneNumber);
      if (errorMsg) {
        setError(errorMsg);
        return;
      }
    } else {
      setError('');
      return;
    }
    setError('');
  };

  const handleGetOTP = async (userType: string) => {
    setDriverLoading(true);
    const isNumeric = /^\d+$/.test(phoneNumber);

    if (isNumeric) {
      const errorMsg = ValidatePhoneNumber(phoneNumber);
      if (errorMsg) {
        setError(errorMsg);
        setDriverLoading(false);
        return;
      }
    } else if (phoneNumber.includes('@')) {
      const errorMsg = validateEmail(phoneNumber);
      if (errorMsg) {
        setError(errorMsg);
        setDriverLoading(false);
        return;
      }
    } else {
      setError(translateData.validPhoneEmail);
      setDriverLoading(false);
      return;
    }

    setError('');
    try {
      await gotoOTP(userType);
    } finally {
      setDriverLoading(false);
    }
  };

  const handleGetOTP1 = async (userType: string) => {
    setFleetLoading(true);
    const isNumeric = /^\d+$/.test(phoneNumber);

    if (isNumeric) {
      const errorMsg = ValidatePhoneNumber(phoneNumber);
      if (errorMsg) {
        setError(errorMsg);
        setFleetLoading(false);
        return;
      }
    } else if (phoneNumber.includes('@')) {
      const errorMsg = validateEmail(phoneNumber);
      if (errorMsg) {
        setError(errorMsg);
        setFleetLoading(false);
        return;
      }
    } else {
      setError(translateData.validPhoneEmail);
      setFleetLoading(false);
      return;
    }

    setError('');
    try {
      await gotoOTP1(userType);
    } finally {
      setFleetLoading(false);
    }
  };



  const goDemoUser = () => {
    setPhoneNumber('1234567890')
    setDemouser(true)
  }

  const [visible, setVisible] = useState(false);


  const onSelect = (selectedCountry) => {
    setCountry(selectedCountry);
    setVisible(false);
    if (setCountryCode) {
      setCountryCode(`+${selectedCountry.callingCode[0]}`);
    }
    if (setCca2) {
      setCca2(selectedCountry.cca2);
    }

  };


  return (
    <View
      style={[
        styles.main,
        { backgroundColor: isDark ? appColors.darkThemeSub : appColors.white },
      ]}
    >
      <View style={styles.subView}>
        <AuthTitle
          title={translateData.authTitle}
          subTitle={translateData.subTitle}
        />

        <View
          style={[
            styles.countryCodeContainer,
            {
              flexDirection: viewRtlStyle,
              justifyContent: numberShow ? 'flex-start' : 'center',
              alignSelf: 'center',
              width: '100%',
            },
          ]}
        >
          {numberShow && (
            <View
              style={[
                styles.codeComponent,
                {
                  marginRight: rtl ? 0 : windowWidth(2),
                  marginLeft: rtl ? windowWidth(2) : 0,
                },
              ]}
            >

              <TouchableOpacity
                style={[
                  styles.countryCode,
                  {
                    backgroundColor: isDark ? appColors.primaryFont : appColors.graybackground,
                    borderColor: borderColor ? borderColor : colors.border,
                  },
                ]}
                onPress={() => setVisible(true)}
              >
                <View style={styles.pickerButton}>
                  <CountryPicker
                    countryCode={country.cca2}
                    withFilter={true}
                    withFlag={true}
                    withCallingCode={true}
                    withAlphaFilter={true}
                    withEmoji={true}
                    onSelect={onSelect}
                    visible={visible}
                    onClose={() => setVisible(false)}
                  />
                  <Text style={[styles.codeText, { color: isDark ? appColors.white : appColors.black }]}>
                    {country.emoji} +{country.callingCode[0]}
                  </Text>
                </View>
              </TouchableOpacity>

            </View>
          )}

          <InputBox
            placeholder={translateData.enterPhoneandEmailBoth}
            placeholderTextColor={
              isDark ? appColors.darkText : appColors.secondaryFont
            }
            value={phoneNumber}
            onChangeText={handlePhoneNumberChange}
            keyboardType={
              smsGateway === 'firebase' ? 'phone-pad' : 'default'
            } backgroundColors={
              isDark ? appColors.primaryFont : appColors.graybackground
            }
            borderColor={
              isDark ? appColors.primaryFont : appColors.graybackground
            }
            style={{
              flex: 1,
              marginLeft: numberShow && !rtl ? windowWidth(1.5) : 0,
              marginRight: numberShow && rtl ? windowWidth(1.5) : 0,
              height: numberShow ? windowHeight(6) : windowHeight(6.7),
              color: isDark ? appColors.darkText : appColors.secondaryFont
            }}
          />
        </View>

        {error && (
          <Text style={[styles.errorText, { textAlign: textRtlStyle }]}>
            {error}
          </Text>
        )}
      </View>

      <View style={styles.button}>
        <View style={{
          flexDirection: 'row', justifyContent: 'space-between', alignSelf: 'center'
        }}>
          <View style={{ width: '100%' }}>
            <Button
              onPress={() => handleGetOTP('driver')}
              title={translateData.getOtp}
              backgroundColor={appColors.primary}
              color={appColors.white}
              loading={driverLoading} />
          </View>
        </View>

      </View>
      {/* {
        settingData?.values?.activation?.demo_mode == 1 ? (
          <View style={styles.demoBtn}>
            <Button
              onPress={goDemoUser}
              title={translateData.demoDriver}
              color={appColors.primary}
              borderColor={appColors.primary}
              borderWidth={windowHeight(0.1)}
            />
          </View>
        ) : null
      } */}
      <View style={styles.subView}></View>
    </View >
  )
}

