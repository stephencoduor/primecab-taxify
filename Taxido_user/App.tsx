import React, { createContext, useContext, useState, useEffect, useRef } from 'react';
import { AppState, Platform, StatusBar, View } from 'react-native';
import MyStack from './src/navigation/index';
import { external } from './src/styles/externalStyle';
import { imageRTLStyle, textRTLStyle, viewRTLStyle, viewSelfRTLStyle } from './src/styles/rtlStyle';
import { bgFullStyle, iconColorStyle, linearColorStyle, linearColorStyleTwo, textColorStyle, bgFullLayout, bgContainer, ShadowContainer } from './src/styles/darkStyle';
import { ThemeContextType } from './src/utils/themeContext';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { Provider } from 'react-redux';
import store from './src/api/store/index';
import { LocationProvider } from './src/utils/locationContext';
import { MenuProvider } from 'react-native-popup-menu';
import { NotificationServices, requestUserPermission } from '@src/utils/pushNotificationHandler';
import { LoadingProvider } from '@src/utils/context';
import { GestureHandlerRootView } from 'react-native-gesture-handler';
import { NotifierRoot } from 'react-native-notifier';
import { enableScreens } from 'react-native-screens';
import NotificationHelper from '@src/components/helper/localNotificationHelper';
import { ensureLocationAccess } from '@src/components/helper/permissionHelper';
import { appColors } from '@src/themes';

enableScreens();

const defaultValues: ThemeContextType = {
  isRTL: false,
  setIsRTL: () => { },
  isDark: false,
  setIsDark: () => { },
  ShadowContainer: "",
  bgContainer: "",
  bgFullLayout: "",
  linearColorStyleTwo: "",
  linearColorStyle: "",
  textColorStyle: "",
  iconColorStyle: "",
  bgFullStyle: "",
  textRTLStyle: "",
  viewRTLStyle: "",
  imageRTLStyle: 0,
  viewSelfRTLStyle: "",
  setToken: "",
  notificationValue: "",
  setNotificationValues: () => { },
  Google_Map_Key: '',
  Google_Sign_Key: ''
};
export const CommonContext = createContext<ThemeContextType>(defaultValues);

function App(): React.JSX.Element {
  const [isRTL, setIsRTL] = useState(false);
  const [isDark, setIsDark] = useState(false);
  const [notificationValue, setNotificationValues] = useState<string>(""); // ✅
  const [token, setToken] = useState("");
  const Google_Map_Key = Platform.OS === 'android'
    ? 'yor map key here(android)'
    : 'yor map key here(ios)'
  const Google_Sign_Key = 'webclientID for Google login here' // your webClientId Here

  const appState = useRef(AppState.currentState);

  useEffect(() => {
    ensureLocationAccess();

    const subscription = AppState.addEventListener('change', nextAppState => {
      if (appState.current.match(/inactive|background/) && nextAppState === 'active') {
        ensureLocationAccess();
      }
      appState.current = nextAppState;
    });

    return () => {
      subscription.remove();
    };
  }, []);


  useEffect(() => {

    const fetchDarkTheme = async () => {
      try {
        const darkThemeValue = await AsyncStorage.getItem("darkTheme");
        if (darkThemeValue !== null) {
          setIsDark(JSON.parse(darkThemeValue));
        }
      } catch (error) {
        console.error("Error retrieving dark theme value:", error);
      }
    };

    fetchDarkTheme();
    NotificationServices();
    requestUserPermission();
  }, []);

  useEffect(() => {
    const fetchRtl = async () => {
      try {
        const rtlValue = await AsyncStorage.getItem("rtl");
        if (rtlValue !== null) {
          setIsRTL(JSON.parse(rtlValue));
        }
      } catch (error) {
        console.error("Error retrieving rtl value:", error);
      }
    };

    fetchRtl();
  }, []);

  useEffect(() => {
    const fetchToken = async () => {
      try {
        const tokenValue = await AsyncStorage.getItem("token");
        if (tokenValue !== null) {
          setToken(JSON.parse(tokenValue));
        }
      } catch (error) {
        console.error("Error retrieving rtl value:", error);
      }
    };

    fetchToken();
  }, []);

  useEffect(() => {
    const loadLanguageFromStorage = async () => {
      try {
        const savedLanguage = await AsyncStorage.getItem("selectedLanguage");
        if (savedLanguage) {
        }
      } catch (error) {
        console.error("Error loading language from storage:", error);
      }
    };
    loadLanguageFromStorage();
  }, []);

  useEffect(() => {
    const loadNotificationFromStorage = async () => {
      try {
        const notificationValue = await AsyncStorage.getItem("isNotificationOn");
        if (notificationValue) {
          setNotificationValues(notificationValue)
        }
      } catch (error) {
        console.error("Error loading language from storage:", error);
      }
    };
    loadNotificationFromStorage();
  }, []);


  const contextValues = {
    isRTL,
    setIsRTL,
    isDark,
    setIsDark,
    ShadowContainer: ShadowContainer(isDark),
    bgContainer: bgContainer(isDark),
    bgFullLayout: bgFullLayout(isDark),
    linearColorStyleTwo: linearColorStyleTwo(isDark),
    linearColorStyle: linearColorStyle(isDark),
    textColorStyle: textColorStyle(isDark),
    iconColorStyle: iconColorStyle(isDark),
    bgFullStyle: bgFullStyle(isDark),
    textRTLStyle: textRTLStyle(isRTL),
    viewRTLStyle: viewRTLStyle(isRTL),
    imageRTLStyle: imageRTLStyle(isRTL),
    viewSelfRTLStyle: viewSelfRTLStyle(isRTL),
    token,
    setToken,
    notificationValue,
    setNotificationValues,
    Google_Map_Key: Google_Map_Key,
    Google_Sign_Key: Google_Sign_Key,
  };

  useEffect(() => {
    NotificationHelper.configure();
  }, [])

  return (
    <GestureHandlerRootView style={{ flex: 1 }}>
      <View style={{ paddingTop: Platform.OS === 'ios' ? 60 : 0 }} />
      <NotifierRoot />
      <MenuProvider>
        <Provider store={store}>
          <LoadingProvider>
            <CommonContext.Provider value={contextValues}>
              <LocationProvider>
                <View style={[external.fx_1]}>
                  <StatusBar barStyle={isDark ? "light-content" : "dark-content"} backgroundColor={isDark ? appColors?.blackColor : appColors?.whiteColor} />
                  <MyStack />
                </View>
              </LocationProvider>
            </CommonContext.Provider>
          </LoadingProvider>
        </Provider>
      </MenuProvider>
    </GestureHandlerRootView>
  );
}
export const useValues = () => useContext(CommonContext);

export default App;

