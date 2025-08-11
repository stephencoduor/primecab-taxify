import { View, KeyboardAvoidingView, Platform, TouchableOpacity, ScrollView, Text, Image } from 'react-native';
import React, { useState, useEffect } from 'react';
import appColors from '../../../theme/appColors';
import styles from './styles';
import { Button, Header, Input, notificationHelper } from '../../../commonComponents';
import { useNavigation, useTheme } from '@react-navigation/native';
import { useValues } from '../../../utils/context';
import { setValue, getValue, deleteValue } from '../../../utils/localstorage';
import { useDispatch, useSelector } from 'react-redux';
import { Country, getAllCountries } from 'react-native-country-picker-modal';
import { InputBox } from '../../auth/component';
import { selfDriverData } from '../../../api/store/action';
import { ImageContainer } from './imageContainer';
import { URL } from '../../../api/config';
import { windowHeight, windowWidth } from '../../../theme/appConstant';
import { useLoadingContext } from '../../../utils/loadingContext';
import { SkeletonEditProfile } from './skeletonEditProfile';
import { ValidatePhoneNumber } from '../../../utils/validation';
import Images from '../../../utils/images/images';
import AsyncStorage from '@react-native-async-storage/async-storage';

const findCountryByCallingCode = async (code) => {
  const countries = await getAllCountries();
  return countries.find(country => country.callingCode.includes(code));
};

