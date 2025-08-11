import React, { useCallback, useEffect, useRef, useState } from 'react';
import { Animated, View, StyleSheet, Image, Text, TouchableOpacity, Vibration, FlatList, BackHandler, Platform, Linking } from 'react-native';
import appColors from '../../../theme/appColors';
import { fontSizes, windowHeight, windowWidth } from '../../../theme/appConstant';
import Icons from '../../../utils/icons/icons';
import { useDispatch, useSelector } from 'react-redux';
import Images from '../../../utils/images/images';
import appFonts from '../../../theme/appFonts';
import useSmartLocation from '../../../commonComponents/helper/locationHelper';
import { useFocusEffect, useIsFocused, useNavigation } from '@react-navigation/native';
import { Button, notificationHelper } from '../../../commonComponents';
import { startLiveLocation, stopLiveLocation } from '../../../commonComponents/helper/liveLocationHelper';
import firestore from '@react-native-firebase/firestore'
import { dashBoardData, rideDataGets, rideRequestDataGet, selfDriverData, sosAlertGet, sosDataGet, taxidosettingDataGet, vehicleData, walletData } from '../../../api/store/action';
import Sound from 'react-native-sound';
import { MapScreen } from '../mapScreen';
import BottomSheet, { BottomSheetModal, BottomSheetView, BottomSheetModalProvider } from '@gorhom/bottom-sheet';
import { UpcomingRide } from '../component';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { sosAlertDataInterface } from '../../../api/interface/sosInterface';
import { useValues } from '../../../utils/context';

const PulseCircle = ({ delay = 0, color }) => {
  const scale = useRef(new Animated.Value(1)).current;
  const opacity = useRef(new Animated.Value(0.6)).current;

  useEffect(() => {
    Animated.loop(
      Animated.sequence([
        Animated.delay(delay),
        Animated.parallel([
          Animated.timing(scale, {
            toValue: 2,
            duration: 2000,
            useNativeDriver: true,
          }),
          Animated.timing(opacity, {
            toValue: 0,
            duration: 2000,
            useNativeDriver: true,
          }),
        ]),
        Animated.timing(scale, {
          toValue: 1,
          duration: 0,
          useNativeDriver: true,
        }),
        Animated.timing(opacity, {
          toValue: 0.6,
          duration: 0,
          useNativeDriver: true,
        }),
      ])
    ).start();
  }, [delay]);

  return (
    <Animated.View
      style={[
        styles.pulse,
        {
          backgroundColor: color,
          transform: [{ scale }],
          opacity,
        },
      ]}
    />
  );
};


