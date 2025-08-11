import React, { useEffect } from 'react'
import Navigation from './src/navigation'
import { AppContextProvider, useValues } from './src/utils/context'
import { Provider } from 'react-redux'
import store from './src/api/store'
import { MenuProvider } from 'react-native-popup-menu'
import { NotificationServices, requestUserPermission } from './src/utils/pushNotificationHandler'
import { LoadingProvider } from './src/utils/loadingContext'
import { NotifierRoot } from 'react-native-notifier'
import { GestureHandlerRootView } from 'react-native-gesture-handler'
import { Platform, StatusBar, View, Alert, AppState, Linking } from 'react-native'
import NotificationHelper from './src/commonComponents/helper/localNotificationhelper'
import appColors from './src/theme/appColors'
import { Verificationhelper } from './src/commonComponents/helper/verificationhelper'
import { PortalProvider } from '@gorhom/portal'
import { useBatteryLowLog } from './src/commonComponents'

let showChatHead, hideChatHead, checkOverlayPermission;
if (Platform.OS === 'android') {
  const chatHead = require('react-native-chat-head');
  showChatHead = chatHead.showChatHead;
  hideChatHead = chatHead.hideChatHead;
  checkOverlayPermission = chatHead.checkOverlayPermission;
}

const AppGuards = () => {
  Verificationhelper();
  return null;
};

const AppInner = () => {
  const { isDark } = useValues()
  const backgroundColor = isDark ? appColors.black : appColors.white
  const barStyle = isDark ? 'light-content' : 'dark-content'
  useBatteryLowLog();

  useEffect(() => {
    NotificationServices()
    requestUserPermission()
    NotificationHelper.configure()
  }, [])

  return (
    <>
      <StatusBar
        barStyle={barStyle}
        backgroundColor={Platform.OS === 'android' ? backgroundColor : undefined}
      />
      <AppGuards />
      <Navigation />
    </>
  )
}

const index = () => {
  const [granted, setGranted] = React.useState(false);
  const appState = React.useRef(AppState.currentState);

  const openOverlayPermissionScreen = async () => {
    try {
      await Linking.openURL('android.settings.action.MANAGE_OVERLAY_PERMISSION');
    } catch (err) {
      console.error('Failed to open overlay permission screen:', err);
      await Linking.openSettings();
    }
  };

  const showPermissionExplanation = () => {
    Alert.alert(
      'Permission Required',
      'To show the chat head bubble when the app is in the background, please grant the "Draw over other apps" permission in the next screen.',
      [
        {
          text: 'Go to Settings',
          onPress: openOverlayPermissionScreen,
        },
        {
          text: 'Cancel',
          style: 'cancel',
        },
      ],
      { cancelable: false }
    );
  };

  useEffect(() => {
    if (Platform.OS !== 'android') return;

    const checkAndRequestPermission = async () => {
      try {
        const hasPermission = await checkOverlayPermission();
        if (hasPermission) {
          setGranted(true);
        } else {
          showPermissionExplanation();
        }
      } catch (err) {
        console.error('[Permission] Error during check:', err);
      }
    };

    checkAndRequestPermission();
  }, []);

  useEffect(() => {
    if (Platform.OS !== 'android') return;

    const handleAppStateChange = async (nextAppState) => {
      if (
        appState.current.match(/inactive|background/) &&
        nextAppState === 'active'
      ) {
        const hasPermission = await checkOverlayPermission();
        setGranted(hasPermission);
        hideChatHead?.();
      }

      if (
        appState.current === 'active' &&
        nextAppState.match(/inactive|background/)
      ) {
        if (granted) {
          showChatHead?.();
        }
      }

      appState.current = nextAppState;
    };

    const subscription = AppState.addEventListener('change', handleAppStateChange);
    return () => subscription.remove();
  }, [granted]);

  return (
    <GestureHandlerRootView style={{ flex: 1 }}>
      <MenuProvider>
        <View style={{ paddingTop: Platform.OS === 'ios' ? 60 : 0 }} />
        <Provider store={store}>
          <NotifierRoot />
          <LoadingProvider>
            <AppContextProvider>
              <PortalProvider>
                <AppInner />
              </PortalProvider>
            </AppContextProvider>
          </LoadingProvider>
        </Provider>
      </MenuProvider>
    </GestureHandlerRootView>
  )
}

export default index

