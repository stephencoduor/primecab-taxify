import React, { useRef, useEffect, useImperativeHandle, forwardRef } from 'react';
import { View, StyleSheet, Platform, PermissionsAndroid, Alert } from 'react-native';
import { WebView } from 'react-native-webview';
import Geolocation from '@react-native-community/geolocation';
import { useValues } from '../../../utils/context'; // Or hardcode your key
import useStoredLocation from '../../../commonComponents/helper/useStoredLocation';
import { useSelector } from 'react-redux';

export const MapScreen = forwardRef((props, ref) => {
  const { markerIcon } = props;
  const { translateData } = useSelector(state => state.setting);
  const webViewRef = useRef(null);
  const { Google_Map_Key } = useValues(); // Or hardcode your key
  const { latitude, longitude } = useStoredLocation();
  const { isDark } = useValues()

  const DEFAULT_LAT = latitude;
  const DEFAULT_LNG = longitude;

  const focusToCurrentLocation = () => {
    if (webViewRef.current) {
      const jsCode = `
          if (window.focusToCurrentLocation) {
            window.focusToCurrentLocation();
          }
          true;
        `;
      webViewRef.current.injectJavaScript(jsCode);
    }
  };

  useImperativeHandle(ref, () => ({
    focusToCurrentLocation,
  }));

  const requestPermission = async () => {
    if (Platform.OS === 'android') {
      const granted = await PermissionsAndroid.request(
        PermissionsAndroid.PERMISSIONS.ACCESS_FINE_LOCATION
      );
      return granted === PermissionsAndroid.RESULTS.GRANTED;
    }
    return true;
  };

  useEffect(() => {
    requestPermission().then(granted => {
      if (granted) {
        Geolocation.watchPosition(
          position => {
            const { latitude, longitude, heading } = position.coords;
            const jsCode = `
                if (window.updateLocation) {
                  window.updateLocation(${latitude}, ${longitude}, ${heading || 0});
                }
                true;
              `;
            webViewRef.current?.injectJavaScript(jsCode);
          },
          error => {
            console.warn(error);
            Alert.alert(translateData.locationError, error.message);
          },
          {
            enableHighAccuracy: true,
            distanceFilter: 2,
            interval: 4000,
            fastestInterval: 2000,
          }
        );
      } else {
        Alert.alert(translateData.permissionDenied, translateData.locationPerReq);
      }
    });
  }, []);

  const darkMapStyle = [
    { elementType: 'geometry', stylers: [{ color: '#242f3e' }] },
    { elementType: 'labels.text.stroke', stylers: [{ color: '#242f3e' }] },
    { elementType: 'labels.text.fill', stylers: [{ color: '#746855' }] },
    {
      featureType: 'administrative.locality',
      elementType: 'labels.text.fill',
      stylers: [{ color: '#d59563' }],
    },
    {
      featureType: 'poi',
      elementType: 'labels.text.fill',
      stylers: [{ color: '#d59563' }],
    },
    {
      featureType: 'poi.park',
      elementType: 'geometry',
      stylers: [{ color: '#263c3f' }],
    },
    {
      featureType: 'poi.park',
      elementType: 'labels.text.fill',
      stylers: [{ color: '#6b9a76' }],
    },
    {
      featureType: 'road',
      elementType: 'geometry',
      stylers: [{ color: '#38414e' }],
    },
    {
      featureType: 'road',
      elementType: 'geometry.stroke',
      stylers: [{ color: '#212a37' }],
    },
    {
      featureType: 'road',
      elementType: 'labels.text.fill',
      stylers: [{ color: '#9ca5b3' }],
    },
    {
      featureType: 'road.highway',
      elementType: 'geometry',
      stylers: [{ color: '#746855' }],
    },
    {
      featureType: 'road.highway',
      elementType: 'geometry.stroke',
      stylers: [{ color: '#1f2835' }],
    },
    {
      featureType: 'road.highway',
      elementType: 'labels.text.fill',
      stylers: [{ color: '#f3d19c' }],
    },
    {
      featureType: 'transit',
      elementType: 'geometry',
      stylers: [{ color: '#2f3948' }],
    },
    {
      featureType: 'transit.station',
      elementType: 'labels.text.fill',
      stylers: [{ color: '#d59563' }],
    },
    {
      featureType: 'water',
      elementType: 'geometry',
      stylers: [{ color: '#17263c' }],
    },
    {
      featureType: 'water',
      elementType: 'labels.text.fill',
      stylers: [{ color: '#515c6d' }],
    },
    {
      featureType: 'water',
      elementType: 'labels.text.stroke',
      stylers: [{ color: '#17263c' }],
    },
  ];

  const htmlContent = `
  <!DOCTYPE html>
  <html>
    <head>
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <style>
        html, body, #map {
          margin: 0;
          padding: 0;
          height: 100%;
          width: 100%;
        }
        #car-icon {
          transition: transform 0.3s linear;
        }
      </style>
      <script src="https://maps.googleapis.com/maps/api/js?key=${Google_Map_Key}"></script>
    </head>
    <body>
      <div id="map"></div>
      <script>
        const darkMode = ${isDark ? 'true' : 'false'};
        const darkStyle = ${JSON.stringify(darkMapStyle)};
        
        let map, overlay, currentLatLng;

        class CustomMarker extends google.maps.OverlayView {
          constructor(position) {
            super();
            this.position = position;
            this.div = null;
            this.lastAngle = 0;
          }
          onAdd() {
            this.div = document.createElement("div");
            this.div.style.position = "absolute";
            this.div.innerHTML = \`
              <img id="car-icon" src="${markerIcon}" 
                style="width: 50px; height: 50px; transform: rotate(0deg);" />
            \`;
            this.getPanes().overlayMouseTarget.appendChild(this.div);
          }
          draw() {
            const projection = this.getProjection();
            const pos = projection.fromLatLngToDivPixel(this.position);
            if (pos && this.div) {
              this.div.style.left = pos.x - 25 + "px";
              this.div.style.top = pos.y - 25 + "px";
            }
          }
          onRemove() {
            if (this.div) {
              this.div.remove();
              this.div = null;
            }
          }
          rotate(angle) {
            if (this.div) {
              const img = this.div.querySelector("img");
              if (img) {
                img.style.transform = \`rotate(\${angle}deg)\`;
              }
            }
          }
          updatePositionSmoothly(newPosition, heading) {
            const start = this.position;
            const end = newPosition;
            const duration = 300;
            const steps = 30;
            let step = 0;

            const deltaLat = (end.lat() - start.lat()) / steps;
            const deltaLng = (end.lng() - start.lng()) / steps;

            const animate = () => {
              step++;
              const lat = start.lat() + deltaLat * step;
              const lng = start.lng() + deltaLng * step;
              this.position = new google.maps.LatLng(lat, lng);
              this.draw();

              if (step < steps) {
                requestAnimationFrame(animate);
              }
            };
            animate();
            this.rotate(heading);
          }
        }

        function initMap() {
          const initialPosition = { lat: ${DEFAULT_LAT}, lng: ${DEFAULT_LNG} };
          currentLatLng = new google.maps.LatLng(initialPosition.lat, initialPosition.lng);

          map = new google.maps.Map(document.getElementById("map"), {
            center: initialPosition,
            zoom: 17,
            disableDefaultUI: true,
            styles: darkMode ? darkStyle : null
          });

          overlay = new CustomMarker(currentLatLng);
          overlay.setMap(map);
        }

        window.updateLocation = function(lat, lng, heading) {
          const newLatLng = new google.maps.LatLng(lat, lng);
          if (map && overlay) {
            overlay.updatePositionSmoothly(newLatLng, heading || 0);
            map.panTo(newLatLng);
            currentLatLng = newLatLng;
          }
        };

        window.focusToCurrentLocation = function() {
          if (map && currentLatLng) {
            map.panTo(currentLatLng);
          }
        };

        window.onload = initMap;
      </script>
    </body>
  </html>
`;

  return (
    <View style={styles.container}>
      <WebView
        ref={webViewRef}
        originWhitelist={['*']}
        source={{ html: htmlContent }}
        javaScriptEnabled
        domStorageEnabled
        style={{ flex: 1 }}
      />
    </View>
  );
});

const styles = StyleSheet.create({
  container: {
    ...StyleSheet.absoluteFillObject,
  },
});
