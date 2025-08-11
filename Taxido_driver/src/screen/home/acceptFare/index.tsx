import { View, Text, Image, TouchableOpacity } from 'react-native'
import React, { useEffect, useMemo, useRef, useState, useCallback } from 'react'
import { useTheme, useRoute } from '@react-navigation/native'
import styles from './styles'
import { BackButton, notificationHelper } from '../../../commonComponents'
import { TotalFair } from './component'
import appColors from '../../../theme/appColors'
import { DriverProfile } from '../../../commonComponents'
import { Button } from '../../../commonComponents'
import { useDispatch, useSelector } from 'react-redux'
import firestore from '@react-native-firebase/firestore'
import { ArrivedMap } from '../../../commonComponents/maps/arrivedMap'
import { useAppNavigation } from '../../../utils/navigation'
import { cancelationDataGet, rideDataPut } from '../../../api/store/action'
import { BottomSheetModal, BottomSheetModalProvider, BottomSheetView, BottomSheetBackdropProps } from '@gorhom/bottom-sheet'
import { fontSizes, windowHeight, windowWidth } from '../../../theme/appConstant'
import appFonts from '../../../theme/appFonts'
import Animated, { useAnimatedStyle, interpolate, Extrapolate } from 'react-native-reanimated';
import { useValues } from '../../../utils/context'

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
    () => [style, containerAnimatedStyle],
    [style, containerAnimatedStyle]
  );

  return <Animated.View style={containerStyle} pointerEvents="box-none" />;
};


