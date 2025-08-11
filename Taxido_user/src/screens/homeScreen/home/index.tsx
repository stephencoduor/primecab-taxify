import React, { useEffect, useState, useCallback, useContext, useRef, useMemo } from "react";
import { SafeAreaView, ScrollView, View, BackHandler, Text, StatusBar, StyleSheet } from "react-native";
import { useIsFocused, useFocusEffect } from "@react-navigation/native";
import { commonStyles } from "../../../styles/commonStyle";
import { TodayOfferContainer } from "../../../components/homeScreen/todaysOffer";
import { TopCategory } from "../../../components/homeScreen/topCategory";
import { HomeSlider } from "../../../components/homeScreen/slider";
import { HeaderContainer } from "../../../components/homeScreen/headerContainer";
import styles from "./styles";
import { useValues } from "../../../../App";
import { Button } from "@src/commonComponent";
import { external } from "../../../styles/externalStyle";
import { appColors, appFonts, fontSizes, windowHeight } from "@src/themes";
import { LocationContext } from "../../../utils/locationContext";
import { useDispatch, useSelector } from "react-redux";
import { vehicleData, vehicleTypeDataGet } from "../../../api/store/actions/vehicleTypeAction";
import SwipeButton from "@src/commonComponent/sliderButton";
import { useAppNavigation } from "@src/utils/navigation";
import { Recentbooking } from "@src/screens/recentBooking";
import { BottomTitle } from "@src/components";
import { allRides, notificationDataGet, paymentsData, serviceDataGet, taxidosettingDataGet, walletData } from "@src/api/store/actions";
import { HomeLoader } from "../HomeLoader";
import useStoredLocation from "@src/components/helper/useStoredLocation";
import BottomSheet, { BottomSheetBackdrop, BottomSheetView } from '@gorhom/bottom-sheet';

