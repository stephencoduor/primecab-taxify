import { View, ScrollView, TouchableOpacity, Text, ActivityIndicator } from 'react-native'
import React, { useEffect, useRef, useState } from 'react'
import { Header, Button, notificationHelper } from '../../../commonComponents'
import appColors from '../../../theme/appColors'
import { Details } from '../component'
import { Bill } from '../../home/endRide/component'
import { Payment } from '../../home/endRide/component'
import { useNavigation, useTheme, useRoute } from '@react-navigation/native'
import appFonts from '../../../theme/appFonts'
import Icons from '../../../utils/icons/icons'
import OTPTextView from 'react-native-otp-textinput'
import { useDispatch, useSelector } from 'react-redux'
import { rideDataGets, rideDataPut, rideStartData } from '../../../api/store/action'
import { useValues } from '../../../utils/context'
import styles from './styles'
import { CommonModal } from '../../../commonComponents/commonModal'
import firestore from '@react-native-firebase/firestore'
import { windowHeight, windowWidth } from '../../../theme/appConstant'
import { getValue } from '../../../utils/localstorage'
import { URL } from '../../../api/config'

export function PendingDetails() {
  const route = useRoute()
  const [loading, setLoading] = useState(false)
  const { item, vehicleDetail, status, rideStatus } = route.params
  const [otpModalVisible, setOtpModalVisible] = useState(false)
  const [warning, setWarning] = useState('')
  const [enteredOtp, setEnteredOtp] = useState('')
  const dispatch = useDispatch()
  const { viewRtlStyle, textRtlStyle, isDark } = useValues()
  const { colors } = useTheme()
  const { translateData } = useSelector(state => state.setting)
  const { zoneValue } = useSelector((state) => state.zoneUpdate)
  const navigation = useNavigation()
  const [paymentMethod, setPaymentMethod] = useState(null);
  const [paymentStatus, setpaymentStatus] = useState();
  const [isConfirming, setIsConfirming] = useState(false);
  const [completeLoading, setCompleteLoading] = useState(false);
  const [loaderInvoice, setLoaderInvoice] = useState(false)

  useEffect(() => {
    const rideId = String(item?.id);
    const unsubscribe = firestore()
      .collection('rides')
      .doc(rideId)
      .onSnapshot(doc => {
        if (doc.exists) {
          const data = doc.data();
          setPaymentMethod(data.payment_method);
          setpaymentStatus(data.payment_status);
        } else {
          console.warn('Ride not found');
        }
      });
    return () => unsubscribe();
  }, [item?.id]);




  const gotoPickup = () => {
    navigation.navigate('RideComplete', { rideData: item })
  }

  const gotoInvoice = async (rideData) => {
    setLoaderInvoice(true)
    const token = await getValue('token');
    const response = await fetch(
      `${URL}/api/ride/invoice/${rideData.invoice_id}`,
      {
        method: 'GET',
        headers: {
          'Content-Type': 'multipart/form-data',
          Accept: 'application/json',
          Authorization: `Bearer ${token}`,
        },
      },
    );

    if (response.status == 200) {
      setLoaderInvoice(false)

      navigation.navigate('PdfViewer', {
        pdfUrl: response?.url,
        token: token,
        rideNumber: rideData?.invoice_id
      });
    } else {
      setLoaderInvoice(true)
    }
  }

  const gotoCompleteRental = () => {
    setCompleteLoading(true)
    dispatch(
      rideDataPut({
        data: {
          status: 'completed'
        },
        ride_id: item?.id,
      }),
    ).then(async (res: any) => {
      if (res?.payload?.ride_status?.slug == 'completed') {
        navigation.navigate('TabNav')
        dispatch(rideDataGets())
        notificationHelper('', 'Ride Complete', 'success')
        setCompleteLoading(false)
      }
    })
  }

  const gotoStart = () => {
    navigation.navigate('OtpRide', { rideData: item, ride_Id: item?.id })
  }

  const handleCashReceived = () => {
    setIsConfirming(true);
  };

  const handleConfirm = () => {
    notificationHelper('', 'You have received cash from the customer.', 'success');
    navigation.goBack();
    dispatch(rideDataGets())
  };

  const handleChange = (otp: string) => {
    setEnteredOtp(otp)
    if (otp.length == 5) {
      setWarning('')
    }
  }
  const closeModal = () => {
    setOtpModalVisible(false)
    setLoading(true)
    let payload: ReviewInterface = {
      ride_id: item?.id,
      otp: enteredOtp,
    }

    dispatch(rideStartData(payload))
      .unwrap()
      .then((res: any) => {
        setLoading(false)
      })
      .catch(() => {
        setLoading(false)
      })
  }


  return (
    <View style={styles.main}>
      <Header title={`${rideStatus} Ride`} />
      <ScrollView showsVerticalScrollIndicator={false}>
        <>
          <Details rideDetails={item} vehicleDetail={vehicleDetail} />
          <View style={styles.completedMainView}>
            {status === 'completed' ? (
              <>
                <Bill rideDetails={item} />
                <Payment rideDetails={item} />
              </>
            ) : null}
          </View>
          <View style={styles.billMainView}>
            <View style={[styles.viewBill, { backgroundColor: isDark ? colors.card : appColors.white, borderColor: colors.border }]}>
              <Text style={[styles.rideText, { color: isDark ? appColors.white : appColors.primaryFont, textAlign: textRtlStyle }]}>
                {translateData.billSummary}
              </Text>
              <View style={[styles.billBorder, { borderBottomColor: colors.border }]} />
              {item?.ride_fare > 0 && (
                <View style={[styles.platformContainer, { flexDirection: viewRtlStyle }]}>
                  <Text style={[styles.text, { color: isDark ? appColors.white : appColors.primaryFont }]}>
                    Base Distance Fare
                  </Text>
                  <Text style={[styles.text, { color: isDark ? appColors.white : appColors.primaryFont }]}>
                    {zoneValue?.currency_symbol}{item?.ride_fare}
                  </Text>
                </View>
              )}
              {item?.additional_distance_charge > 0 && (
                <View style={[styles.platformContainer, { flexDirection: viewRtlStyle, }]}>
                  <Text style={[styles.text, { color: isDark ? appColors.white : appColors.primaryFont }]}>
                    Additional Distance Fare
                  </Text>
                  <Text style={[styles.text, { color: isDark ? appColors.white : appColors.primaryFont }]}>
                    {zoneValue?.currency_symbol}{item?.additional_distance_charge}
                  </Text>
                </View>
              )}
              {item?.vehicle_rent > 0 && (
                <View style={[styles.platformContainer, { flexDirection: viewRtlStyle, }]}>
                  <Text style={[styles.text, { color: isDark ? appColors.white : appColors.primaryFont }]}>
                    Vehicle Fare
                  </Text>
                  <Text style={[styles.text, { color: isDark ? appColors.white : appColors.primaryFont }]}>
                    {zoneValue?.currency_symbol}{item?.vehicle_rent}
                  </Text>
                </View>
              )}
              {item?.driver_rent > 0 && (
                <View style={[styles.platformContainer, { flexDirection: viewRtlStyle, }]}>
                  <Text style={[styles.text, { color: isDark ? appColors.white : appColors.primaryFont }]}>
                    Driver Fare
                  </Text>
                  <Text style={[styles.text, { color: isDark ? appColors.white : appColors.primaryFont }]}>
                    {zoneValue?.currency_symbol}{item?.driver_rent}
                  </Text>
                </View>
              )}
              {item?.additional_minute_charge > 0 && (
                <View style={[styles.platformContainer, { flexDirection: viewRtlStyle }]} >
                  <Text style={[styles.text, { color: isDark ? appColors.white : appColors.primaryFont }]}>
                    Time Fare
                  </Text>
                  <Text style={[styles.text, { color: isDark ? appColors.white : appColors.primaryFont }]} >
                    {zoneValue?.currency_symbol}{item?.additional_minute_charge}
                  </Text>
                </View>
              )}
              {item?.platform_fees > 0 && (
                <View style={[styles.platformContainer, { flexDirection: viewRtlStyle }]} >
                  <Text style={[styles.text, { color: isDark ? appColors.white : appColors.primaryFont }]}>
                    Platform Fees
                  </Text>
                  <Text style={[styles.text, { color: isDark ? appColors.white : appColors.primaryFont }]}>
                    {zoneValue?.currency_symbol}{item?.platform_fees}
                  </Text>
                </View>
              )}
              {item?.tax > 0 && (
                <View style={[styles.platformContainer, { flexDirection: viewRtlStyle }]}>
                  <Text style={[styles.text, { color: isDark ? appColors.white : appColors.primaryFont }]}>
                    Tax
                  </Text>
                  <Text style={[styles.text, { color: isDark ? appColors.white : appColors.primaryFont }]}>
                    {zoneValue?.currency_symbol}{item?.tax}
                  </Text>
                </View>
              )}
              {item?.commission > 0 && (
                <View style={[styles.billView, { flexDirection: viewRtlStyle }]}>
                  <Text style={{ fontFamily: appFonts.regular, color: isDark ? appColors.white : appColors.primaryFont }}>
                    Commision
                  </Text>
                  <Text style={[styles.text, { color: isDark ? appColors.white : appColors.primaryFont }]}>
                    {zoneValue?.currency_symbol}{item?.commission}
                  </Text>
                </View>
              )}
              {item?.additional_weight_charge > 0 && (
                <View style={[styles.billView, { flexDirection: viewRtlStyle }]}>
                  <Text style={{ fontFamily: appFonts.regular, color: isDark ? appColors.white : appColors.primaryFont }}>
                    Additional Weight Charge
                  </Text>
                  <Text style={[styles.text, { color: isDark ? appColors.white : appColors.primaryFont }]}>
                    {zoneValue?.currency_symbol}{item?.additional_weight_charge}
                  </Text>
                </View>
              )}
              {item?.bid_extra_amount > 0 && (
                <View style={[styles.billView, { flexDirection: viewRtlStyle }]}>
                  <Text style={{ fontFamily: appFonts.regular, color: isDark ? appColors.white : appColors.primaryFont }}>
                    Bid Extra Amount
                  </Text>
                  <Text style={[styles.text, { color: isDark ? appColors.white : appColors.primaryFont }]}>
                    {zoneValue?.currency_symbol}{item?.bid_extra_amount}
                  </Text>
                </View>
              )}
              <View style={[styles.billBorder, { borderBottomColor: colors.border }]} />
              <View style={[styles.billView, { flexDirection: viewRtlStyle }]}>
                <Text style={{ fontFamily: appFonts.regular, color: isDark ? appColors.white : appColors.primaryFont }}>
                  Total
                </Text>
                <Text style={{ fontFamily: appFonts.regular, color: appColors.price }}>
                  {zoneValue?.currency_symbol}{item?.total}
                </Text>
              </View>
            </View>

          </View>


          <View style={styles.pendingView}>
            {item?.payment_status == 'PENDING' ? (
              <View
                style={[
                  styles.completedPaymentView,
                  {
                    backgroundColor: isDark ? colors.card : appColors.white,
                    borderColor: colors.border,
                  },
                ]}
              >
                <Text style={styles.completedPaymentText}>
                  {translateData.paymentPending}
                </Text>
                <TouchableOpacity style={styles.refreshView} activeOpacity={0.7}>
                  <Text style={styles.refreshText}>
                    {translateData.refresh}
                  </Text>
                </TouchableOpacity>
              </View>
            ) : (
              <View style={styles.paymentView}>
                <Payment rideDetails={item} />
              </View>
            )}
          </View>
          {item?.ride_status?.slug == 'completed' &&
            item?.payment_status == 'COMPLETED' && (
              <View style={{ marginTop: windowHeight(3) }}>
                <Button
                  backgroundColor={appColors.primary}
                  color={appColors.white}
                  title={translateData.reviewCustomer}
                  onPress={gotoPickup}
                />
                <View style={{ marginTop: windowHeight(3) }}>
                  <Button
                    backgroundColor={appColors.primary}
                    color={appColors.white}
                    title={'Invoice'}
                    onPress={() => gotoInvoice(item)}
                    loading={loaderInvoice}
                  />
                </View>
              </View>
            )}
          <View style={styles.bottomView} />
        </>
      </ScrollView>
      <View style={styles.buttonView}>
        {item?.ride_status?.slug == 'accepted' && (
          <View style={{
            position: 'absolute',
            bottom: windowHeight(0),
            left: windowHeight(0),
            right: windowHeight(0),
            paddingVertical: windowHeight(3)
          }}>
            <Button
              backgroundColor={appColors.primary}
              color={appColors.white}
              title={translateData.pickupCustomer}
              onPress={gotoStart}
            />
          </View>
        )}
        {item?.ride_status?.slug == 'started' && item?.service_category?.service_category_type != 'rental' && (
          <Button
            backgroundColor={appColors.primary}
            color={appColors.white}
            title={translateData.trackRide}
            onPress={gotoPickup}
          />
        )}

        {item?.ride_status?.slug == 'started' && item?.service_category?.service_category_type == 'rental' && (
          <Button
            backgroundColor={appColors.primary}
            color={appColors.white}
            title={'Complete'}
            onPress={gotoCompleteRental}
            loading={completeLoading}
          />
        )}
       
        {item?.ride_status?.slug === 'completed' && item?.payment_status === 'PENDING' && (
          <>
            {paymentMethod === 'cash' ? (
              isConfirming ? (
                <Button
                  backgroundColor={appColors.primary}
                  color={appColors.white}
                  title={"Confirm"}
                  onPress={handleConfirm}
                />
              ) : (
                <Button
                  backgroundColor={appColors.primary}
                  color={appColors.white}
                  title={"Received Cash"}
                  onPress={handleCashReceived}
                />
              )
            ) : paymentStatus === 'COMPLETED' ? (
              <Button
                backgroundColor={appColors.primary}
                color={appColors.white}
                title={'Payment Received'}
                onPress={handleConfirm}
              />
            ) : (
              <View style={{ marginHorizontal: windowWidth(4) }}>
                <View
                  style={{
                    flexDirection: 'row',
                    width: '100%',
                    backgroundColor: appColors.primary,
                    borderRadius: windowWidth(1.5),
                    alignItems: 'center',
                    justifyContent: 'center',
                    height: windowWidth(13.5),
                  }}
                >
                  <Text
                    style={{
                      color: appColors.white,
                      fontFamily: appFonts.medium,
                      marginHorizontal: windowWidth(2),
                    }}
                  >
                    Waiting For Payment
                  </Text>
                  <ActivityIndicator size="large" color={appColors.white} />
                </View>
              </View>
            )}
          </>
        )}


      </View>

      <CommonModal
        isVisible={otpModalVisible}
        closeModal={closeModal}
        onPress={closeModal}
        value={
          <View>
            <TouchableOpacity
              style={[styles.closeBtn, { flexDirection: viewRtlStyle }]}
              onPress={closeModal}
              activeOpacity={0.7}>
              <Icons.Close />
            </TouchableOpacity>
            <Text
              style={[
                styles.modalText,
                { color: isDark ? colors.text : appColors.primaryFont },
              ]}
            >
              {translateData.otpConfirm}
            </Text>
            <Text
              style={[
                styles.otpTitle,
                { textAlign: textRtlStyle },
                { color: isDark ? colors.text : appColors.primaryFont },
              ]}
            >
              {translateData.enterOTP}
            </Text>
            <OTPTextView
              containerStyle={[
                styles.otpContainer,
                { flexDirection: viewRtlStyle },
              ]}
              textInputStyle={[
                styles.otpInput,
                {
                  backgroundColor: isDark
                    ? colors.background
                    : appColors.graybackground,
                },
                { color: colors.text },
              ]}
              handleTextChange={handleChange}
              inputCount={4}
              keyboardType="numeric"
              tintColor="transparent"
              offTintColor="transparent"
            />
            <TouchableOpacity onPress={closeModal} style={styles.closeButton} activeOpacity={0.7}>
              <Button
                title={translateData.verify}
                color={appColors.white}
                onPress={closeModal}
                backgroundColor={appColors.primary}
                margin="0"
              />
            </TouchableOpacity>
          </View>
        }
      />
    </View>
  )
}
