import React, { useState, useEffect } from 'react'
import { View, Text, ScrollView } from 'react-native'
import styles from './styles'
import appColors from '../../../../theme/appColors'
import { ProgressBar } from '../component'
import { Input, Button, notificationHelper } from '../../../../commonComponents'
import { useIsFocused, useNavigation, useTheme } from '@react-navigation/native'
import { Header, TitleView } from '../../component'
import { RenderVehicleList, RenderServiceList, RenderCategoryReg } from './component'
import { NativeStackNavigationProp } from '@react-navigation/native-stack'
import { RootStackParamList } from '../../../../navigation/main/types'
import { useValues } from '../../../../utils/context'
import { useDispatch, useSelector } from 'react-redux'
import { driverRuleGet } from '../../../../api/store/action/driverRuleAction'
import { fontSizes, windowHeight } from '../../../../theme/appConstant'
import { getValue, setValue } from '../../../../utils/localstorage'
import { selfDriverData } from '../../../../api/store/action'
import { URL } from '../../../../api/config'
import firestore from '@react-native-firebase/firestore'

type Navigation = NativeStackNavigationProp<RootStackParamList>

export function VehicleRegistration() {
  const navigation = useNavigation<Navigation>()
  const { colors } = useTheme()
  const { textRtlStyle, setVehicleDetail, viewRtlStyle, isDark, accountDetail, documentDetail, setToken } = useValues()
  const [selectedIds, setSelectedIds] = useState<number[]>([])
  const [showWarning, setShowWarning] = useState(false)
  const [selectedItemIndex, setSelectedItemIndex] = useState<number>(null)
  const [selectedService, setSelectedService] = useState('')
  const [categoryIndex, setCategoryIndex] = useState<number>(null)
  const [selectedCategory, setSelectedCategory] = useState('')
  const [vehicleIndex, setVehicleIndex] = useState<number>(null)
  const [selectedVehicle, setSelectedVehicle] = useState('')
  const [selectedServiceID, setSelectedServiceID] = useState()
  const [selectedCategoryID, setSelectedCategoryID] = useState()
  const [selectedVehicleID, setSelectedVehicleID] = useState<number | undefined>(undefined)
  const { driverRulesData } = useSelector((state: any) => state.driverRule)
  const [loading, setLoading] = useState(false)
  const [fcmToken, setFcmToken] = useState('')
  const isFocused = useIsFocused();
  const { translateData } = useSelector(state => state.setting)
  const { vehicleTypedata } = useSelector((state: any) => state.vehicleType)

  const [formDatas, setFormData] = useState({
    serviceName: '',
    serviceCategory: '',
    vehicleType: '',
    vehicleName: '',
    vehicleNumber: '',
    vehicleColor: '',
    maximumSeats: '',
    ambulanceName: '',
    ambulanceDescription: '',
  })

  useEffect(() => {
    const fetchToken = async () => {
      let fcmToken = await getValue('fcmToken')
      if (fcmToken) {
        setFcmToken(fcmToken)
      }
    }
    fetchToken()
  }, [isFocused])

  useEffect(() => {
    setFormData(prevData => ({
      ...prevData,
      serviceName: selectedServiceID,
      serviceCategory: selectedCategoryID,
      vehicleType: selectedVehicleID,
    }))
  }, [selectedServiceID, selectedCategoryID, selectedVehicleID])
  const dispatch = useDispatch()

  useEffect(() => {
    getService()
  }, [])

  const getService = () => {
    dispatch(driverRuleGet())
  }

  const handleChange = (key: string, value: string) => {
    setFormData(prev => ({ ...prev, [key]: value }))

    if (key === 'maximumSeats' && selectedVehicleSeat) {
      const seat = Number(value)
      if (seat >= 1 && seat <= selectedVehicleSeat) {
        setSeatError(false)
      } else {
        setSeatError(true)
      }
    }
  }

  const handleItemPress = (index: number, slug: string, id: number, name: string) => {
    setSelectedItemIndex(index)
    setSelectedServiceID(id)
    setSelectedService(slug)
    setShowServiceError(false)
  }

  const handleCategoryPress = (
    index: number,
    categoryName: string,
    categoryId: number
  ) => {
    setCategoryIndex(index)
    setSelectedCategory(categoryName)
    setSelectedCategoryID(categoryId)
    setShowCategoryError(false)
  }


  const handleVehiclePress = (
    index: number,
    vehicleName: string,
    vehicleId: number
  ) => {
    setVehicleIndex(index)
    setSelectedVehicle(vehicleName)
    setSelectedVehicleID(vehicleId)
    setShowVehicleError(false);

    const selectedItem = vehicleTypedata?.data?.find(item => item.id === vehicleId)
    if (selectedItem?.seat) {

      setSelectedVehicleSeat(selectedItem.seat)
    }
  }

  const [seatError, setSeatError] = useState(false)

  const gotoBankDetails = () => {
    const isAmbulance = selectedService === 'ambulance';

    const hasEmptyFields = Object.entries(formDatas).some(([key, value]) => {
      if (isAmbulance && (key === 'ambulanceName' || key === 'ambulanceDescription')) {
        return typeof value === 'string' && value.trim() === '';
      }
      if (!isAmbulance && ['vehicleName', 'vehicleNumber', 'vehicleColor', 'maximumSeats'].includes(key)) {
        return typeof value === 'string' && value.trim() === '';
      }
      return false;
    });

    const seatValue = Number(formDatas.maximumSeats);
    const seatMismatch =
      !isAmbulance &&
      selectedVehicleSeat !== null &&
      (seatValue < 1 || seatValue > selectedVehicleSeat);

    let hasError = false;

    if (!selectedService) {
      setShowServiceError(true);
      hasError = true;
    } else {
      setShowServiceError(false);
    }
    if (!selectedCategoryID) {
      setShowCategoryError(true);
      hasError = true;
    } else {
      setShowCategoryError(false);
    }

    if (!selectedVehicleID) {
      setShowVehicleError(true);
      hasError = true;
    } else {
      setShowVehicleError(false);
    }
    if (hasEmptyFields) {
      setShowWarning(true);
      hasError = true;
    } else {
      setShowWarning(false);
    }

    if (seatMismatch) {
      setSeatError(true);
      hasError = true;
    } else {
      setSeatError(false);
    }

    if (hasError) {
      return;
    }

    setVehicleDetail(formDatas);
    handleRegister();
  };



  const handleRegister = async () => {
    setLoading(true);
    try {
      const formData = new FormData();
      formData.append('username', accountDetail.username);
      formData.append('name', accountDetail.name);
      formData.append('email', accountDetail.email);
      formData.append('country_code', accountDetail.countryCode?.callingCode?.[0] || '');
      formData.append('phone', accountDetail.phoneNumber);
      formData.append('password', accountDetail.password);
      formData.append('password_confirmation', accountDetail.confirmPassword);
      formData.append('ambulance[name]', formDatas.ambulanceName);
      formData.append('ambulance[description]', formDatas.ambulanceDescription);
      formData.append('service_id', formDatas.serviceName);
      formData.append('service_category_id', formDatas.serviceCategory);
      formData.append('vehicle[vehicle_type_id]', formDatas.vehicleType);
      formData.append('vehicle[model]', formDatas.vehicleName);
      formData.append('vehicle[plate_number]', formDatas.vehicleNumber);
      formData.append('vehicle[color]', formDatas.vehicleColor);
      formData.append('vehicle[seat]', formDatas.maximumSeats);
      formData.append('fcm_token', fcmToken);

      Object.keys(documentDetail).forEach((key, index) => {
        const doc = documentDetail[key]?.file;
        const expiryDate = documentDetail[key]?.expiryDate;

        if (doc) {
          formData.append(`documents[${index}][file]`, {
            uri: doc.uri,
            type: doc.type,
            name: doc.name,
          });

          formData.append(`documents[${index}][slug]`, key);

          if (expiryDate) {
            formData.append(`documents[${index}][expired_at]`, expiryDate);
          }
        }
      });


      const response = await fetch(`${URL}/api/driver/register`, {
        method: 'POST',
        body: formData,
        headers: {
          'Content-Type': 'multipart/form-data',
          Accept: 'application/json',
        },
      });
      const data = await response.json();


      if (response.ok && data?.success === true) {
        await setValue('token', data.access_token);
        setToken(data.access_token);
        notificationHelper('', 'Register Successfully', 'success');
        await dispatch(selfDriverData());


        await firestore()
          .collection('driverTrack')
          .doc(data.id.toString())
          .set({
            is_verified: data?.is_verified,
            driver_name: data?.name,
            vehicle_model: data?.model,
            plate_number: data?.plate_number,
            rating_count: data?.rating_count,
            review_count: data?.review_count,
            wallet_balance: data?.wallet_balance,
            is_on_ride: "0"
          })
          .then(() => {

          })
          .catch(error => {
            notificationHelper("", error, "error")
          });
        if (data?.is_verified === 1) {
          navigation.replace('TabNav');
        } else if (data?.is_verified === 0) {
          navigation.navigate('Verification');
        }


      } else {
        notificationHelper('', data?.message ?? 'Something went wrong', 'error');
      }
    } catch (error) {
    } finally {
      setLoading(false);
    }

    if (!selectedVehicleID) {
      setShowVehicleError(true);
      hasError = true;
    } else {
      setShowVehicleError(false);
    }
    if (hasEmptyFields) {
      setShowWarning(true);
      hasError = true;
    } else {
      setShowWarning(false);
    }

    if (seatMismatch) {
      setSeatError(true);
      hasError = true;
    } else {
      setSeatError(false);
    }

    if (hasError) {
      return;
    }

    setVehicleDetail(formData);
    navigation.navigate('BankDetail');
  };

  const [selectedVehicleSeat, setSelectedVehicleSeat] = useState<number | null>(null)
  const [showCategoryError, setShowCategoryError] = useState(false)
  const [showVehicleError, setShowVehicleError] = useState(false);
  const [showServiceError, setShowServiceError] = useState(false);


  return (
    <View style={{ flex: 1 }}>
      <Header backgroundColor={isDark ? colors.card : appColors.white} />
      <ProgressBar fill={3} />
      <ScrollView style={[styles.main]} showsVerticalScrollIndicator={false}>
        <View style={[styles.subView, { backgroundColor: colors.background }]}>
          <View style={styles.subContainer}>
            <TitleView
              title={translateData.vehicleRegistration}
              subTitle={translateData.registerContent}
            />

            <Text
              style={[
                styles.vehicleTitle,
                { textAlign: textRtlStyle },
                { color: isDark ? appColors.white : appColors.primaryFont },
              ]}
            >
              {translateData.selectService}
            </Text>
            <View style={{ flexDirection: viewRtlStyle }}>
              <RenderServiceList
                selectedItemIndex={selectedItemIndex}
                handleItemPress={handleItemPress}
              />
            </View>
            {showServiceError && (
              <Text style={{
                color: appColors.red,
                marginBottom: windowHeight(0.5),
                fontSize: fontSizes.FONT3
              }}>
                {translateData.plpleaseSelectaServiceErrorrr}
              </Text>
            )}


            {selectedService === 'ambulance' ? (

              null
            ) :
              <>
                <Text
                  style={[
                    styles.vehicleTitle,
                    { textAlign: textRtlStyle },
                    { color: isDark ? appColors.white : appColors.primaryFont },
                  ]}
                >
                  {translateData.selectCategory}
                </Text>
                <View style={{ flexDirection: viewRtlStyle }}>
                  <RenderCategoryReg
                    categoryIndex={categoryIndex}
                    handleItemPress={handleCategoryPress}
                    selectedService={selectedService}
                  />
                </View>
                {showCategoryError && (
                  <Text style={{
                    color: appColors.red,
                    fontSize: fontSizes.FONT3,
                    bottom: windowHeight(1.5)
                  }}>
                    {translateData.pleaseSelectaCategoryyyyErrorrr}
                  </Text>
                )}
              </>
            }
            {selectedCategory === 'Rental' ? (
              <View style={styles.rentalBg}>
                <Text style={styles.rentalDesc}>
                  {translateData.registrationNotice} '
                  <Text style={styles.boldText}>{translateData.vehicleList}</Text>
                  '.
                </Text>
              </View>
            ) : (
              <>
                {selectedService === 'ambulance' ? (
                  null
                ) :
                  <>
                    <View style={styles.vehicle}>
                      <Text
                        style={[
                          styles.vehicleTitle,
                          { textAlign: textRtlStyle },
                          {
                            color: isDark ? appColors.white : appColors.primaryFont,
                          },
                          { bottom: windowHeight(0) },
                        ]}
                      >
                        {translateData.selectVehicle}
                      </Text>
                      <View style={{ flexDirection: viewRtlStyle }}>
                        <View>
                          <RenderVehicleList
                            vehicleIndex={vehicleIndex}
                            handleItemPress={handleVehiclePress}
                            selectedCategory={selectedCategory}
                            serviceId={selectedServiceID}
                            categoryId={selectedCategoryID}
                            selectedVehicleID={selectedVehicleID}
                          />

                          {showVehicleError && (
                            <Text style={{
                              color: appColors.red,
                              fontSize: fontSizes.FONT3,
                              bottom: windowHeight(2),
                              marginBottom: windowHeight(0.3)
                            }}>
                              {translateData.pleaseSelectaVehicleeErrorrr}
                            </Text>
                          )}
                        </View>
                      </View>
                    </View>
                    <View style={styles.vehicleName}>
                      <Input
                        title={translateData.vehicleName}
                        titleShow={true}
                        placeholder={translateData.enterVehicleNames}
                        value={formDatas.vehicleName}
                        onChangeText={text => handleChange('vehicleName', text)}
                        showWarning={showWarning && formDatas.vehicleName === ''}
                        warning={translateData.enterYourvehicleName}
                        backgroundColor={
                          isDark ? appColors.darkThemeSub : appColors.white
                        }
                        icon={false}
                      />
                    </View>
                  </>
                }
                {selectedService === 'ambulance' ? (
                  <>
                    <View style={[styles.vehicleNo, { marginTop: windowHeight(3.5) }]}>
                      <Input
                        title={translateData.ambulanceName}
                        titleShow={true}
                        placeholder={translateData.enterHospitalName}
                        value={formDatas.ambulanceName}
                        onChangeText={text => handleChange('ambulanceName', text)}
                        showWarning={showWarning && formDatas.ambulanceName === ''}
                        warning={translateData.pleaseEnterAmbulanceNameeeee}
                        backgroundColor={
                          isDark ? appColors.darkThemeSub : appColors.white
                        }
                      />
                    </View>
                    <View style={styles.vehicleColor}>
                      <Input
                        title={translateData.ambulanceDescription}
                        titleShow={true}
                        placeholder={translateData.enterAmbulanceDescription}
                        value={formDatas.ambulanceDescription}
                        onChangeText={text => handleChange('ambulanceDescription', text)}
                        showWarning={showWarning && formDatas.ambulanceDescription === ''}
                        warning={translateData.pleaseEnterAmbulanceDescriptionnnnn}
                        backgroundColor={
                          isDark ? appColors.darkThemeSub : appColors.white
                        }
                      />
                    </View>
                  </>
                ) :
                  <>
                    <View style={styles.vehicleNo}>
                      <Input
                        title={translateData.vehicleNo}
                        titleShow={true}
                        placeholder={translateData.rnterVehicleNo}
                        value={formDatas.vehicleNumber}
                        onChangeText={text => handleChange('vehicleNumber', text)}
                        showWarning={showWarning && formDatas.vehicleNumber === ''}
                        warning={translateData.pleaseEnterVehicleNo}
                        backgroundColor={
                          isDark ? appColors.darkThemeSub : appColors.white
                        }
                      />
                    </View>
                    <View style={styles.vehicleColor}>
                      <Input
                        title={translateData.vehicleColor}
                        titleShow={true}
                        placeholder={translateData.enterVehicleColor}
                        value={formDatas.vehicleColor}
                        onChangeText={text => handleChange('vehicleColor', text)}
                        showWarning={showWarning && formDatas.vehicleColor === ''}
                        warning={translateData.enterYourvehicleColor}
                        backgroundColor={
                          isDark ? appColors.darkThemeSub : appColors.white
                        }
                      />
                    </View>
                    <View style={styles.maximumSeats}>
                      <Input
                        title={translateData.maximumSeats}
                        titleShow={true}
                        placeholder={
                          selectedVehicleSeat
                            ? `${translateData.enterMaximumSeats}`
                            : translateData.enterMaximumSeats
                        }
                        value={formDatas.maximumSeats}
                        onChangeText={text => handleChange('maximumSeats', text)}
                        showWarning={
                          (showWarning && formDatas.maximumSeats === '') || seatError
                        }
                        warning={
                          seatError
                            ? `Maximum ${selectedVehicleSeat} seats are allowed`
                            : translateData.enterYourmaximumSeats
                        }
                        keyboardType="numeric"
                        editable={true}
                        backgroundColor={isDark ? appColors.darkThemeSub : appColors.white}
                      />
                    </View>
                  </>
                }
              </>
            )}
          </View>
          <View
            style={[{ marginBottom: windowHeight(15), top: windowHeight(2.8) }]}
          >
            <Button
              onPress={gotoBankDetails}
              title={translateData.register}
              backgroundColor={appColors.primary}
              color={appColors.white}
              loading={loading}
            />
          </View>
        </View>
      </ScrollView>
    </View>
  )
}