export function Home() {
  const { currentLatitude, currentLongitude } = useSmartLocation();
  const { selfDriver } = useSelector((state: any) => state.account);
  const char = selfDriver?.name ? selfDriver.name.charAt(0) : '';
  const { zoneValue } = useSelector((state) => state.zoneUpdate)
  const driverId = selfDriver?.id;
  const maskedAmount = `${zoneValue?.currency_symbol}**** **`;
  const [isOnline, setIsOnline] = useState(false);
  const { taxidoSettingData } = useSelector((state) => state.setting);
  const { sosData, sosAlert } = useSelector((state) => state.sos);
  let isSoundPlaying = false;
  const [selectDriverVisible, setSelectDriverVisible] = useState(false);
  const [selectDriverContect, setSelectDriverContect] = useState(false);
  const upcomingRideRef = useRef(null);
  const [selectedRide, setSelectedRide] = useState(null);
  const lastDriverId = useRef(null);
  const rideIdsRef = useRef(new Set());
  const [rides, setRides] = useState();
  const dispatch = useDispatch();
  const { navigate } = useNavigation<navigation>();
  const navigation = useNavigation<navigation>();
  const [status, setStatus] = useState<'online' | 'offline'>('online');
  const mapScreenRef = useRef();
  const bottomSheetModalRef = useRef<BottomSheetModal>(null);
  const [isBottomSheetOpen, setIsBottomSheetOpen] = useState(false);
  const [totalOnlineSeconds, setTotalOnlineSeconds] = useState(0);
  const bottomSheetOfflineRef = useRef<BottomSheetModal>(null);
  const [isBottomSheetOfflineOpen, setIsBottomSheetOfflineOpen] = useState(false);
  const [offlineloading, setOfflineLoading] = useState(false);
  const [isAmountVisible, setIsAmountVisible] = useState(false);
  const [viewMode, setViewMode] = useState<'amount' | 'time'>('amount');
  const bottomSheetSOSRef = useRef<BottomSheetModal>(null);
  const [isBottomSheetSOSOpen, setIsBottomSheetSOSOpen] = useState(false);
  const [location, setLocation] = useState<{ latitude: number; longitude: number } | null>(null);
  const { translateData } = useSelector((state) => state.setting);
  const { isDark, viewRtlStyle } = useValues()

  const { dashBoardList } = useSelector((state) => state.dashboard);
  const TodayIncome = `${zoneValue?.currency_symbol}${dashBoardList?.day?.dayRevenues?.revenues?.slice(-1)[0]}`;

  const fetchStoredLocation = async () => {
    try {
      const lat = await AsyncStorage.getItem('user_latitude');
      const lng = await AsyncStorage.getItem('user_longitude');
      if (lat && lng) {
        setLocation({
          latitude: parseFloat(lat),
          longitude: parseFloat(lng),
        });
      } else {
        setLocation(null);
      }
    } catch (error) {
      console.warn('❌ Error fetching location:', error);
    }
  };

  useFocusEffect(
    useCallback(() => {
      fetchStoredLocation();
    }, [])
  );
  const isFocused = useIsFocused();
  const bottomSheetRef = useRef(null);
  const snapPoints = ['30%'];



  useEffect(() => {
    if (!isFocused) return;

    const backAction = () => {
      bottomSheetRef.current?.expand();
      return true;
    };

    const backHandler = BackHandler.addEventListener(
      'hardwareBackPress',
      backAction
    );

    return () => backHandler.remove();
  }, [isFocused]);

  const handleExit = () => {
    bottomSheetRef.current?.close();
    setTimeout(() => {
      BackHandler.exitApp();
    }, 150);
  };

  const handleCloseSheet = () => {
    bottomSheetRef.current?.close();
  };

  useEffect(() => {
    dispatch(sosDataGet());
  }, [])

  useEffect(() => {
    const fetchStatus = async () => {
      try {
        const doc = await firestore().collection('driverTrack').doc(driverId.toString()).get();
        const isOnline = doc.data()?.is_online;
        setStatus(isOnline == 1 ? 'online' : 'offline');
      } catch (error) {
        console.error('Failed to fetch status:', error);
      }
    };
    if (driverId) {
      fetchStatus();
    }
  }, [driverId]);

  const handlePresentModalPress = useCallback(() => {
    if (isBottomSheetOpen) {
      bottomSheetModalRef.current?.close();
      setIsBottomSheetOpen(false);
    } else {
      bottomSheetModalRef.current?.present();
      setIsBottomSheetOpen(true);
    }
  }, [isBottomSheetOpen]);

  const handleSheetChanges = useCallback((index: number) => {
  }, []);

  const statusColors = {
    online: {
      outer: '#198E70',
      inner: '#199675',
      pulse1: '#579577',
      pulse2: '#DFEBE8',
      label: 'Online',
      icon: <Icons.Online />,
    },
    offline: {
      outer: '#F14848',
      inner: '#FF4B4B',
      pulse1: '#B42D30',
      pulse2: '#F5D5D6',
      label: 'Offline',
      icon: <Icons.Stop />,
    },
  };

  const nextStatus = status === 'online' ? 'offline' : 'online';
  const current = statusColors[nextStatus];

  useEffect(() => {
    if (!taxidoSettingData || Object.keys(taxidoSettingData).length === 0) {
      dispatch(taxidosettingDataGet());
      dispatch(selfDriverData())
    }
  }, [taxidoSettingData]);

  const playNotificationSound = () => {
    Vibration.vibrate(100)
    if (isSoundPlaying) {
      return;
    }
    isSoundPlaying = true;
    const sound = new Sound(
      'https://res.cloudinary.com/dwsbvqylx/video/upload/v1748766805/mixkit-urgent-simple-tone-loop-2976_ip7rwc.wav',
      null,
      (error) => {
        if (error) {
          isSoundPlaying = false;
          return;
        }
        sound.play((success) => {
          if (success) {
          } else {
          }
          sound.release();
          isSoundPlaying = false;
        });
        setTimeout(() => {
          sound.stop(() => {
            sound.release();
            isSoundPlaying = false;
          });
        }, 5000);
      }
    );
  };

  useEffect(() => {
    if (!selfDriver?.id || lastDriverId.current === selfDriver.id) return;
    lastDriverId.current = selfDriver.id;
    let rideUnsubs: (() => void)[] = [];
    const driverDocUnsub = firestore()
      .collection('driver_ride_requests')
      .doc(selfDriver?.id?.toString())
      .onSnapshot(async (doc) => {
        if (!doc.exists) {
          setRides([]);
          rideUnsubs.forEach(unsub => unsub());
          rideUnsubs = [];
          return;
        }

        const rideRequestIds = doc?.data()?.ride_requests || [];

        rideUnsubs.forEach(unsub => unsub());
        rideUnsubs = [];
        setRides([]);
        rideRequestIds.forEach((ride) => {
          const unsub = firestore()
            .collection('ride_requests')
            .doc(ride?.id.toString())
            .onSnapshot((rideDoc) => {
              if (rideDoc?.exists) {
                setRides((prev) => {
                  const updated = prev.filter(r => r.id !== rideDoc.id);
                  const newRide = { id: rideDoc?.id, ...rideDoc?.data() };
                  const alreadyExists = rideIdsRef.current.has(rideDoc.id);
                  if (!alreadyExists) {
                    rideIdsRef.current.add(rideDoc.id);
                    playNotificationSound();
                  }
                  return [...updated, newRide];
                });
              }
            });
          rideUnsubs.push(unsub);
        });
      });
    return () => {
      driverDocUnsub();
      rideUnsubs.forEach(unsub => unsub());
    };
  }, [selfDriver?.id]);

  useFocusEffect(
    useCallback(() => {
      dispatch(rideDataGets())
      dispatch(vehicleData())
      dispatch(walletData());
      const unit = zoneValue?.distance_type
      const zoneId = zoneValue?.id
      dispatch(dashBoardData({ unit, zoneId }))
    }, []),
  )

  const gotoRide = (ride) => {
    if (ride?.service_category?.service_category_type === "rental") {
      navigate("RentalDetails", { ride });
    } else {
      navigation.navigate("Ride", { ride });
    }
    bottomSheetModalRef.current?.close();
    setIsBottomSheetOpen(false);
  };

  const gotoInfo = (ride) => {
    if (ride?.service_category?.service_category_type === "schedule" || ride?.service?.service_type === "freight" || ride?.service?.service_type === "parcel" || ride?.service_category?.service_category_type === "package") {
      navigate("RideInfo", { ride });
    } else if (ride?.service_category?.service_category_type === "rental") {
      navigate("RentalDetails", { ride });
    }
  }

  useEffect(() => {
    const zone_id = zoneValue?.id
    dispatch(rideRequestDataGet(zone_id))

    const intervalId = setInterval(() => {
      dispatch(rideRequestDataGet(zone_id));
    }, 5000);

    return () => clearInterval(intervalId);
  }, [dispatch]);

  const selectDriver = (ride) => {
    setSelectDriverVisible(true)
    setSelectedRide(ride);
  }

  const onRideDeclined = () => {
    if (rides?.length <= 1) {
      bottomSheetModalRef.current?.close();
    }
  };


  useFocusEffect(
    useCallback(() => {
      const fetchOnlineStatus = async () => {
        if (selfDriver?.wallet_balance < 0) {
          notificationHelper("", translateData.lowBalance, "error")
          setIsOnline(false);
          return
        }
        const driverId = selfDriver?.id;
        if (!driverId) {
          setIsOnline(false);
          return;
        }
        try {
          const doc = await firestore().collection('driverTrack').doc(driverId.toString()).get();
          if (doc.exists) {
            const data = doc.data();
            const online = data?.is_online === "1";
            setIsOnline(online);
            online ? startLiveLocation(driverId) : stopLiveLocation();
          } else {
            setIsOnline(false);
            stopLiveLocation();
          }
        } catch (error) {
          console.error('Error fetching driver status:', error);
          setIsOnline(false);
          stopLiveLocation();
        }
      };
      fetchOnlineStatus();
    }, [selfDriver?.id])
  );

  const getTodayDateStr = () => {
    const today = new Date();
    return today.toISOString().split('T')[0];
  };


  const toggleSwitch = async () => {
    Vibration.vibrate(42);
    const driverId = selfDriver?.id;

    if (!driverId) {
      console.warn("❌ Driver ID not found");
      return;
    }

    const driverRef = firestore().collection('driverTrack').doc(driverId.toString());

    if (!isOnline) {
      if (selfDriver?.wallet_balance < 0) {
        notificationHelper("", translateData.lowBalance, "error");
        return;
      }

      const today = getTodayDateStr();
      const doc = await driverRef.get();
      const data = doc.data() || {};
      const now = firestore.Timestamp.now();

      const updatePayload: any = {
        is_online: '1',
        last_online_at: now,
        lat: currentLatitude?.toString(),
        lng: currentLongitude?.toString(),
        service_id: selfDriver?.service_id,
        service_category_id: selfDriver?.service_category_id,
        vehicle_type_id: selfDriver?.vehicle_info?.vehicle_type_id,
        vehicle_map_icon_url: selfDriver?.vehicle_info?.vehicle_type_map_icon_url,
        driver_name: selfDriver?.name,
        review_count: selfDriver?.review_count,
        rating_count: selfDriver?.rating_count,
        model: selfDriver?.vehicle_info?.model,
        plate_number: selfDriver?.vehicle_info?.plate_number,
        profile_image_url: selfDriver?.profile_image_url
      };
      setIsOnline(true);
      setStatus('online');

      if (data.date !== today) {
        updatePayload.total_online_time_today = 0;
        updatePayload.date = today;
      }

      try {
        await driverRef.set(updatePayload, { merge: true });
        const success = await startLiveLocation(driverId, selfDriver);
        if (success) {
          setIsOnline(true);
          setStatus('online');
        }
      } catch (err) {
        console.error("❌ Error going online:", err);
      }

    } else {
      // Going offline
      bottomSheetOfflineRef.current?.present();
      setIsBottomSheetOfflineOpen(true);
    }
  };

  const driverOffline = async () => {
    setOfflineLoading(true)
    const driverRef = firestore().collection('driverTrack').doc(driverId.toString());

    try {
      stopLiveLocation();
      const doc = await driverRef.get();
      const data = doc.data();
      const now = new Date();
      const lastOnlineAt = data?.last_online_at?.toDate?.();
      let totalTime = data?.total_online_time_today || 0;

      if (lastOnlineAt) {
        const seconds = Math.floor((now.getTime() - lastOnlineAt.getTime()) / 1000);
        totalTime += seconds;
      }

      await driverRef.set({
        is_online: '0',
        total_online_time_today: totalTime,
        lat: currentLatitude?.toString(),
        lng: currentLongitude?.toString(),
      }, { merge: true });

      setIsOnline(false);
      setStatus('offline');
      closeDriveroffline();
      setOfflineLoading(false)
    } catch (err) {
      console.error("❌ Error going offline:", err);
    }
  }

  const closeDriveroffline = () => {
    bottomSheetOfflineRef.current?.close();
    setIsBottomSheetOfflineOpen(false);

  }

  const fetchTime = async () => {
    const snap = await firestore().collection('driverTrack').doc(selfDriver?.id.toString()).get();
    const seconds = snap?.data()?.total_online_time_today || 0;
    setTotalOnlineSeconds(seconds);
  };

  const formatSecondsToHHMM = (totalSeconds: number): string => {
    const hours = Math.floor(totalSeconds / 3600);
    const minutes = Math.floor((totalSeconds % 3600) / 60);
    return `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}`;
  };

  const sosSheet = () => {
    if (isBottomSheetSOSOpen) {
      bottomSheetSOSRef.current?.close();
      setIsBottomSheetSOSOpen(false);
    } else {
      bottomSheetSOSRef.current?.present();
      setIsBottomSheetSOSOpen(true);
    }
  }

  const toggleHeader = () => {
    Vibration.vibrate(52);
    setViewMode(prev => (prev === 'amount' ? 'time' : 'amount'));
    fetchTime();
  }

  const sosCall = (details) => {
    const payload: sosAlertDataInterface = {
      sos_id: details?.id,
      location_coordinates:
      {
        lat: currentLatitude,
        lng: currentLongitude
      }
    }
    dispatch(sosAlertGet(payload))
      .unwrap()
      .then(async (res: any) => {
        const phone = details?.phone
        Linking.openURL(`tel:${phone}`);
      })
  }

  useEffect(() => {
    if (rides?.length > 0) {
      bottomSheetModalRef.current?.present();
      setIsBottomSheetOpen(true);
    }
  }, [rides])


  const mapRef = useRef();

  const handleFocusPress = () => {
    mapRef.current?.focusToCurrentLocation();
  };



  return (
    <View style={{ flex: 1 }}>
      <MapScreen
        ref={mapRef}
        markerIcon={selfDriver?.vehicle_info?.vehicle_type_map_icon_url}
      />
      <View style={{ flexDirection: 'row', justifyContent: 'space-between', top: '3%', alignItems: 'center' }}>
        <TouchableOpacity activeOpacity={0.9} onPress={() => navigate('ProfileSetting')} style={{ left: windowHeight(2) }}>
          {selfDriver?.profile_image_url
            ? (
              <Image
                style={{ backgroundColor: appColors.primary, height: windowHeight(5.5), width: windowHeight(5.5), borderRadius: windowHeight(5) }}
                source={{
                  uri: selfDriver?.profile_image_url
                }}
              />
            ) : (
              <View style={{
                alignItems: 'center',
                justifyContent: 'center',
                width: windowHeight(5.5),
                height: windowHeight(5.5),
                backgroundColor: appColors.primary,
                borderRadius: windowHeight(74),
              }}>
                <Text style={{
                  color: appColors.white, fontFamily: appFonts.bold,
                  fontSize: fontSizes.FONT5
                }}>
                  {char}
                </Text>
              </View>
            )}
        </TouchableOpacity>

        <TouchableOpacity
          onPress={() => toggleHeader()}
          activeOpacity={0.9}
          style={{
            flexDirection: 'row',
            alignItems: 'center',
            justifyContent: 'center',
            backgroundColor: appColors.primary,
            height: windowHeight(5.5),
            borderRadius: windowHeight(8.5),
            paddingHorizontal: windowWidth(4.3),
          }}
        >
          {viewMode === 'time' ? (
            <Icons.Clock color={appColors.white} />
          ) : (
            <TouchableOpacity
              onPress={(e) => {
                e.stopPropagation();
                setIsAmountVisible(prev => !prev);
              }}
            >
              {isAmountVisible ? <Icons.Eye /> : <Icons.WalletEyeClose />}
            </TouchableOpacity>
          )}

          <View
            style={{
              height: windowHeight(1.5),
              width: windowHeight(0.1),
              backgroundColor: appColors.white,
              marginHorizontal: windowWidth(1.5),
            }}
          />

          <Text style={styles.text}>
            {viewMode === 'time'
              ? `${formatSecondsToHHMM(totalOnlineSeconds)} hrs`
              : isAmountVisible
                ? TodayIncome
                : maskedAmount}
          </Text>
        </TouchableOpacity>
        <TouchableOpacity onPress={() => navigate('Notification')} activeOpacity={0.9}
          style={{
            height: windowHeight(5.5), width: windowHeight(5.5),
            backgroundColor: isDark ? appColors.darkThemeSub : appColors.white,
            borderRadius: windowHeight(15),
            alignItems: 'center', justifyContent: 'center', right: windowHeight(2),
            borderColor: isDark ? appColors.darkBorderBlack : appColors.white,
            borderWidth: 1
          }}>
          <Icons.Notification color={isDark ? appColors.white : appColors.primaryFont} />
        </TouchableOpacity>
      </View>
      <TouchableOpacity
        activeOpacity={0.9}
        style={{
          height: windowHeight(5.5),
          width: windowHeight(5.5),
          backgroundColor: isDark ? appColors.darkThemeSub : appColors.white,
          borderRadius: windowHeight(15),
          alignItems: 'center',
          justifyContent: 'center',
          left: windowHeight(2),
          top: windowHeight(4),
          position: 'relative',
          borderColor: isDark ? appColors.darkBorderBlack : appColors.white,

        }}
        onPress={handlePresentModalPress}
      >
        <Icons.Car color={isDark ? appColors.white : appColors.primaryFont} />
        {rides?.length > 0 && (
          <View
            style={{
              position: 'absolute',
              top: windowHeight(1),
              right: windowHeight(1),
              height: windowHeight(1),
              width: windowHeight(1),
              backgroundColor: appColors.red,
              borderRadius: 5,
            }}
          />
        )}
      </TouchableOpacity>


      <TouchableOpacity onPress={sosSheet} style={{ marginHorizontal: windowHeight(2), top: '80.5%', position: 'absolute', backgroundColor: isDark ? appColors.alertIconBg : appColors.white, borderColor: isDark ? appColors.red : appColors.border, justifyContent: 'center', borderWidth: windowHeight(0.15), height: windowHeight(7), width: windowHeight(7), borderRadius: windowHeight(4), alignItems: 'center' }}>
        <Icons.SOS />
      </TouchableOpacity>
      <TouchableOpacity onPress={handleFocusPress} style={{ top: '69.3%', backgroundColor: isDark ? appColors.darkThemeSub : appColors.white, height: windowHeight(7), width: windowHeight(7), borderRadius: windowHeight(4), borderColor: isDark ? appColors.darkBorderBlack : appColors.border, justifyContent: 'center', borderWidth: windowHeight(0.15), alignItems: "center", alignSelf: 'flex-end', right: windowHeight(2) }}>
        <Icons.LocationIcon color={isDark ? appColors.white : appColors.primaryFont} />
      </TouchableOpacity>

      {(!isBottomSheetOpen && !isBottomSheetOfflineOpen && !isBottomSheetSOSOpen) && (
        <View style={styles.container}>
          <PulseCircle delay={0} color={current.pulse1} />
          <PulseCircle delay={600} color={current.pulse2} />
          <View style={[styles.staticOuterCircle, { backgroundColor: current.outer }]} />
          <TouchableOpacity onPress={toggleSwitch} style={[styles.button, { backgroundColor: current.inner }]}>
            {current.icon}
          </TouchableOpacity>
        </View>
      )}

      <BottomSheetModalProvider>
        <BottomSheetModal
          ref={bottomSheetModalRef}
          index={0}
          snapPoints={rides?.length >= 2 ? ['50%', '75%'] : ['50%']}
          onChange={handleSheetChanges}
          onDismiss={() => setIsBottomSheetOpen(false)}
          handleIndicatorStyle={{ backgroundColor: appColors.primary, width: '13%' }}
          backgroundStyle={{ backgroundColor: isDark ? appColors.bgDark : appColors.white }}
        >
          <BottomSheetView style={styles.contentContainer}>
            {rides?.length > 0 ? (
              <FlatList
                data={[...rides]
                  .filter(
                    ride => ride?.rider_id && ride?.location_coordinates
                  )
                  .sort((a, b) => {
                    const timeA = a.created_at?._seconds ?? 0;
                    const timeB = b.created_at?._seconds ?? 0;
                    return timeB - timeA;
                  })}
                keyExtractor={(item, index) =>
                  item?.id?.toString() || index.toString()
                }
                renderItem={({ item }) => (
                  <UpcomingRide
                    ride={item}
                    ref={upcomingRideRef}
                    gotoRide={gotoRide}
                    gotoInfo={gotoInfo}
                    selectDriver={selectDriver}
                    onRideDeclined={onRideDeclined}
                  />
                )}
                ListEmptyComponent={
                  <Text style={styles.noRideText}>{translateData.noUpcomingrides}</Text>
                }
              />
            ) : (
              <View style={styles.noRideContainer}>
                <Image
                  source={Images.noRide}
                  style={styles.noRideImg}
                  resizeMode="contain"
                />
                <Text style={styles.noRideText}>
                  {translateData.waitNewRide}
                </Text>
              </View>
            )}
          </BottomSheetView>
        </BottomSheetModal>
      </BottomSheetModalProvider>

      <BottomSheetModalProvider>
        <BottomSheetModal
          ref={bottomSheetOfflineRef}
          index={0}
          snapPoints={['30%']}
          onChange={handleSheetChanges}
          onDismiss={() => setIsBottomSheetOfflineOpen(false)}
          style={{ zIndex: 2 }}
          handleIndicatorStyle={{ backgroundColor: appColors.primary, width: '13%' }}
          backgroundStyle={{ backgroundColor: isDark ? appColors.bgDark : appColors.white }}
        >
          <BottomSheetView style={styles.contentContainer}>
            <View>
              <Text
                style={{ color: isDark ? appColors.white : appColors.primaryFont, fontFamily: appFonts.medium, fontSize: fontSizes.FONT4HALF, textAlign: 'center', marginBottom: windowHeight(5) }}>{translateData.offlineMsg}</Text>
              <View style={{ flexDirection: 'row', justifyContent: 'space-between' }}>
                <View style={{ width: windowWidth(46) }}>
                  <Button title={translateData.cancel} backgroundColor={isDark ? appColors.darkThemeSub : appColors.graybackground} onPress={closeDriveroffline} color={isDark ? appColors.white : appColors.black} />
                </View>
                <View style={{ width: windowWidth(46) }}>
                  <Button title={translateData.confirm} backgroundColor={appColors.red} color={appColors.white} onPress={driverOffline} loading={offlineloading} />
                </View>
              </View>
            </View>
          </BottomSheetView>
        </BottomSheetModal>
      </BottomSheetModalProvider>

      <BottomSheetModalProvider>
        <BottomSheetModal
          ref={bottomSheetSOSRef}
          index={0}
          snapPoints={['50%']}
          onChange={handleSheetChanges}
          onDismiss={() => setIsBottomSheetSOSOpen(false)}
          style={{ zIndex: 2 }}
          handleIndicatorStyle={{ backgroundColor: appColors.primary, width: '13%' }}
          backgroundStyle={{ backgroundColor: isDark ? appColors.bgDark : appColors.white }}
        >
          <BottomSheetView style={styles.contentContainer}>
            <View>
              <Text style={{ color: isDark ? appColors.white : appColors.primaryFont, fontFamily: appFonts.medium, fontSize: fontSizes.FONT4HALF, textAlign: 'center', marginBottom: windowHeight(5) }}>{translateData.keepSafe}</Text>
            </View>
            <FlatList
              data={sosData?.data}
              keyExtractor={(item, index) => index.toString()}
              contentContainerStyle={{ paddingBottom: windowHeight(2) }}
              renderItem={({ item }) => (
                <TouchableOpacity
                  style={{
                    padding: windowHeight(1.5),
                    marginVertical: windowHeight(0.5),
                    backgroundColor: isDark ? appColors.darkThemeSub : appColors.graybackground,
                    borderRadius: 8,
                  }}
                  onPress={() => sosCall(item)}
                >
                  <View style={{ flexDirection: viewRtlStyle, alignItems: 'center' }}>
                    <Image
                      source={{ uri: item?.sos_image_url }}
                      style={[styles.sosImage]}
                    />
                    <View style={[styles.sideLine, { backgroundColor: isDark ? appColors.darkBorderBlack : appColors.border }]} />
                    <Text style={{ color: isDark ? appColors.white : appColors.black, fontFamily: appFonts.regular, fontSize: fontSizes.FONT4HALF }}>
                      {item?.title ?? 'No Title'}
                    </Text>
                  </View>
                </TouchableOpacity>
              )}
              ListEmptyComponent={
                <Text
                  style={{
                    textAlign: 'center',
                    color: isDark ? appColors.white : appColors.black,
                    fontFamily: appFonts.regular,
                    marginTop: windowHeight(2),
                  }}
                >
                  {translateData.noSOS}
                </Text>
              }
            />
          </BottomSheetView>
        </BottomSheetModal>
      </BottomSheetModalProvider>
      <BottomSheet
        ref={bottomSheetRef}
        index={-1}
        snapPoints={snapPoints}
        enablePanDownToClose
        handleIndicatorStyle={{ backgroundColor: appColors.primary, width: '13%' }}
        backgroundStyle={{ backgroundColor: isDark ? appColors.bgDark : appColors.white }}
      >
        <View style={{ padding: 20 }}>
          <Text style={{ fontSize: 18, fontWeight: '600', marginBottom: 10 }}>
            {translateData.exitMsg}
          </Text>
          <TouchableOpacity onPress={handleExit} style={{ marginVertical: 10 }}>
            <Text style={{ color: 'red', fontSize: 16 }}>{translateData.exit}</Text>
          </TouchableOpacity>
          <TouchableOpacity onPress={handleCloseSheet} style={{ marginVertical: 10 }}>
            <Text style={{ fontSize: 16 }}>{translateData.cancel}</Text>
          </TouchableOpacity>
        </View>
      </BottomSheet>
    </View >
  );
}

