import { useValues } from "@App";
import React, { useEffect, useState } from "react";
import { View, TouchableOpacity, Text } from "react-native";
import { styles } from "./style";
import { BackArrow, ChangeLanguage, DarkTheme, Notification, RTL } from "@src/utils/icons";
import { external } from "@src/styles/externalStyle";
import { commonStyles } from "@src/styles/commonStyle";
import { LanguageBottomSheet } from "./component/languageBottomSheet";
import { HeaderContainer, SolidLine, SwitchComponent } from "@src/commonComponent";
import { useDispatch, useSelector } from "react-redux";
import { appColors, windowHeight } from "@src/themes";
import AsyncStorage from "@react-native-async-storage/async-storage";
import { languageDataGet, serviceDataGet } from "@src/api/store/actions";


export function AppPageScreen() {
  const {isRTL,setIsRTL,isDark,textRTLStyle,viewRTLStyle,linearColorStyle,textColorStyle,imageRTLStyle,bgFullStyle,setIsDark,setNotificationValues,notificationValue} = useValues();
  const [languageSheetVisible, setLanguageSheetVisible] = useState(false);
  const [selectedLanguage, setSelectedLanguage] = useState("en");
  const { translateData } = useSelector((state) => state.setting);
  const [toggles, setToggles] = useState([]);
  const dispatch = useDispatch();

  const openModal = () => {
    setLanguageSheetVisible(true);
  };

  const closeModal = () => {
    setLanguageSheetVisible(false);
    if (selectedLanguage === "ar") setIsRTL(true);
    else setIsRTL(false);
  };

  useEffect(() => {
    dispatch(languageDataGet());
    dispatch(serviceDataGet());
  }, [dispatch]);

  useEffect(() => {
    const loadValues = async () => {
      try {
        const storedNotification = await AsyncStorage.getItem("isNotificationOn");
        setNotificationValues(storedNotification === "true" || storedNotification === null);
        if (storedNotification === null) {
          await AsyncStorage.setItem("isNotificationOn", "true");
        }
      } catch (error) {
        console.error("Error loading values from AsyncStorage:", error);
      }
    };
    loadValues();
  }, []);

  useEffect(() => {
    const selectedLang = async () => {
      try {
        const lang = await AsyncStorage.getItem("selectedLanguage");
        if (lang) {
          setSelectedLanguage(lang);
          setLanguageTitle(lang === "ar" ? "العربية" : lang === "fr" ? "Français" : lang === "es" ? "Español" : "English");
          if (lang === "ar") setIsRTL(true);
        }
      } catch (error) { }
    };
    selectedLang();
  }, []);


  useEffect(() => {
    setToggles([
      {
        id: "toggle4",
        title: translateData.appApgeTheme,
        value: isDark,
        onPress: () => handleToggle("toggle4"),
        icon: <DarkTheme />,
      },
      {
        id: "toggle6",
        title: translateData.notification,
        value: notificationValue,
        onPress: () => handleToggle("toggle6"),
        icon: <Notification colors={isDark ? appColors.whiteColor : appColors.blackColor} />,
      },
      {
        id: "toggle5",
        title: translateData.rtl,
        value: isRTL,
        onPress: () => handleToggle("toggle5"),
        icon: <RTL />,
      },
    ]);
  }, [translateData, isDark, isRTL, notificationValue]);

  const handleToggle = async (toggleId: string) => {
    try {
      switch (toggleId) {
        case "toggle4":
          setIsDark((prev) => {
            AsyncStorage.setItem("darkTheme", JSON.stringify(!prev));
            return !prev;
          });
          break;
        case "toggle5":
          setIsRTL((prev) => {
            AsyncStorage.setItem("rtl", JSON.stringify(!prev));
            return !prev;
          });
          break;
        case "toggle6":
          setNotificationValues((prev) => {
            AsyncStorage.setItem("isNotificationOn", JSON.stringify(!prev));
            return !prev;
          });
          break;
      }

      setToggles((prevToggles) =>
        prevToggles.map((toggle) =>
          toggle.id === toggleId ? { ...toggle, value: !toggle.value } : toggle
        )
      );
    } catch (error) {
      console.error("Error toggling value:", error);
    }
  };

  return (
    <View style={[styles.container, { backgroundColor: linearColorStyle }]}>
      <View style={[styles.headerContainer, { backgroundColor: bgFullStyle }]}>
        <HeaderContainer value={translateData.appPages} />
      </View>


      <View style={[styles.appPagesContainer, { backgroundColor: bgFullStyle }]}>
        {toggles.map((toggle, index) => (
          <View key={toggle.id}>
            <View style={[styles.listItemContainer, { flexDirection: viewRTLStyle }]}>
              <View style={[styles.iconContainer, { backgroundColor: linearColorStyle }]}>
                {toggle.icon}
              </View>
              <Text style={[styles.listItemText, { color: textColorStyle, textAlign: textRTLStyle }]}>
                {toggle.title}
              </Text>
              <SwitchComponent Enable={toggle.value} onPress={toggle.onPress} />
            </View>
            {index !== toggles.length - 1 && (
              <SolidLine color={isDark ? appColors.darkBorder : appColors.border} />
            )}
          </View>
        ))}

        <SolidLine color={isDark ? appColors.darkBorder : appColors.border} />

        <TouchableOpacity
          activeOpacity={0.7}
          onPress={openModal}
          style={[styles.listItemContainer, { flexDirection: viewRTLStyle }]}
        >
          <View style={[styles.iconContainer, { backgroundColor: linearColorStyle }]}>
            <ChangeLanguage />
          </View>
          <View style={[external.fg_95]}>
            <Text style={[styles.listItemText, { color: textColorStyle, textAlign: textRTLStyle }]}>
              {translateData.changeLanguage}
            </Text>
            <Text style={[commonStyles.regularText, external.mh_15, {
              textAlign: textRTLStyle,
              marginHorizontal: windowHeight(8),
            }]}>
              {selectedLanguage}
            </Text>
          </View>
          <View style={{ transform: [{ scale: imageRTLStyle }] }}>
            <BackArrow />
          </View>
        </TouchableOpacity>
      </View>
      <LanguageBottomSheet
        isVisible={languageSheetVisible}
        onClose={closeModal}
        selectedLanguage={selectedLanguage}
        setSelectedLanguage={setSelectedLanguage}
      />
    </View>
  );
}
