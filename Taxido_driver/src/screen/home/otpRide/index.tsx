import { View, Text, Image, Platform, PermissionsAndroid, Keyboard, TouchableOpacity, Alert } from 'react-native';
import React, { useState, useEffect, useRef, useMemo, useCallback } from 'react';
import appColors from '../../../theme/appColors';
import { useNavigation, useTheme, useRoute } from '@react-navigation/native';
import styles from './styles';
import { BackButton, Button, DriverProfile, notificationHelper } from '../../../commonComponents';
import { NativeStackNavigationProp } from '@react-navigation/native-stack';
import { RootStackParamList } from '../../../navigation/main/types';
import { useValues } from '../../../utils/context';
import OTPTextView from 'react-native-otp-textinput';
import { useDispatch, useSelector } from 'react-redux';
import { cancelationDataGet, rideDataGets, rideDataPut, rideStartData } from '../../../api/store/action/index';
import GetLocation from 'react-native-get-location';
import firestore from '@react-native-firebase/firestore';
import BottomSheet, { BottomSheetBackdrop, BottomSheetModal, BottomSheetView, BottomSheetBackdropProps } from '@gorhom/bottom-sheet';
import appFonts from '../../../theme/appFonts';
import { fontSizes, windowHeight, windowWidth } from '../../../theme/appConstant';
import images from '../../../utils/images/images';
import { ArrivedMap } from '../../../commonComponents/maps/arrivedMap';
import Animated, { useAnimatedStyle, interpolate, Extrapolate } from 'react-native-reanimated';

const CustomBackdrop = ({ animatedIndex, style }: BottomSheetBackdropProps) => {
  const containerAnimatedStyle = useAnimatedStyle(() => ({
    opacity: interpolate(
      animatedIndex.value,
      [-1, 0],
      [0, 0.5],
      Extrapolate.CLAMP
    ),
  }));

  const containerStyle = useMemo(
    () => [
      style,
      containerAnimatedStyle,
    ],
    [style, containerAnimatedStyle]
  );

  return (
    <Animated.View style={containerStyle} pointerEvents="box-none" />
  );
};


type navigation = NativeStackNavigationProp<RootStackParamList>;