export function HomeScreen() {
  const dispatch = useDispatch();
  const { textColorStyle, viewRTLStyle, isDark } = useValues();
  const isFocused = useIsFocused();
  const context = useContext(LocationContext);
  const { setPickupLocationLocal, setStopsLocal, setDestinationLocal } = context;
  const [isScrolling, setIsScrolling] = useState(true);
  const { translateData, taxidoSettingData } = useSelector((state: any) => state.setting);
  const { reset } = useAppNavigation();
  const { self } = useSelector((state: any) => state.account);
  const { homeScreenDataPrimary, loading } = useSelector((state: any) => state.home);
  const { latitude, longitude } = useStoredLocation();
  const exitBottomSheetRef = useRef<BottomSheet>(null);
  const exitSnapPoints = useMemo(() => ['1%', '22%'], []);

  useEffect(() => {
    dispatch(taxidosettingDataGet());
    dispatch(allRides());
    dispatch(serviceDataGet());
    dispatch(vehicleData());
    dispatch(walletData());
    dispatch(paymentsData());
    dispatch(notificationDataGet());
    getVehicleTypes();
  }, [dispatch, getVehicleTypes]);

  const getVehicleTypes = useCallback(async () => {
    const locations = [
      {
        lat: latitude,
        lng: longitude,
      },
    ];
    if (latitude && longitude) {
      dispatch(vehicleTypeDataGet({ locations }));
    }
  }, [dispatch, latitude, longitude]);

  useEffect(() => {
    const backAction = () => {
      exitBottomSheetRef.current?.expand();
      return true;
    };
    if (isFocused) {
      const backHandler = BackHandler.addEventListener(
        "hardwareBackPress",
        backAction
      );
      return () => backHandler.remove();
    }
  }, [isFocused]);

  useFocusEffect(
    useCallback(() => {
      setPickupLocationLocal(null);
      setDestinationLocal(null);
      setStopsLocal([]);
      StatusBar.setBackgroundColor(appColors.primary);
      StatusBar.setBarStyle("light-content");
      return () => {
        StatusBar.setBackgroundColor("transparent");
        StatusBar.setBarStyle("dark-content");
      };
    }, [setPickupLocationLocal, setDestinationLocal, setStopsLocal])
  );

  const exitAndRestart = useCallback(() => {
    exitBottomSheetRef.current?.close();
    setTimeout(() => {
      BackHandler.exitApp();
      reset({
        index: 0,
        routes: [{ name: "Splash" }],
      });
    }, 500);
  }, [reset]);

  const renderBackdrop = useCallback(
    (props: any) => (
      <BottomSheetBackdrop
        {...props}
        appearsOnIndex={0}
        disappearsOnIndex={-1}
        pressBehavior="close"
      />
    ),
    []
  );


  const isDataEmpty =
    !homeScreenDataPrimary ||
    Object.keys(homeScreenDataPrimary).length === 0 ||
    homeScreenDataPrimary === null;

  return (
    <View
      style={[
        commonStyles.flexContainer,
        { backgroundColor: appColors.lightGray },
      ]}
    >
      <SafeAreaView style={styles.container}>
        <HeaderContainer />
      </SafeAreaView>
      {loading || isDataEmpty ? (
        <HomeLoader />
      ) : (
        <ScrollView
          showsVerticalScrollIndicator={false}
          removeClippedSubviews={true}
          nestedScrollEnabled={true}
          scrollEnabled={isScrolling}
          contentContainerStyle={[
            styles.containerStyle,
            {
              backgroundColor: isDark
                ? appColors.bgDark
                : appColors.lightGray,
            },
          ]}
        >
          {homeScreenDataPrimary?.banners?.length > 0 && (
            <HomeSlider
              onSwipeStart={() => setIsScrolling(false)}
              onSwipeEnd={() => setIsScrolling(true)}
              bannerData={homeScreenDataPrimary.banners}
            />
          )}
          {homeScreenDataPrimary?.service_categories?.length > 0 && (
            <TopCategory
              categoryData={homeScreenDataPrimary.service_categories}
            />
          )}
          {homeScreenDataPrimary?.recent_rides?.length > 0 && (
            <Recentbooking
              recentRideData={homeScreenDataPrimary.recent_rides}
            />
          )}
          {homeScreenDataPrimary?.coupons?.length > 0 && taxidoSettingData?.taxido_values?.activation?.coupon_enable == 1 && (
            <View
              style={styles.todayOfferContainer}
            >
              <TodayOfferContainer
                couponsData={homeScreenDataPrimary.coupons}
              />
            </View>
          )}
          <BottomTitle />
        </ScrollView>
      )}

      {self?.total_active_rides > 0 && (
        <View style={styles.swipeView}>
          <SwipeButton buttonText={translateData.backToActive} />
        </View>
      )}

      <BottomSheet
        ref={exitBottomSheetRef}
        index={-1}
        snapPoints={exitSnapPoints}
        enablePanDownToClose={true}
        backdropComponent={renderBackdrop}
        style={{ zIndex: 2 }}
        handleIndicatorStyle={{ backgroundColor: appColors.primary, width: '13%' }}
      >
        <BottomSheetView style={bottomSheetStyles.contentContainer}>
          <View style={styles.modelView}>
            <Text
              style={[
                external.ti_center,
                { color: textColorStyle, fontFamily: appFonts.medium, fontSize: fontSizes.FONT22, paddingVertical: windowHeight(10) },
              ]}
            >
              {translateData?.exitTitle}
            </Text>
          </View>
          <View
            style={[
              external.ai_center,
              external.js_space,

              { flexDirection: viewRTLStyle, marginTop: windowHeight(8) },
            ]}
          >
            <Button
              width={"47%"}
              title={translateData.no}
              onPress={() => exitBottomSheetRef.current?.close()}
            />
            <Button
              width={"47%"}
              backgroundColor={appColors.lightGray}
              title={translateData.yes}
              textColor={appColors.primaryText}
              onPress={exitAndRestart}
            />
          </View>
        </BottomSheetView>
      </BottomSheet>
    </View>
  );
}

const bottomSheetStyles = StyleSheet.create({
  contentContainer: {
    flex: 1,
    paddingHorizontal: windowHeight(15),
    backgroundColor: appColors.whiteColor,

  },
});

