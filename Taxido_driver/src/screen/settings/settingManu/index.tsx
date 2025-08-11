import { View, ScrollView, Text, TouchableOpacity } from 'react-native'
import React, { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import styles from './styles'
import { General, RegistrationDetails, Profile, SettingHeader, AlertZone } from './component/'
import { useFocusEffect, useNavigation, useTheme } from '@react-navigation/native'
import DeviceInfo from 'react-native-device-info'
import { currentZone, deleteProfile, planDataGet, rentalVehicleData, settingDataGet, ticketDataGet, walletData } from '../../../api/store/action'
import { useDispatch, useSelector } from 'react-redux'
import { BottomSheetBackdrop, BottomSheetModal, BottomSheetModalProvider, BottomSheetView } from '@gorhom/bottom-sheet'
import { GestureHandlerRootView } from 'react-native-gesture-handler'
import appColors from '../../../theme/appColors'
import Images from '../../../utils/images/images'
import appFonts from '../../../theme/appFonts'
import { Button, notificationHelper } from '../../../commonComponents'
import { clearValue } from '../../../utils/localstorage'
import useSmartLocation from '../../../commonComponents/helper/locationHelper'
import FastImage from 'react-native-fast-image'
import { useValues } from '../../../utils/context'
import { windowHeight, fontSizes } from '../../../theme/appConstant'
import { resetState } from '../../../api/store/reducers'
import firestore from '@react-native-firebase/firestore';
import { se } from 'rn-emoji-keyboard'

export function Settings() {

  const dispatch = useDispatch();
  const { translateData } = useSelector(state => state.setting)
  const { colors } = useTheme()
  const [versionCode, setVersionCode] = useState('')
  const [versionApp, setAppversion] = useState('')
  const { viewRtlStyle } = useValues()
  const [isLogoutSheetReady, setLogoutSheetReady] = useState(false);
  const { isDark } = useValues()
  const { selfDriver } = useSelector((state: any) => state.account)

  useEffect(() => {
    const fetchVersion = async () => {
      const version = await DeviceInfo.getVersion()
      const appVersion = await DeviceInfo.getBuildNumber()
      setAppversion(appVersion)
      setVersionCode(version)
    }
    dispatch(planDataGet())
    dispatch(ticketDataGet())
    dispatch(rentalVehicleData())
    fetchVersion()
  }, [])


  useFocusEffect(
    useCallback(() => {
      dispatch(walletData());
      return () => { };
    }, [dispatch])
  );

  const bottomSheetRef = useRef(null);
  const snapPoints = useMemo(() => ['47%'], []);
  const openSheet = () => bottomSheetRef.current?.present();

  const renderBackdrop = useCallback(
    (props) => (
      <BottomSheetBackdrop
        {...props}
        pressBehavior="close"
        appearsOnIndex={0}
        disappearsOnIndex={-1}
      />
    ),
    []
  );
  const navigation = useNavigation()
  const { currentLatitude, currentLongitude } = useSmartLocation();


  const deleteAccount = () => {
    notificationHelper('', 'Account Deleted Successfully', 'error');
    navigation.reset({
      index: 0,
      routes: [{ name: 'Login' }],
    });
    clearValue();
    dispatch(deleteProfile());
    dispatch(settingDataGet());
    dispatch(currentZone({ lat: currentLatitude, lng: currentLongitude }));
  };



  const closeLogoutSheet = () => {
    logoutSheetRef.current?.close();
    setLogoutSheetReady(false)

  }

  const renderLogoutBackdrop = useCallback(
    props => (
      <BottomSheetBackdrop
        {...props}
        pressBehavior="close"
        appearsOnIndex={0}
        disappearsOnIndex={-1}
      />
    ),
    []
  );

  const gotoLogout = async () => {
    setLogoutSheetReady(true)
    await firestore()
      .collection('driverTrack')
      .doc(selfDriver.id.toString())
      .update({
        is_online: "0",
      })

    notificationHelper('', 'Logged Out Successfully', 'error');
    setLogoutSheetReady(false)
    closeLogoutSheet();
    clearValue();
    dispatch(resetState());
    dispatch(settingDataGet());
    dispatch(currentZone({ lat: currentLatitude, lng: currentLongitude }));



    navigation.reset({
      index: 0,
      routes: [{ name: 'Login' }],
    });
  };

  const logoutSheetRef = useRef<any>(null);
  const logoutSnapPoints = useMemo(() => ['42%'], []);



  const openLogoutSheet = () => {
    logoutSheetRef.current?.present();
  };
  return (
    <GestureHandlerRootView>
      <View style={{ flex: 1 }}>
        <ScrollView
          style={[styles.main, { backgroundColor: colors.background }]}
          showsVerticalScrollIndicator={false}
        >
          <SettingHeader />
          <View style={styles.container}>
            <Profile />
            <General />
            <RegistrationDetails />
            <AlertZone openSheet={openSheet} openLogoutSheet={openLogoutSheet} />
            <Text style={styles.version}>
              {translateData.settingTextVersion}: 0.{versionApp}
            </Text>
          </View>
        </ScrollView>
      </View>


      <BottomSheetModalProvider>
        <BottomSheetModal
          ref={bottomSheetRef}
          index={1}
          snapPoints={snapPoints}
          backdropComponent={renderBackdrop}
          enablePanDownToClose
          handleIndicatorStyle={{ backgroundColor: appColors.primary, width: '13%' }}
          backgroundStyle={{ backgroundColor: isDark ? appColors.bgDark : appColors.white }}

        >
          <BottomSheetView style={{ alignItems: 'center' }}>
            <FastImage source={Images.delete} style={{ height: windowHeight(13), width: windowHeight(13) }} resizeMode='cover' />
            <Text style={{ color: isDark ? appColors.white : appColors.black, fontFamily: appFonts.medium, fontSize: fontSizes.FONT4HALF, top: windowHeight(1) }}>Want to Delete your Account?</Text>
            <Text style={{ color: appColors.darkBorderBlack, textAlign: 'center', fontFamily: appFonts.regular, fontSize: fontSizes.FONT3HALF, width: '92%', top: windowHeight(2) }}>We’re sorry to see you go. Deleting your account will remove all your data permanently. This action cannot be undone. Are you sure you want to proceed?</Text>
            <View style={{ width: '96%', top: windowHeight(5) }}>
              <Button title='Proceed' backgroundColor={appColors.primary} color={appColors.white} onPress={deleteAccount} />
            </View>

          </BottomSheetView>
        </BottomSheetModal>
      </BottomSheetModalProvider>

      <BottomSheetModalProvider>


        <BottomSheetModal
          ref={logoutSheetRef}
          index={1}
          snapPoints={logoutSnapPoints}
          backdropComponent={renderLogoutBackdrop}
          enablePanDownToClose={true}
          handleIndicatorStyle={{ backgroundColor: appColors.primary, width: '13%' }}
          backgroundStyle={{ backgroundColor: isDark ? appColors.bgDark : appColors.white }}

        >
          <BottomSheetView style={{ alignItems: 'center' }}>
            <FastImage source={Images.logoutImage} style={{ height: windowHeight(9), width: windowHeight(8), top: windowHeight(2) }} resizeMode='cover' />
            <Text style={{ color: isDark ? appColors.white : appColors.black, fontFamily: appFonts.medium, fontSize: fontSizes.FONT4HALF, top: windowHeight(5), width: '80%', textAlign: 'center' }}>{translateData.logoutConfirm}</Text>
            <View
              style={{
                flexDirection: viewRtlStyle,
                justifyContent: 'space-between',
                marginTop: windowHeight(8),
                gap: 15
              }}
            >
              <TouchableOpacity
                style={[
                  styles.cancelButton,
                  { backgroundColor: isDark ? appColors.darkText : appColors.graybackground, width: '43%' },
                ]}
                onPress={closeLogoutSheet}
              >
                <Text
                  style={{
                    color: isDark ? appColors.bgDark : appColors.iconColor,
                    textAlign: 'center',
                    fontFamily: appFonts.medium,
                    fontSize: fontSizes.FONT4,
                    paddingVertical: windowHeight(1.5),
                  }}
                >Cancel

                </Text>
              </TouchableOpacity>

              <TouchableOpacity
                style={[
                  styles.cancelButton,
                  { backgroundColor: appColors.red, width: '43%' },
                ]}
                onPress={gotoLogout}
              >
                <Text
                  style={{
                    color: appColors.white,
                    textAlign: 'center',
                    fontFamily: appFonts.medium,
                    fontSize: fontSizes.FONT4,
                    paddingVertical: windowHeight(1.5),
                  }}
                >
                  Logout
                </Text>
              </TouchableOpacity>
            </View>
          </BottomSheetView>
        </BottomSheetModal>
      </BottomSheetModalProvider>




    </GestureHandlerRootView>
  );

}






