import React, { useEffect, useRef, useState } from 'react';
import { View } from 'react-native';
import WebView from 'react-native-webview';
import firestore from '@react-native-firebase/firestore';
import { useSelector } from 'react-redux';
import { useValues } from '../../../utils/context';

export function ArrivedMap({ Pickuplocation, driverId }) {
    const webViewRef = useRef(null);
    const [driverLocation, setDriverLocation] = useState(null);
    const [isMapInitialized, setIsMapInitialized] = useState(false);
    const [isWebViewReady, setIsWebViewReady] = useState(false);

    const { Google_Map_Key, isDark } = useValues();
    const { selfDriver } = useSelector((state) => state.account);

    const parseCoordinate = (coordinate) => ({
        latitude: parseFloat(coordinate?.lat),
        longitude: parseFloat(coordinate?.lng),
    });

    const pickupLocation = Pickuplocation ? parseCoordinate(Pickuplocation) : null;

    useEffect(() => {
        if (!driverId || !pickupLocation) return;

        const unsubscribe = firestore()
            .collection('driverTrack')
            .doc(driverId.toString())
            .onSnapshot(
                (doc) => {
                    if (doc.exists) {
                        const { lat, lng } = doc.data();
                        setDriverLocation({
                            latitude: parseFloat(lat),
                            longitude: parseFloat(lng),
                        });
                    }
                },
                (error) => {
                    console.error('Firestore snapshot error:', error);
                }
            );

        return () => unsubscribe();
    }, [driverId, pickupLocation]);

    useEffect(() => {
        if (
            driverLocation &&
            pickupLocation &&
            webViewRef.current &&
            isWebViewReady &&
            !isMapInitialized
        ) {
            const jsCode = `
        if (window.drawRoute && window.fitMapToBounds) {
          const driverPos = { lat: ${driverLocation?.latitude}, lng: ${driverLocation?.longitude} };
          const pickupPos = { lat: ${pickupLocation?.latitude}, lng: ${pickupLocation?.longitude} };
          window.drawRoute(driverPos, pickupPos);
          window.fitMapToBounds(driverPos, pickupPos);
          true;
        } else {
          window.ReactNativeWebView?.postMessage("drawRoute or fitMapToBounds not available");
          false;
        }
      `;
            webViewRef.current.injectJavaScript(jsCode);
            setIsMapInitialized(true);
        }
    }, [driverLocation, pickupLocation, isMapInitialized, isWebViewReady]);

    useEffect(() => {
        if (
            driverLocation &&
            pickupLocation &&
            webViewRef.current &&
            isMapInitialized &&
            isWebViewReady
        ) {
            const jsCode = `
        window.updateDriverLocation(${driverLocation.latitude}, ${driverLocation.longitude});
        true;
      `;
            webViewRef.current.injectJavaScript(jsCode);
        }
    }, [driverLocation, pickupLocation, isMapInitialized, isWebViewReady]);

    const html = `
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Live Map</title>
  <style>
    html, body, #map {
      height: 100%;
      margin: 0;
      padding: 0;
    }
  </style>
</head>
<body>
  <div id="map"></div>

  <script src="https://maps.googleapis.com/maps/api/js?key=${Google_Map_Key}&libraries=geometry"></script>
  <script>
    let map, driverMarker, pickupMarker, directionsRenderer;
    const pickupPos = { lat: ${pickupLocation?.latitude || 0}, lng: ${pickupLocation?.longitude || 0} };
    let driverPos = null;

    function initMap() {
      map = new google.maps.Map(document.getElementById('map'), {
        center: pickupPos,
        zoom: 15,
        disableDefaultUI: true,
        mapTypeId: 'roadmap',
        styles: ${isDark ? JSON.stringify(require('../../../screen/mapView/darkMap')) : '[]'},
      });

      if (pickupPos.lat && pickupPos.lng) {
        pickupMarker = new google.maps.Marker({
          position: pickupPos,
          map: map,
          title: "Pickup Location",
        });
      }

      directionsRenderer = new google.maps.DirectionsRenderer({
        suppressMarkers: true,
        preserveViewport: false,
        polylineOptions: {
          strokeColor: "#199675",
          strokeWeight: 4,
        },
      });

      directionsRenderer.setMap(map);
      window.ReactNativeWebView?.postMessage("WebViewReady");
    }

    function updateDriverLocation(lat, lng) {
      if (!lat || !lng || !pickupPos.lat || !pickupPos.lng) {
        window.ReactNativeWebView?.postMessage("Invalid coordinates for updateDriverLocation");
        return;
      }

      driverPos = { lat, lng };

      if (driverMarker) {
        driverMarker.setPosition(driverPos);
      } else {
        driverMarker = new google.maps.Marker({
          position: driverPos,
          map: map,
          icon: {
            url: '${selfDriver?.vehicle_info?.vehicle_type_map_icon_url || ''}',
            scaledSize: new google.maps.Size(50, 50),
            anchor: new google.maps.Point(25, 25),
          },
        });
      }

      drawRoute(driverPos, pickupPos);
    }

    function drawRoute(origin, destination) {
      const directionsService = new google.maps.DirectionsService();

      directionsService.route(
        {
          origin,
          destination,
          travelMode: google.maps.TravelMode.DRIVING,
        },
        (response, status) => {
          if (status === 'OK') {
            directionsRenderer.setDirections(response);
            window.ReactNativeWebView?.postMessage("Polyline drawn successfully");
          } else {
            window.ReactNativeWebView?.postMessage("Directions API error: " + status);
          }
        }
      );
    }

    function fitMapToBounds(pos1, pos2) {
      if (!pos1 || !pos2) {
        window.ReactNativeWebView?.postMessage("Invalid positions for fitMapToBounds");
        return;
      }
      const bounds = new google.maps.LatLngBounds();
      bounds.extend(pos1);
      bounds.extend(pos2);
      map.fitBounds(bounds, { padding: 50 });
    }

    window.updateDriverLocation = updateDriverLocation;
    window.drawRoute = drawRoute;
    window.fitMapToBounds = fitMapToBounds;
    window.addEventListener('load', initMap);
  </script>
</body>
</html>
`;

    return (
        <View style={{ flex: 1 }}>
            <WebView
                ref={webViewRef}
                originWhitelist={['*']}
                source={{ html }}
                javaScriptEnabled
                domStorageEnabled
                scrollEnabled={false}
                style={{ flex: 1 }}
                onMessage={(event) => {
                    const message = event.nativeEvent.data;
                    console.log('WebView message:', message);
                    if (message === 'WebViewReady') {
                        setIsWebViewReady(true);
                        setIsMapInitialized(false);
                    }
                }}
            />
        </View>
    );
}




