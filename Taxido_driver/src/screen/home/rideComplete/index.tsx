import { View, Text, Platform, PermissionsAndroid, StyleSheet, BackHandler } from 'react-native'
import React, { useState, useEffect, useRef, useCallback } from 'react'
import { useNavigation, useTheme, useRoute, useFocusEffect } from '@react-navigation/native'
import { useDispatch, useSelector } from 'react-redux'
import { rideDataGets, rideDataPut, selfDriverData } from '../../../api/store/action'
import styles from './styles'
import commanStyles from '../../../style/commanStyles'
import { BackButton, Button, notificationHelper } from '../../../commonComponents'
import appColors from '../../../theme/appColors'
import { DriverProfile } from '../../../commonComponents'
import { Map } from '../../mapView'
import { useValues } from '../../../utils/context'
import Geolocation from 'react-native-geolocation-service'
import firestore from '@react-native-firebase/firestore'
import OTPTextView from 'react-native-otp-textinput'
import { fontSizes, windowHeight, windowWidth } from '../../../theme/appConstant'
import appFonts from '../../../theme/appFonts'
import { BottomSheetModal, BottomSheetView, BottomSheetModalProvider } from '@gorhom/bottom-sheet';
import { FAB } from 'react-native-paper';
import Icons from '../../../utils/icons/icons'