const SIZE = windowHeight(7.5);
const OUTER_SIZE = SIZE + windowHeight(1.2);

const styles = StyleSheet.create({
  text: {
    color: appColors.white,
    fontSize: fontSizes.FONT4,
    fontFamily: appFonts.medium,
  },
  container: {
    alignSelf: 'center',
    position: 'absolute',
    bottom: windowHeight(5),
    height: SIZE * 3,
    width: SIZE * 3,
    justifyContent: 'center',
    alignItems: 'center',
    zIndex: 1
  },
  pulse: {
    position: 'absolute',
    height: SIZE,
    width: SIZE,
    borderRadius: SIZE / 2,
    zIndex: 0,
  },
  staticOuterCircle: {
    position: 'absolute',
    height: OUTER_SIZE,
    width: OUTER_SIZE,
    borderRadius: OUTER_SIZE / 2,
    backgroundColor: '#198C6E',
    zIndex: 1,
  },
  button: {
    height: SIZE,
    width: SIZE,
    borderRadius: SIZE / 2,
    backgroundColor: '#199675',
    justifyContent: 'center',
    alignItems: 'center',
    borderColor: 'white',
    borderWidth: windowHeight(0.15),
    zIndex: 2,
  },
  contentContainer: {
    flex: 1,
    paddingHorizontal: 16,
    paddingTop: 10,
    height: windowHeight(80)
  },
  noRideContainer: {
    flex: 1,
    alignItems: 'center',
  },
  noRideImg: {
    width: windowWidth(80),
    height: windowWidth(80),
  },
  noRideText: {
    fontFamily: appFonts.medium,
    fontSize: fontSizes.FONT4,
    color: appColors.secondaryFont,
    textAlign: 'center'
  },
  sosImage: {
    height: windowHeight(2.5),
    width: windowHeight(2.5),
    resizeMode: 'contain',
  },
  sideLine: {
    height: windowHeight(3),
    width: windowWidth(0.3),
    backgroundColor: appColors.white,
    marginHorizontal: windowWidth(3)
  }
});



