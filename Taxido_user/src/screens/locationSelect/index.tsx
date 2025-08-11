import React, { useEffect, useRef, useState, useCallback } from "react";
import { View, Text, TextInput, TouchableOpacity, Image, ActivityIndicator, Alert } from "react-native";
import MapView, { Region } from "react-native-maps";
import { useNavigation, useRoute } from "@react-navigation/native";
import { Back, AddressMarker } from "@src/utils/icons";
import { appColors } from "@src/themes";
import darkMapStyle from "../darkMapStyle";
import Images from "@utils/images";
import styles from "./styles";
import { useValues } from "../../../App";
import { external } from "@src/styles/externalStyle";
import useStoredLocation from "@src/components/helper/useStoredLocation";
import { getDistance } from "geolib";
import { useSelector } from "react-redux";

export function LocationSelect() {
  const { isDark, viewRTLStyle, Google_Map_Key } = useValues();
  const mapRef = useRef<MapView>(null);
  const navigation = useNavigation();
  const route = useRoute();
  const { field, screenValue, service_ID, service_name, service_category_ID, service_category_slug, formattedDate, formattedTime } = route.params || {};
  const { translateData } = useSelector((state) => state.setting);
  const { latitude, longitude } = useStoredLocation();
  const [region, setRegion] = useState<Region | null>(null);
  const [currentAddress, setCurrentAddress] = useState("");
  const [loadingMap, setLoadingMap] = useState(true);
  const [fetchingAddress, setFetchingAddress] = useState(false);
  const [mapCenterCoords, setMapCenterCoords] = useState<{ latitude: number; longitude: number } | null>(null);
  const debounceTimerRef = useRef<NodeJS.Timeout | null>(null);
  const lastCoordsRef = useRef<{ latitude: number; longitude: number } | null>(null);

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
    } else {
      setDefaultMapLocation();
    }
  }, [latitude, longitude]);

  const setDefaultMapLocation = () => {
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
  };

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

  const handleConfirmLocation = () => {

    if (!currentAddress || !mapCenterCoords || fetchingAddress) {
      Alert.alert("Location Not Ready", "Wait for address to load or move map.");
      return;
    }

    navigation.navigate(screenValue, {
      selectedAddress: currentAddress,
      fieldValue: field,
      latitude: mapCenterCoords.latitude,
      longitude: mapCenterCoords.longitude,
      service_ID: service_ID,
      service_name: service_name,
      service_category_ID: service_category_ID,
      service_category_slug: service_category_slug,
      formattedDate: formattedDate,
      formattedTime: formattedTime,
    });
  };

  return (
    <View style={external.main}>
      <TouchableOpacity
        onPress={() => {
          navigation.goBack();
        }}
        style={[
          styles.backView,
          { backgroundColor: isDark ? appColors.darkPrimary : appColors.whiteColor },
        ]}
      >
        <Back />
      </TouchableOpacity>

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
          <View style={styles.pointerMarker}>
            <Image source={Images.pin} style={styles.pinImage} />
          </View>
        </>
      )}

      <View
        style={[
          styles.textInputContainer,
          {
            backgroundColor: isDark ? appColors.darkPrimary : appColors.whiteColor,
            flexDirection: viewRTLStyle,
          },
        ]}
      >
        <View style={styles.addressBtnView}>
          <AddressMarker />
        </View>
        <TextInput
          style={[
            styles.textInput,
            {
              backgroundColor: isDark ? appColors.darkPrimary : appColors.whiteColor,
              color: isDark ? appColors.whiteColor : appColors.blackColor,
            },
          ]}
          value={fetchingAddress ? "Getting address..." : currentAddress || "Move map to select location"}
          placeholder={translateData.searchHere}
          editable={false}
          multiline
        />
      </View>

      <TouchableOpacity
        style={styles.confirmButton}
        onPress={handleConfirmLocation}
        disabled={fetchingAddress}
      >
        {fetchingAddress ? (
          <ActivityIndicator size="large" color={appColors.whiteColor} />
        ) : (
          <Text style={styles.confirmText}>{translateData.confirmLocation}</Text>
        )}
      </TouchableOpacity>
    </View>
  );
}