export function OtpRide() {
  const navigation = useNavigation<navigation>();
  const { colors } = useTheme();
  const { viewRtlStyle, isDark } = useValues();
  const route = useRoute();
  const { rideData, ride_Id } = route.params;
  const [enteredOtp, setEnteredOtp] = useState('');
  const dispatch = useDispatch();
  const [startTime, setStartTime] = useState<Date | null>(null);
  const [elapsedSeconds, setElapsedSeconds] = useState<number>(0);
  const [isRunning, setIsRunning] = useState<boolean>(false);
  const markerRef = useRef(null);
  const previousLocation = useRef(null);
  const { selfDriver } = useSelector((state: any) => state.account);
  const Driver_Id = selfDriver?.id;
  const [driverTrack, setDriverTrack] = useState();
  const updatedLocation = rideData?.location_coordinates.map(coord => ({
    latitude: parseFloat(coord.lat),
    longitude: parseFloat(coord.lng),
  }));
  const [destination] = useState(updatedLocation[0]);
  const { translateData } = useSelector(state => state.setting);
  const [verifyLoader, setVerifyLoader] = useState(false);
  const [cancelLoader, setCancelloader] = useState(false);
  const { canceldata } = useSelector((state: any) => state.cancelationReason);
  const snapCancelReason = useMemo(() => ["40%"], []);
  const cancelReasonRef = useRef<BottomSheetModal>(null);
  let otpInput = useRef(null);
  const [selectedReason, setSelectedReason] = useState(null);
  const [cancelLoaders, setCancelLoaders] = useState(false);


  const renderBackdrop = useCallback(
    (props: BottomSheetBackdropProps) => (
      <CustomBackdrop {...props} />
    ),
    []
  );

  const clearText = () => {
    otpInput.current.clear();
  };

  useEffect(() => {
    const ride_start = 'before'
    dispatch(cancelationDataGet({ ride_start }));
  }, [])


  useEffect(() => {
    if (!ride_Id) return;
    const unsubscribe = firestore()
      .collection('rides')
      .doc(ride_Id.toString())
      .onSnapshot(docSnap => {
        if (docSnap.exists) {
          const data = docSnap.data();

          if (data?.ride_status?.slug === 'cancelled') {
            navigation.navigate('TabNav');
            dispatch(rideDataGets())
            notificationHelper('', translateData.rideCancelled, 'error');
          }
        }
      });

    return () => unsubscribe();
  }, [ride_Id]);

  const calculateBearing = (startLat, startLng, endLat, endLng) => {
    const toRadians = degree => degree * (Math.PI / 180);
    const toDegrees = radian => radian * (180 / Math.PI);
    const lat1 = toRadians(startLat);
    const lat2 = toRadians(endLat);
    const dLng = toRadians(endLng - startLng);
    const y = Math.sin(dLng) * Math.cos(lat2);
    const x = Math.cos(lat1) * Math.sin(lat2) - Math.sin(lat1) * Math.cos(lat2) * Math.cos(dLng);
    const bearing = toDegrees(Math.atan2(y, x));
    return (bearing + 360) % 360;
  };

  const requestLocationPermission = async () => {
    if (Platform.OS === 'android') {
      try {
        const granted = await PermissionsAndroid.request(
          PermissionsAndroid.PERMISSIONS.ACCESS_FINE_LOCATION,
          {
            title: 'Location Permission',
            message: 'This app needs access to your location',
            buttonNeutral: 'Ask Me Later',
            buttonNegative: 'Cancel',
            buttonPositive: 'OK',
          },
        );
        if (granted === PermissionsAndroid.RESULTS.GRANTED) {
          startTrackingLocation();
        }
      } catch (err) {
        console.warn(err);
      }
    } else {
      startTrackingLocation();
    }
  };

  const startTrackingLocation = () => {
    getCurrentLocation();
    const locationInterval = setInterval(() => {
      getCurrentLocation();
    }, 1000);
    return () => clearInterval(locationInterval);
  };

  const getCurrentLocation = () => {
    GetLocation.getCurrentPosition({
      enableHighAccuracy: true,
      timeout: 15000,
    })
      .then(loc => {
        const newLocation = {
          latitude: loc.latitude,
          longitude: loc.longitude,
        };
        if (previousLocation.current) {
          const newHeading = calculateBearing(
            previousLocation.current.latitude,
            previousLocation.current.longitude,
            newLocation.latitude,
            newLocation.longitude,
          );
        }
        animateMarker(newLocation);
        previousLocation.current = newLocation;
      })
      .catch(error => {
        const { code, message } = error;
        console.warn(code, message);
      });
  };

  const animateMarker = newLocation => {
    if (markerRef.current) {
      markerRef.current.animateMarkerToCoordinate(newLocation, 500);
    }
  };

  useEffect(() => {
    requestLocationPermission();
    return () => clearInterval(startTrackingLocation);
  }, []);

  const handleChange = (otp: string) => {
    setEnteredOtp(otp);
    if (otp.length == 4) {
      Keyboard.dismiss();
      verifyOTP();
    }
  };

  useEffect(() => {
    if (isRunning && startTime) {
      const timerInterval = setInterval(() => {
        const now = new Date();
        const secondsGap = Math.floor(
          (now.getTime() - startTime.getTime()) / 1000,
        );
        setElapsedSeconds(secondsGap);
      }, 1000);
      return () => clearInterval(timerInterval);
    }
  }, [isRunning, startTime]);

  const formatTime = (date: Date) => {
    return date.toTimeString().slice(0, 8);
  };

  const startTimer = () => {
    const now = new Date();
    setStartTime(now);
    setElapsedSeconds(0);
    setIsRunning(true);
    return now;
  };

  useEffect(() => {
    if (!Driver_Id) return;
    const unsubscribe = firestore()
      .collection('driverTrack')
      .doc(Driver_Id.toString())
      .onSnapshot(doc => {
        if (doc.exists) {
          const data = doc.data();
          setDriverTrack(data);
        }
      });
    return () => unsubscribe();
  }, [Driver_Id]);

  const otpSheetRef = useRef<BottomSheet>(null);
  const successSheetRef = useRef<BottomSheet>(null);
  const otpSnapPoints = useMemo(() => ['45%', '80%'], []);
  const successSnapPoints = useMemo(() => ['42%'], []);

  const closeOtpSheet = () => {
    otpSheetRef.current?.close();
  };

  const openSuccessSheet = () => {
    successSheetRef.current?.expand();
  };

  const closeSuccessSheet = () => {
    successSheetRef.current?.close();
  };

  const gotocomplete = () => {
    if (rideData?.service_category?.service_category_type == 'rental') {
      navigation.navigate('TabNav')
      dispatch(rideDataGets());
      notificationHelper('', translateData.vehicleAssign, 'success')
    } else {
      closeSuccessSheet();
      navigation.navigate('RideComplete', { rideData });
      dispatch(rideDataGets());
    }

  };

  const verifyOTP = () => {
    setVerifyLoader(true);
    const now = startTimer();
    if (startTime) {
      const payload = {
        ride_id: ride_Id,
        otp: enteredOtp,
        start_time: formatTime(now),
      };
      dispatch(rideStartData(payload))
        .unwrap()
        .then(async res => {
          if (res?.id) {
            setVerifyLoader(false);
            closeOtpSheet();
            openSuccessSheet();
          } else {
            setVerifyLoader(false);
            notificationHelper('', translateData.otpInvalid, 'error');
            setEnteredOtp('');
            clearText();
          }
        })
        .catch(error => {
          console.error('Ride start failed:', error);
          setVerifyLoader(false);
        });
    } else {
      setVerifyLoader(false);
    }
  };

  const cancelOpen = () => {
    setCancelloader(true)
    successSheetRef.current?.close();
    otpSheetRef.current?.close();
    cancelReasonRef.current?.snapToIndex(1);
  }

  const cancelRide = (item) => {
    setCancelLoaders(true)
    dispatch(
      rideDataPut({
        data: {
          status: 'cancelled',
          cancellation_reason: item.title,
        },
        ride_id: ride_Id,
      }),
    ).then(async (res: any) => {
      navigation.navigate('TabNav')
      setCancelloader(false)
      setCancelLoaders(false)
    })
    setCancelloader(false)
    setCancelLoaders(false)

  }

  return (
    <View style={styles.container}>
      <View style={styles.mapSection}>
        <ArrivedMap Pickuplocation={rideData?.location_coordinates[0]} driverId={Driver_Id} />
      </View>
      <View style={styles.extraSection}></View>
      <View style={styles.backButton}>
        <BackButton />
      </View>
      <View style={styles.greenSection}>


        <BottomSheet
          ref={otpSheetRef}
          index={1}
          snapPoints={['40.5%', '48%']}
          enablePanDownToClose={false}
          enableHandlePanningGesture={true}
          enableContentPanningGesture={false}
          onChange={(index) => {
            if (index === 0) {
              otpSheetRef.current?.snapToIndex(1);
            }
          }}
          onAnimate={(fromIndex, toIndex) => {
            if (toIndex === 0) {
              otpSheetRef.current?.snapToIndex(1);
            }
          }}
          handleIndicatorStyle={{ backgroundColor: appColors.primary, width: '13%' }}
          backdropComponent={renderBackdrop}
          backgroundStyle={{ backgroundColor: isDark ? appColors.bgDark : appColors.white }}

        >
          <BottomSheetView style={[
            styles.additionalSection,
            { backgroundColor: colors.card, borderColor: colors.border },
          ]}
          >
            <View style={{ paddingHorizontal: windowHeight(0) }}>
              <View style={{ alignSelf: 'center', left: windowHeight(0) }}>
                <DriverProfile
                  iconColor={appColors.primary}
                  backgroundColor={appColors.white}
                  borderRadius={25}
                  showInfoIcon={true}
                  rideDetails={rideData}
                  userDetails={rideData?.rider}
                />
              </View>
              <Text
                style={[
                  styles.timing,
                  { color: colors.text, marginTop: windowHeight(1), marginHorizontal: windowWidth(3) },
                ]}
              >
                {translateData.otpVerification}
              </Text>
              <OTPTextView
                ref={ref => (otpInput.current = ref)}
                containerStyle={[styles.otpContainer, { flexDirection: viewRtlStyle, marginTop: windowHeight(0) }]}
                textInputStyle={[
                  styles.otpInputs,
                  {
                    backgroundColor: isDark ? appColors.darkBorderBlack : appColors.graybackground,
                    color: colors.text,
                  },
                ]}
                handleTextChange={handleChange}
                inputCount={4}
                keyboardType="numeric"
                tintColor="transparent"
                offTintColor="transparent"
                defaultValue={enteredOtp}
              />

            </View>
          </BottomSheetView>
          <View style={{ marginTop: windowHeight(30) }}>
            <Button
              backgroundColor={appColors.primary}
              color={appColors.white}
              title={translateData.verifyOTP}
              onPress={verifyOTP}
              loading={verifyLoader}
            />
          </View>
          <View style={{ marginTop: windowHeight(1.5) }}>
            <Button
              backgroundColor={appColors.alertRed}
              color={appColors.white}
              title={'Cancel Ride'}
              onPress={cancelOpen}
              loading={cancelLoader}
            />
          </View>
        </BottomSheet>

        <BottomSheet
          ref={successSheetRef}
          index={-1}
          snapPoints={successSnapPoints}
          enablePanDownToClose={false}
          enableContentPanningGesture={false}
          enableHandlePanningGesture={false}
          handleIndicatorStyle={{ backgroundColor: appColors.primary, width: '13%' }}
          backdropComponent={renderBackdrop}
          backgroundStyle={{ backgroundColor: isDark ? appColors.bgDark : appColors.white }}
        >
          <BottomSheetView style={{ alignItems: 'center' }}>
            <View style={[styles.model, { marginTop: windowHeight(8) }]}>
              <View style={styles.imageView}>
                <Image
                  source={images.otpRide}
                  style={styles.image}
                  resizeMode={'contain'}
                />
              </View>
              <Text style={[styles.title, { color: colors.text }]}>
                {translateData.otpSuccessfully}
              </Text>
              <Text style={{ color: appColors.darkBorderBlack, textAlign: 'center', fontFamily: appFonts.regular, fontSize: fontSizes.FONT4, bottom: windowHeight(4) }}>{translateData.verificationDone}</Text>
              <View style={{ width: '100%', bottom: windowHeight(0.2) }}>
                <Button
                  title={translateData.done}
                  color={appColors.white}
                  backgroundColor={appColors.primary}
                  onPress={gotocomplete}
                />
              </View>
            </View>
          </BottomSheetView>
        </BottomSheet>

        <BottomSheet
          ref={cancelReasonRef}
          index={-1}
          snapPoints={snapCancelReason}
          enablePanDownToClose={true}
          handleIndicatorStyle={{ backgroundColor: appColors.primary, width: '13%' }}
          backdropComponent={(props) => (
            <BottomSheetBackdrop
              {...props}
              pressBehavior="close"
              disappearsOnIndex={-1}
              appearsOnIndex={0}
            />
          )}
          backgroundStyle={{ backgroundColor: isDark ? appColors.bgDark : appColors.white }}

        >
          <BottomSheetView style={{ padding: windowHeight(2) }}>
            <Text style={{ fontSize: fontSizes.FONT4, fontWeight: '600', marginBottom: windowHeight(2) }}>
              {translateData.whyyouWanttoCancel}
            </Text>

            {canceldata?.data
              ?.filter(item => item?.status === 1)
              .map((item, index) => (
                <TouchableOpacity
                  key={index}
                  onPress={() => setSelectedReason(item)} 
                  style={{
                    paddingVertical: windowHeight(1.5),
                    paddingHorizontal: windowWidth(1.5),
                    flexDirection: 'row',
                    alignItems: 'center',
                    borderBottomWidth: 0.5,
                    borderBottomColor: appColors.border,
                    backgroundColor:
                      selectedReason?.id === item?.id
                        ? appColors.categoryTitle
                        : appColors?.graybackground,
                    borderRadius: windowHeight(0.8),
                    marginBottom: windowHeight(2),
                  }}
                >
                  <Image
                    source={{ uri: item?.icon_image_url }}
                    style={{
                      height: windowHeight(3),
                      width: windowHeight(3),
                      resizeMode: 'contain',
                    }}
                  />
                  <View style={{ marginHorizontal: 10 }} />
                  <Text style={{ color: colors.text }}>{item.title}</Text>
                </TouchableOpacity>
              ))}

            <View style={{ marginHorizontal: windowWidth(-4) }}>
              <Button
                title={translateData.confirmCancel}
                onPress={() => {
                  if (selectedReason) {
                    cancelRide(selectedReason); 
                  } else {
                    Alert.alert(translateData.selectareason, translateData.cancelreason);
                  }
                }}
                backgroundColor={appColors.alertRed}
                color={appColors.white}
                loading={cancelLoaders}
              />
            </View>
          </BottomSheetView>
        </BottomSheet>
      </View>
    </View>
  );

}