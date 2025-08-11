import React, { useState, useRef, useCallback, useEffect, useMemo } from "react";
import { View, Text, TextInput, TouchableOpacity, Image, ActivityIndicator, Alert, StyleSheet } from "react-native";
import MapView, { Region } from "react-native-maps";
import { useNavigation, useRoute } from "@react-navigation/native";
import darkMapStyle from "@src/screens/darkMapStyle";
import Images from "@utils/images";
import { useValues } from "@App";
import styles from "./styles";
import { Back, AddressMarker } from "@src/utils/icons";
import { appColors, appFonts, fontSizes, windowHeight, windowWidth } from "@src/themes";
import { Button } from "@src/commonComponent";
import { SaveLocationDataInterface } from "@src/api/interface/saveLocationinterface";
import { addSaveLocation, updateSaveLocation } from "@src/api/store/actions";
import { useDispatch, useSelector } from "react-redux";
import { userSaveLocation } from "@src/api/store/actions/saveLocationAction";
import { external } from "@src/styles/externalStyle";
import useStoredLocation from "@src/components/helper/useStoredLocation";
import { getDistance } from "geolib";
import BottomSheet, { BottomSheetBackdrop, BottomSheetView } from '@gorhom/bottom-sheet';

export function LocationSave() {
  const { isDark, linearColorStyle, textColorStyle, viewRTLStyle, textRTLStyle, Google_Map_Key, bgFullStyle } = useValues();
  const [currentAddress, setCurrentAddress] = useState("");
  const { goBack } = useNavigation();
  const route = useRoute();
  const { mode, locationID } = route.params || {};
  const [locationTitle, setLocationTitle] = useState('');
  const dispatch = useDispatch();
  const { translateData } = useSelector((state: any) => state.setting);
  const { latitude, longitude } = useStoredLocation();
  const mapRef = useRef<MapView>(null);
  const [loadingMap, setLoadingMap] = useState(true);
  const [isLocationInitialized, setIsLocationInitialized] = useState(false);
  const [titleError, setTitleError] = useState('');
  const [region, setRegion] = useState<Region | null>(null);
  const [mapCenterCoords, setMapCenterCoords] = useState<{ latitude: number; longitude: number } | null>(null);
  const debounceTimerRef = useRef<NodeJS.Timeout | null>(null);
  const lastCoordsRef = useRef<{ latitude: number; longitude: number } | null>(null);
  const [fetchingAddress, setFetchingAddress] = useState(false);
  const [saveLoading, setsaveLoading] = useState(false);
  const saveLocationBottomSheetRef = useRef<BottomSheet>(null);
  const saveLocationSnapPoints = useMemo(() => ['1%', '39%'], []);

  useEffect(() => {

    if (latitude && longitude) {
      const initialRegion = {
        latitude,
        longitude,
        latitudeDelta: 0.01,
        longitudeDelta: 0.01,
      };
      setRegion(initialRegion);
      setMapCenterCoords({ latitude, longitude });
      lastCoordsRef.current = { latitude, longitude };
      setLoadingMap(false);
      fetchAddress(latitude, longitude);
    } else {
      setDefaultMapLocation();
    }
  }, [latitude, longitude, fetchAddress]);

  const setDefaultMapLocation = useCallback(() => {
    const defaultLat = 21.1702;
    const defaultLng = 72.8311;

    setRegion({
      latitude: defaultLat,
      longitude: defaultLng,
      latitudeDelta: 0.05,
      longitudeDelta: 0.05,
    });
    setMapCenterCoords({ latitude: defaultLat, longitude: defaultLng });
    lastCoordsRef.current = { latitude: defaultLat, longitude: defaultLng };
    setLoadingMap(false);
    fetchAddress(defaultLat, defaultLng);
  }, [fetchAddress]);


  useEffect(() => {
    if (mode === "edit" && locationID && !isLocationInitialized && latitude && longitude) {

      const initialEditRegion = {
        latitude,
        longitude,
        latitudeDelta: 0.01,
        longitudeDelta: 0.01,
      };
      setRegion(initialEditRegion);
      setMapCenterCoords({ latitude, longitude });
      lastCoordsRef.current = { latitude, longitude };
      fetchAddress(latitude, longitude);
      setIsLocationInitialized(true);

    }
  }, [mode, locationID, isLocationInitialized, latitude, longitude, fetchAddress]);


  const fetchAddress = useCallback(async (lat: number, lng: number) => {

    if (!Google_Map_Key) {
      console.warn("[fetchAddress] Missing Google Map Key");
      setCurrentAddress("Google Map Key is missing");
      return;
    }

    try {
      setFetchingAddress(true);
      const url = `https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${lng}&key=${Google_Map_Key}`;

      const res = await fetch(url);
      const json = await res.json();

      if (json?.results?.length > 0) {
        const formattedAddress = json.results[0].formatted_address;
        setCurrentAddress(formattedAddress);
      } else {
        console.warn("[fetchAddress] No results found");
        setCurrentAddress("No address found");
      }
    } catch (err) {
      console.error("[fetchAddress] Error:", err);
      setCurrentAddress("Address fetch failed");
    } finally {
      setFetchingAddress(false);
    }
  }, [Google_Map_Key]);


  useEffect(() => {
    if (mapCenterCoords) {

      if (debounceTimerRef.current) clearTimeout(debounceTimerRef.current);

      debounceTimerRef.current = setTimeout(() => {
        fetchAddress(mapCenterCoords.latitude, mapCenterCoords.longitude);
      }, 500);
    }

    return () => {
      if (debounceTimerRef.current) clearTimeout(debounceTimerRef.current);
    };
  }, [mapCenterCoords, fetchAddress]);

  const onRegionChangeComplete = (newRegion: Region) => {
    const last = lastCoordsRef.current;
    if (
      !last ||
      getDistance(
        { latitude: last.latitude, longitude: last.longitude },
        { latitude: newRegion.latitude, longitude: newRegion.longitude }
      ) > 5
    ) {
      setRegion(newRegion);
      setMapCenterCoords({ latitude: newRegion.latitude, longitude: newRegion.longitude });
      lastCoordsRef.current = { latitude: newRegion.latitude, longitude: newRegion.longitude };
    } else {
    }
  };


  const options = [
    { label: `${translateData.home}`, value: "home" },
    { label: `${translateData.work}`, value: "work" },
    { label: `${translateData.other}`, value: "other" },
  ];
  const [selectedOption, setSelectedOption] = useState(options[0].value);


  const handleConfirmLocation = useCallback(() => {
    if (!currentAddress || !mapCenterCoords || fetchingAddress) {
      Alert.alert("Location Not Ready", "Wait for address to load or move map.");
      return;
    }
    saveLocationBottomSheetRef.current?.expand();
  }, [currentAddress, mapCenterCoords, fetchingAddress]);


  const goback = () => {
    goBack();
  };

  const addAddress = useCallback(() => {
    setsaveLoading(true)
    if (!locationTitle?.trim()) {
      setTitleError("Please Enter Your Title");
      setsaveLoading(false)
      return;
    }
    setTitleError("");
    const payload: SaveLocationDataInterface = {
      title: locationTitle,
      location: currentAddress,
      type: selectedOption,
      latitude: mapCenterCoords?.latitude,
      longitude: mapCenterCoords?.longitude,
    } as SaveLocationDataInterface;

    if (mode === "edit") {
      dispatch(updateSaveLocation({ data: payload, locationID }))
        .unwrap()
        .then(() => {
          dispatch(userSaveLocation());
          goBack();
          setsaveLoading(false)
        })
        .catch((error: any) => {
          console.error("Error updating location:", error);
          Alert.alert("Error", "Failed to update location.");
          setsaveLoading(false)
        })
        .finally(() => {
          saveLocationBottomSheetRef.current?.close()
          setsaveLoading(false)
        });
    } else {
      dispatch(addSaveLocation(payload))
        .unwrap()
        .then(() => {
          dispatch(userSaveLocation());
          goBack();
          setsaveLoading(false)
        })
        .catch((error: any) => {
          console.error("Error adding location:", error);
          Alert.alert("Error", "Failed to add location.");
          setsaveLoading(false)
        })
        .finally(() => {
          saveLocationBottomSheetRef.current?.close();
          setsaveLoading(false)
        });
    }
  }, [locationTitle, currentAddress, selectedOption, mapCenterCoords, mode, locationID, dispatch, goBack]);

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

  const handleBottomSheetClose = useCallback(() => {
    setLocationTitle('');
    setTitleError('');
  }, []);

  return (
    <View style={external.main}>
      <View style={{ flexDirection: 'row' }}>
        <TouchableOpacity
          activeOpacity={0.7}
          onPress={goback}
          style={[styles.backView, {
            backgroundColor: linearColorStyle
          }]}
        >
          <Back />
        </TouchableOpacity>
        <View style={[styles.textInputContainer, { backgroundColor: linearColorStyle }, { flexDirection: viewRTLStyle }]}>
          <View
            style={[styles.addressMarkerIcon, {
              backgroundColor: linearColorStyle
            }]}
          >
            <AddressMarker />
          </View>
          <View
            style={[styles.inputLine, {
              borderColor: isDark ? appColors.darkBorder : appColors.primaryGray,
            }]}
          />

          <TextInput
            style={[styles.textInput, { backgroundColor: linearColorStyle }, { color: textColorStyle }]}
            value={fetchingAddress ? translateData.gettingAddress : currentAddress || translateData.moveMapToSelectLocation}
            placeholder={translateData.searchHere}
            editable={false}
            selection={{ start: 0, end: 0 }}
          />
        </View>
      </View>
      {loadingMap || !region ? (
        <View style={[styles.mapView, { justifyContent: "center", alignItems: "center" }]}>
          <ActivityIndicator size="large" color={appColors.primary} />
        </View>
      ) : (
        <>
          <MapView
            ref={mapRef}
            style={styles.mapView}
            region={region}
            onRegionChangeComplete={onRegionChangeComplete}
            showsUserLocation={true}
            customMapStyle={isDark ? darkMapStyle : []}
          />
        </>
      )}
      <TouchableOpacity
        style={styles.confirmButton}
        onPress={handleConfirmLocation}
        activeOpacity={0.7}
        disabled={fetchingAddress}
      >
        {fetchingAddress ? (
          <ActivityIndicator size="large" color={appColors.whiteColor} />
        ) : (
          <Text style={styles.confirmText}>{translateData.confirmLocation}</Text>
        )}
      </TouchableOpacity>
      <View style={styles.pointerMarker}>
        <Image source={Images.pin} style={styles.pinImage} />
      </View>

      <BottomSheet
        ref={saveLocationBottomSheetRef}
        index={-1}
        snapPoints={saveLocationSnapPoints}
        enablePanDownToClose={true}
        backdropComponent={renderBackdrop}
        onChange={(index) => {
          if (index === -1) {
            handleBottomSheetClose();
          }
        }}
        style={{ zIndex: 5 }}
        handleIndicatorStyle={{ backgroundColor: appColors.primary, width: '13%' }}
        backgroundStyle={{ backgroundColor: bgFullStyle }}      >
        <BottomSheetView style={bottomSheetStyles.contentContainer}>
          <Text style={[styles.title, { color: textColorStyle }]}>{translateData.addNewLocation}</Text>
          <View style={styles.container}>
            <View style={[styles.optionContain, { flexDirection: viewRTLStyle }]}>
              {options.map((option) => (
                <TouchableOpacity
                  activeOpacity={0.7}
                  key={option.value}
                  style={[
                    [styles.optionContainer, { flexDirection: viewRTLStyle }, { borderColor: isDark ? appColors.darkBorder : appColors.border }],
                    selectedOption === option.value &&
                    styles.selectedOptionContainer,
                  ]}
                  onPress={() => setSelectedOption(option.value)}
                >
                  <View
                    style={[
                      styles.radioButton,
                      selectedOption === option.value &&
                      styles.selectedOptionRadio,
                    ]}
                  >
                    {selectedOption === option.value && (
                      <View style={styles.radioSelected} />
                    )}
                  </View>
                  <Text
                    style={[
                      styles.optionLabel,
                      selectedOption === option.value &&
                      styles.selectedOptionLabel,
                    ]}
                  >
                    {option.label}
                  </Text>
                </TouchableOpacity>
              ))}
            </View>
            <Text style={{
              color: isDark ? appColors.whiteColor : appColors.primaryText,
              fontFamily: appFonts.medium,
              marginTop: windowHeight(8),
              textAlign: textRTLStyle,
            }}>{translateData.addressTitle}</Text>
            <TextInput
              placeholder={translateData.enterYouTitleeeee}
              placeholderTextColor={appColors.regularText}
              style={[
                styles.titleInput,
                { color: textColorStyle },
                { borderColor: isDark ? appColors.darkBorder : appColors.border }, { textAlign: textRTLStyle },
              ]}
              value={locationTitle}
              onChangeText={(text) => {
                setLocationTitle(text);
                if (!text.trim()) {
                  setTitleError(translateData.addressRequired);
                } else {
                  setTitleError('');
                }
              }}
            />

            {titleError ? (
              <Text style={{ color: appColors.textRed, fontSize: fontSizes.FONT14SMALL, fontFamily: appFonts.medium }}>
                {titleError}
              </Text>
            ) : null}

          </View>
          <View style={[styles.btnContainer, { flexDirection: viewRTLStyle }]}>
            <Button
              backgroundColor={appColors.lightButton}
              onPress={() => saveLocationBottomSheetRef.current?.close()}
              textColor={appColors.primary}
              title={translateData.cancel}
              width={"47%"}
            />
            <Button
              backgroundColor={appColors.primary}
              onPress={addAddress}
              textColor={appColors.whiteColor}
              title={translateData.save}
              width={"47%"}
              loading={saveLoading}
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
    paddingHorizontal: windowWidth(18),
    paddingTop: windowHeight(15),
  },
  closeButton: {
    position: 'absolute',
    right: windowWidth(5),
    top: windowHeight(2),
    zIndex: 10,
    padding: windowWidth(2),
  }
});