export function ProfileSetting() {
  const dispatch = useDispatch();
  const { goBack } = useNavigation();
  const navigation = useNavigation();
  const { viewRtlStyle } = useValues();
  const [showWarning, setShowWarning] = useState(false);
  const [emailFormatWarning, setEmailFormatWarning] = useState('');
  const { colors } = useTheme();
  const { isDark, rtl, textRtlStyle } = useValues();
  const { selfDriver } = useSelector(state => state.account);
  const [loadingShimmer, setLoadingShimmer] = useState(false);
  const { addressLoaded, setAddressLoaded } = useLoadingContext();
  const { translateData } = useSelector(state => state.setting);
  const [loading, setLoading] = useState(false);
  const [formData, setFormData] = useState({
    username: '',
    phoneNumber: '',
    email: '',
    countryCode: '',
  });
  const [error, setError] = useState('');
  const [profileImg, setProfileImage] = useState();
  const [visible, setVisible] = useState(false);
  const [countryCode1, setCountryCode1] = useState(null);

  useEffect(() => {
    const loadCountry = async () => {
      try {
        let selected = null;

        if (selfDriver?.country_code) {
          const code = selfDriver.country_code.replace('+', '');
          const found = await findCountryByCallingCode(code);
          if (found) {
            selected = {
              callingCode: [found.callingCode[0]],
              cca2: found.cca2,
            };
          }
        }

        if (!selected) {
          const saved = await AsyncStorage.getItem('selectedCountry');
          if (saved) {
            selected = JSON.parse(saved);
          }
        }

        setCountryCode1(selected);
        setFormData(prev => ({
          ...prev,
          countryCode: selected ? `+${selected.callingCode[0]}` : '',
          username: selfDriver?.name ?? '',
          phoneNumber: selfDriver?.phone ?? '',
          email: selfDriver?.email ?? '',
        }));
      } catch (err) {
      }
    };

    loadCountry();
  }, [selfDriver]);

  useEffect(() => {
    if (!addressLoaded) {
      setLoadingShimmer(true);
      setLoadingShimmer(false);
      setAddressLoaded(true);
    }
  }, [addressLoaded, setAddressLoaded]);


  const handlePhoneNumberChange = (newPhoneNumber: string) => {
    const errorMsg = ValidatePhoneNumber(newPhoneNumber);
    setFormData(prevData => ({
      ...prevData,
      phoneNumber: newPhoneNumber,
    }));
    if (errorMsg) {
      setError(errorMsg);
      return;
    }
    setError('');
  };

  const update = async () => {
    setLoading(true);
    const token = await getValue('token');

    try {
      const updateFormData = new FormData();
      updateFormData.append('name', formData.username);
      updateFormData.append('email', formData.email);
      updateFormData.append('country_code', formData.countryCode);
      updateFormData.append('phone', formData.phoneNumber);
      updateFormData.append('_method', 'PUT');

      if (profileImg) {
        updateFormData.append('profile_image', {
          uri: profileImg.uri,
          type: profileImg.type,
          name: profileImg.fileName,
        });
      }

      const response = await fetch(`${URL}/api/updateProfile`, {
        method: 'POST',
        body: updateFormData,
        headers: {
          'Content-Type': 'multipart/form-data',
          Authorization: `Bearer ${token}`,
        },
      });

      if (response.status == 403) {
        notificationHelper('', translateData.pleaseloginagain, 'error');
        await deleteValue('token');
        navigation.reset({ index: 0, routes: [{ name: 'Login' }] });
        return;
      }

      if (!response.ok) {
        notificationHelper('', translateData.failedprofile, 'error');
      }

      dispatch(selfDriverData());
      notificationHelper('', translateData.profileUpdatedSuccessfully, 'success');
      goBack();
      if (profileImg) {
        setValue('profile_image_uri', profileImg.uri);
      }
    } catch (error) {
      notificationHelper('', translateData.profileupdatefailed, 'error');
    } finally {
      setLoading(false);
    }
  };

  const handleChange = (key: string, value: string) => {
    setFormData(prevData => ({ ...prevData, [key]: value }));
    if (key === 'email') {
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      setEmailFormatWarning(emailRegex.test(value) ? '' : 'Invalid email format');
    }
  };

  const getData = img => {
    setProfileImage(img);
  };

  return (
    <KeyboardAvoidingView style={styles.main} behavior={Platform.OS === 'ios' ? 'padding' : 'height'} keyboardVerticalOffset={Platform.OS === 'ios' ? 0 : -200}>
      <Header title={translateData.profileSettings} />
      <ScrollView showsVerticalScrollIndicator={false}>
        <View style={[styles.profileView, { backgroundColor: colors.card, borderColor: colors.border }]}>
          {loadingShimmer ? (
            <SkeletonEditProfile />
          ) : (
            <>
              <View style={{ position: 'absolute', width: '100%', height: windowHeight(90) }}>
                <Image source={Images.profileBackground} style={{ width: '100%', height: windowHeight(12.9), bottom: windowHeight(7), borderTopLeftRadius: windowHeight(1), borderTopRightRadius: windowHeight(1) }} />
              </View>
              <ImageContainer data={selfDriver} storeProfile={getData} />
              <View style={styles.fieldView}>
                <Input title={translateData.userName} titleShow={true} placeholder={translateData.enterUserName} keyboardType="default" value={formData.username} onChangeText={text => handleChange('username', text)} showWarning={showWarning && formData.username === ''} warning={translateData.enterYouruserName} backgroundColor={isDark ? appColors.bgDark : appColors.graybackground} borderColor={isDark ? appColors.bgDark : appColors.graybackground} />
                <Text style={[styles.mobileNumber, { color: isDark ? appColors.white : appColors.primaryFont, textAlign: textRtlStyle }]}>{translateData.mobileNumber}</Text>
                <View style={[styles.countryContainer, { flexDirection: viewRtlStyle }]}>
                  <View style={[styles.codeComponent, { right: rtl ? windowWidth(2.5) : windowWidth(0) }]}>
                    <TouchableOpacity activeOpacity={1} style={[styles.pickerButton, { backgroundColor: isDark ? appColors.bgDark : appColors.graybackground, borderColor: isDark ? appColors.bgDark : appColors.graybackground }]} onPress={() => setVisible(true)}>
                      <Text style={[styles.codeText, { color: isDark ? appColors.white : appColors.secondaryFont }]}>{formData.countryCode}</Text>
                    </TouchableOpacity>
                  </View>
                  <InputBox placeholder={translateData.enterPhone} placeholderTextColor={isDark ? appColors.darkText : appColors.secondaryFont} value={String(formData.phoneNumber)} onChangeText={handlePhoneNumberChange} keyboardType={'phone-pad'} backgroundColors={isDark ? appColors.bgDark : appColors.graybackground} backgroundColor={isDark ? appColors.bgDark : appColors.graybackground} borderColor={isDark ? appColors.bgDark : appColors.graybackground} editable={false} style={{ color: appColors.secondaryFont }} />
                </View>
                {error && <Text style={[styles.errorText, { textAlign: textRtlStyle }]}>{error}</Text>}
                <View style={styles.emailContainer}>
                  <Input titleShow title={translateData.email} placeholder={translateData.enterEmail} keyboardType="email-address" value={formData.email} backgroundColor={isDark ? appColors.bgDark : appColors.graybackground} borderColor={isDark ? appColors.bgDark : appColors.graybackground} onChangeText={text => handleChange('email', text)} showWarning={showWarning && (formData.email === '' || emailFormatWarning !== '')} warning={emailFormatWarning !== '' ? translateData.enterYouremail : translateData.emailVerify} editable={false} />
                </View>
              </View>
            </>
          )}
        </View>
      </ScrollView>
      {!loadingShimmer && (
        <View style={styles.updateBtn}>
          <Button title={translateData.updateProfile} backgroundColor={appColors.primary} color={appColors.white} onPress={update} loading={loading} />
        </View>
      )}
    </KeyboardAvoidingView>
  );
}