export function AcceptFare() {
  const navigation = useAppNavigation()
  const { colors } = useTheme()
  const route = useRoute()
  const { ride_Id, ride_Details } = route.params
  const { selfDriver } = useSelector((state: any) => state.account);
  const { canceldata } = useSelector((state: any) => state.cancelationReason);
  const [arrivedLoading, setArrivedLoading] = useState(false);
  const [cancelLoading, setCancelloading] = useState(false)
  const Driver_Id = selfDriver?.id;
  const [rideData, setRideData] = useState(null);
  const dispatch = useDispatch()
  const ambulanceRef = useRef<BottomSheetModal>(null);
  const cancelReasonRef = useRef<BottomSheetModal>(null);
  const snapPoints = useMemo(() => ["41%"], []);
  const snapCancelReason = useMemo(() => ["40%"], []);
  const { isDark } = useValues()
  const { translateData } = useSelector(state => state.setting)

  const renderBackdrop = useCallback(
    (props: BottomSheetBackdropProps) => <CustomBackdrop {...props} />,
    []
  );

  useEffect(() => {
    const ride_start = 'after'
    dispatch(cancelationDataGet({ ride_start }));
  }, [cancelReasonRef])

  useEffect(() => {
    if (!ride_Id) return;
    const unsubscribe = firestore()
      .collection('rides')
      .doc(ride_Id.toString())
      .onSnapshot(docSnap => {
        if (docSnap.exists) {
          const data = docSnap.data();
          setRideData(data);
          if (data?.ride_status?.slug === 'cancelled') {
            navigation.goBack();
            notificationHelper("", "Ride Canceled", "error")
          }
        } else {
          console.warn('❗ Ride not found');
          setRideData(null);
        }
      }, error => {
        console.error('🔥 Firestore real-time error:', error);
      });
    return () => unsubscribe();
  }, [ride_Id]);


  const gotoPickup = async () => {
    setArrivedLoading(true)
    dispatch(
      rideDataPut({
        data: {
          status: 'arrived',
        },
        ride_id: ride_Id,
      }),
    ).then(async (res: any) => {
      navigation.navigate('OtpRide', { rideData: rideData, ride_Id: ride_Id })
      setArrivedLoading(false)
    })
  }

  const cancelOpen = () => {
    ambulanceRef.current?.close();
    cancelReasonRef.current?.present();
  }

  const cancelRide = (item) => {
    dispatch(
      rideDataPut({
        data: {
          status: 'cancelled',
          cancellation_reason: item?.title
        },
        ride_id: ride_Id,
      }),
    ).then(async (res: any) => {
      if (res?.payload?.ride_status?.slug == 'cancelled') {
        navigation.navigate('TabNav')
      }
    })
  }

  const calcelSheet = () => {
    cancelReasonRef.current?.close();
  }

  useEffect(() => {
    ambulanceRef.current?.present();
  }, []);


  return (
    <BottomSheetModalProvider>
      <View style={styles.container}>
        <View style={styles.mapSection}>
          <ArrivedMap Pickuplocation={ride_Details?.location_coordinates[0]} driverId={Driver_Id} />
        </View>
        <View style={styles.backButton}>
          <BackButton />
        </View>

        <BottomSheetModal
          ref={ambulanceRef}
          index={0}
          snapPoints={snapPoints}
          enablePanDownToClose={false}
          handleIndicatorStyle={{ width: '13%', backgroundColor: appColors.primary }}
          backdropComponent={renderBackdrop}
          backgroundStyle={{ backgroundColor: isDark ? appColors.bgDark : appColors.white }}
        >
          <BottomSheetView>
            <View
              style={[
                styles.additionalSection,
                { backgroundColor: colors.card, borderColor: colors.border },
              ]}
            >
              <DriverProfile
                iconColor={appColors.primary}
                backgroundColor={appColors.graybackground}
                borderRadius={25}
                showInfoIcon={true}
                userDetails={rideData?.rider}
                rideDetails={rideData}
              />
            </View>
            <TotalFair
              onPress={gotoPickup}
              totalAmount={rideData?.total}
              paymentMethod={rideData?.payment_method}
            />
            <View style={{ marginBottom: windowHeight(2) }}>
              <Button
                title={translateData.arrived}
                backgroundColor={appColors.primary}
                color={appColors.white}
                onPress={gotoPickup}
                loading={arrivedLoading}
              />
            </View>
            <View style={{ marginBottom: windowHeight(2) }}>
              <Button
                title={translateData.cancelTextT}
                backgroundColor={appColors.alertRed}
                color={appColors.white}
                onPress={cancelOpen}
                loading={cancelLoading}
              />
            </View>
          </BottomSheetView>
        </BottomSheetModal>

        <BottomSheetModal
          ref={cancelReasonRef}
          index={1}
          snapPoints={snapCancelReason}
          enablePanDownToClose={true}
          onDismiss={() => {
            ambulanceRef.current?.present();
          }}
          handleIndicatorStyle={{ width: '13%', backgroundColor: appColors.primary }}
          backdropComponent={renderBackdrop}
        >
          <BottomSheetView>
            <Text style={{ textAlign: 'center', fontFamily: appFonts.medium, fontSize: fontSizes.FONT4, marginVertical: windowHeight(2) }}>
              {translateData.whyyouWanttoCancel}
            </Text>

            {canceldata?.data
              ?.filter(item => item.status === 1)
              .map((item, index) => (
                <TouchableOpacity
                  onPress={() => cancelRide(item)}
                  key={index}
                  style={{ flexDirection: 'row', alignItems: 'center', marginBottom: windowHeight(1), backgroundColor: appColors.graybackground, marginHorizontal: windowWidth(3.5), padding: windowHeight(1.5), borderRadius: windowHeight(0.8) }}
                >
                  <Image
                    source={{ uri: item?.icon_image_url }}
                    style={{ height: windowHeight(3.5), width: windowHeight(3.5) }}
                  />
                  <View
                    style={{
                      borderLeftWidth: 1,
                      borderLeftColor: appColors.border,
                      marginHorizontal: windowWidth(2),
                      height: '100%',
                    }}
                  />
                  <Text style={{ fontFamily: appFonts.regular }}>{item.title}</Text>
                </TouchableOpacity>
              ))}

            <Button
              title='Close'
              backgroundColor={appColors.primary}
              color={appColors.white}
              onPress={calcelSheet}
            />
          </BottomSheetView>
        </BottomSheetModal>

      </View>
    </BottomSheetModalProvider>
  )
}