export function RideComplete() {
  const { viewRtlStyle } = useValues()
  const navigation = useNavigation()
  const { colors } = useTheme()
  const route = useRoute()
  const dispatch = useDispatch()
  const { rideData } = route.params
  const [elapsedTime, setElapsedTime] = useState('00:00:00')
  const [location, setLocation] = useState(null)
  const [heading, setHeading] = useState(0)
  const [routeCoordinates, setRouteCoordinates] = useState([])
  const [totalDistance, setTotalDistance] = useState(0)
  const markerRef = useRef(null)
  const intervalRef = useRef(null)
  const previousLocation = useRef(null)
  const [elapsedSeconds, setElapsedSeconds] = useState<number>(0)
  const [isRunning, setIsRunning] = useState<boolean>(true)
  const [endTime, setEndTime] = useState<string | null>(null)
  const [locations, setLocations] = useState(null)
  const { translateData } = useSelector(state => state.setting)
  const [completeLoading, setCompleteLoading] = useState(false);
  const { isDark } = useValues()
  const [otp, setOtp] = useState('');
  const [correctOtp, setCorrectOtp] = useState('');
  const bottomSheetModalRef = useRef<BottomSheetModal>(null);
  const otpBottomSheetRef = useRef<BottomSheetModal>(null);
  const [isOtpSheetOpen, setIsOtpSheetOpen] = useState(false);
  const isVerificationSuccess = useRef(false);
  const [showActions, setShowActions] = useState(false);

  useEffect(() => {
    bottomSheetModalRef.current?.present();
    isVerificationSuccess.current = false;
  }, []);

  useFocusEffect(
    useCallback(() => {
      const onBackPress = () => {
        if (isOtpSheetOpen) {
          otpBottomSheetRef.current?.close();
          return true;
        } else {
          return false;
        }
      };

      const subscription = BackHandler.addEventListener(
        'hardwareBackPress',
        onBackPress
      );

      return () => subscription.remove();

    }, [isOtpSheetOpen])
  );

  const requestLocationPermission = async () => {
    if (Platform.OS === 'android') {
      const granted = await PermissionsAndroid.request(
        PermissionsAndroid.PERMISSIONS.ACCESS_FINE_LOCATION,
      )
      return granted === PermissionsAndroid.RESULTS.GRANTED
    }
    return true
  }

  useEffect(() => {
    const startLocationTracking = async () => {
      const hasPermission = await requestLocationPermission()
      if (!hasPermission) {
        return
      }
      const watchId = Geolocation.watchPosition(
        position => {
          const { latitude, longitude } = position.coords
          setLocations({ latitude, longitude })
        },
        error => { console.log(error) },
        { enableHighAccuracy: true, distanceFilter: 100, interval: 5000, },
      )
      return () => Geolocation.clearWatch(watchId)
    }
    startLocationTracking()
    return () => { Geolocation.stopObserving() }
  }, [])

  const getCurrentTime = () => new Date().toTimeString().slice(0, 8)

  useEffect(() => {
    if (isRunning && rideData?.start_time) {
      const timerInterval = setInterval(() => {
        const now = new Date()
        const [hours, minutes, seconds] = rideData.start_time.split(':').map(Number);
        const startTime = new Date(now.getFullYear(), now.getMonth(), now.getDate(), hours, minutes, seconds)
        if (!isNaN(startTime.getTime())) {
          const secondsGap = Math.floor((now.getTime() - startTime.getTime()) / 1000)
          setElapsedSeconds(secondsGap)
          const hrs = Math.floor(secondsGap / 3600).toString().padStart(2, '0')
          const mins = Math.floor((secondsGap % 3600) / 60).toString().padStart(2, '0')
          const secs = (secondsGap % 60).toString().padStart(2, '0')
          setElapsedTime(`${hrs}:${mins}:${secs}`)
        }
      }, 1000)
      return () => clearInterval(timerInterval)
    }
  }, [isRunning, rideData?.start_time])


  const gotoComplete = async () => {
    if (rideData?.service?.service_type == 'parcel') {
      setCompleteLoading(true);
      try {
        const rideDoc = await firestore().collection('rides').doc(rideData.id.toString()).get();
        if (rideDoc.exists) {
          const fetchedOtp = rideDoc.data()?.parcel_delivered_otp;
          if (fetchedOtp) {
            setCorrectOtp(fetchedOtp);
            bottomSheetModalRef.current?.close();
            otpBottomSheetRef.current?.present(1);
          } else {
            notificationHelper('', translateData.deliveryOtp, 'error');
          }
        } else {
          notificationHelper('', translateData.rideDetailsNotFound, 'error');
        }
      } catch (error) {
        console.error('Error fetching ride OTP:', error);
        notificationHelper('', translateData.fetchDetails, 'error');
      } finally {
        setCompleteLoading(false);
      }
    } else {
      handleConfirm();
    }
  };

  const handleConfirm = (verifiedOtp = null) => {
    setCompleteLoading(true);
    const end = getCurrentTime();
    setEndTime(end);
    const payloadData: any = {
      status: 'completed',
      end_time: end,
      distance: totalDistance.toFixed(2),
      distance_unit: 'km',
    };

    if (verifiedOtp) { payloadData.parcel_delivered_otp = verifiedOtp; }

    dispatch(rideDataPut({ data: payloadData, ride_id: rideData?.id })).then(async (res: any) => {
      if (res?.payload?.id) {
        dispatch(selfDriverData());
        dispatch(rideDataGets());
        navigation.navigate('RideDetails', { ride_Id: rideData?.id });

      } else {
        notificationHelper('', translateData.failedComplet, 'error');
      }
    }).catch((error) => {
      console.error('❌ rideDataPut error:', error);
    }).finally(() => {
      setCompleteLoading(false);
    });
  }

  const otpVerify = () => {
    if (otp == correctOtp) {
      isVerificationSuccess.current = true;
      otpBottomSheetRef.current?.close();
      handleConfirm(otp);
    } else {
      setOtp('');
      notificationHelper('', translateData.otpWrong, 'error');
    }
  }

  const handleOtpSheetChange = useCallback((index: number) => {
    setIsOtpSheetOpen(index >= 0);
  }, []);

  const handleOtpDismiss = useCallback(() => {
    setOtp('');
    if (!isVerificationSuccess.current) {
      bottomSheetModalRef.current?.present();
    }
  }, []);

  const gotoOtherMap = (maptype) => {
    navigation.navigate('MapWebView', {
      lat: rideData?.driver?.location?.[rideData?.driver?.location?.length - 1]?.lat,
      lng: rideData?.driver?.location?.[rideData?.driver?.location?.length - 1]?.lng,
      type: maptype,
    });
  }

  return (
    <View style={commanStyles.main}>
      {rideData?.service_category?.service_category_type !== 'rental' ? (
        <View style={styles.mapSection}>
          <Map Destinationlocation={rideData?.location_coordinates[1]} driverId={rideData?.driver?.id} rideDetails={rideData} />
        </View>
      ) : (
        <View />
      )}

      <View style={styles.extraSection}></View>
      <View style={styles.backButton}>
        <BackButton />
      </View>

      <BottomSheetModalProvider>
        {showActions && (
          <>
            <FAB icon={Icons.GoogleMap} style={[styles.fabMini, { backgroundColor: isDark ? appColors.darkThemeSub : appColors.white, }, { bottom: '55.5%' }]} onPress={() => gotoOtherMap('google')} />
            <FAB icon={Icons.Wazemap} style={[styles.fabMini, { backgroundColor: isDark ? appColors.darkThemeSub : appColors.white, }, { bottom: '47%' }]} onPress={() => gotoOtherMap('waze')} />
            <FAB icon={Icons.BingMap} style={[styles.fabMini, { backgroundColor: isDark ? appColors.darkThemeSub : appColors.white, }, { bottom: '38.5%' }]} onPress={() => gotoOtherMap('bing')} />
          </>
        )}
        <FAB icon={Icons.Map} style={[styles.fab, { backgroundColor: isDark ? appColors.darkThemeSub : appColors.white, }]}
          onPress={() => setShowActions(!showActions)}
        />

        <BottomSheetModal
          ref={bottomSheetModalRef}
          index={0}
          snapPoints={['28%']}
          enablePanDownToClose={false}
          enableContentPanningGesture={false}
          enableHandlePanningGesture={false}
          handleIndicatorStyle={{ backgroundColor: appColors.primary, width: '13%' }}
          backgroundStyle={{ backgroundColor: isDark ? appColors.bgDark : appColors.white }}

        >
          <BottomSheetView style={styles.bottomSheetlayer}>
            {rideData?.service_category?.service_category_type === 'rental' ? (
              <View style={[styles.rideDataMainView, { flexDirection: viewRtlStyle }]}>
              </View>
            ) : null}
            <View style={styles.greenSection}>
              <View style={[styles.additionalSection, { backgroundColor: colors.card, borderColor: colors.border }]}>
                <DriverProfile userDetails={rideData?.rider} borderRadius={25} showInfoIcon={true} iconColor={appColors.primary} backgroundColor={appColors.white} rideDetails={rideData} />
              </View>
              <Button onPress={gotoComplete} title={translateData.completeRides} backgroundColor={appColors.primary} color={appColors.white} loading={completeLoading} />
            </View>
          </BottomSheetView>
        </BottomSheetModal>

        <BottomSheetModal
          ref={otpBottomSheetRef}
          index={0}
          snapPoints={['30%']}
          onChange={handleOtpSheetChange}
          onDismiss={handleOtpDismiss}
          handleIndicatorStyle={{ backgroundColor: colors.border, width: '13%' }}
          backgroundStyle={{ backgroundColor: colors.card }}
        >
          <BottomSheetView style={localStyles.otpSheetContainer}>
            <View>
              <Text style={[localStyles.otpTitle, { color: colors.text }]}>{translateData.deliveryOtps}</Text>
              <Text style={[localStyles.otpSubtitle, { color: colors.text }]}>
                {translateData.otpNotice}
              </Text>
            </View>
            <OTPTextView
              handleTextChange={(text) => {
                setOtp(text);
              }} inputValue={otp}
              inputCount={4}
              keyboardType="numeric"
              tintColor={appColors.primary}
              offTintColor={colors.border}
              containerStyle={localStyles.otpContainer}
              textInputStyle={[localStyles.otpInput, { borderColor: colors.border, color: colors.text }]}
            />
            <View style={localStyles.otpButtonContainer}>
              <Button title={translateData.verifyDone} backgroundColor={appColors.primary} color={appColors.white} onPress={otpVerify} />
            </View>
          </BottomSheetView>
        </BottomSheetModal>

      </BottomSheetModalProvider>
    </View>
  )
}

const localStyles = StyleSheet.create({
  otpSheetContainer: {
    flex: 1,
    justifyContent: 'space-around',
    paddingHorizontal: windowWidth(1.5),
    paddingBottom: windowHeight(2),
  },
  otpTitle: {
    fontFamily: appFonts.bold,
    fontSize: fontSizes.FONT5,
    textAlign: 'center',
    marginBottom: windowHeight(1),
  },
  otpSubtitle: {
    fontFamily: appFonts.regular,
    fontSize: fontSizes.FONT3,
    textAlign: 'center',
    marginBottom: windowHeight(1)
  },
  otpContainer: {
    width: '100%',
    justifyContent: 'space-evenly',
  },
  otpInput: {
    width: windowWidth(15),
    height: windowHeight(7),
    borderWidth: 1.5,
    borderRadius: 12,
    textAlign: 'center',
    fontSize: fontSizes.FONT5,
    fontFamily: appFonts.medium,
  },
  otpButtonContainer: {
    width: '100%',
    marginTop: windowHeight(2)
  },
});