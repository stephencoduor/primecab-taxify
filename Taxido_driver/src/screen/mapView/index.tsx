import React, { useEffect, useRef, useState } from 'react';
import { View } from 'react-native';
import WebView from 'react-native-webview';
import firestore from '@react-native-firebase/firestore';
import appColors from '../../theme/appColors';
import darkMapStyle from './darkMap';
import { useValues } from '../../utils/context';
import { useSelector } from 'react-redux';

export function Map({ Destinationlocation, driverId, rideDetails }) {
  const [driverLocation, setDriverLocation] = useState(null);
  const [routeCoordinates, setRouteCoordinates] = useState([]);
  const [rotation, setRotation] = useState(0);
  const webViewRef = useRef(null);
  const lastPosition = useRef(null);
  const lastStoredPosition = useRef(null);
  const { isDark, Google_Map_Key } = useValues();
  const { selfDriver } = useSelector((state) => state.account);

  const isRouteFetched = useRef(false);

  const parseCoordinate = (coordinate) => ({
    latitude: parseFloat(coordinate.lat),
    longitude: parseFloat(coordinate.lng),
  });

  const storeRidePathIfNeeded = async (newLocation) => {
    if (rideDetails?.service_category?.service_category_type?.toLowerCase() !== 'package') return;
    const shouldStore = !lastStoredPosition.current || getDistance(lastStoredPosition.current, newLocation) >= 250;
    if (shouldStore) {
      try {
        await firestore().collection('rides').doc(rideDetails?.id.toString()).update({
          ride_path: firestore.FieldValue.arrayUnion({
            latitude: newLocation.latitude.toString(),
            longitude: newLocation.longitude.toString(),
          }),
        });
        lastStoredPosition.current = newLocation;
      } catch (err) { console.error("Failed to store ride path:", err); }
    }
  };

  useEffect(() => {
    if (!driverId) return;
    const unsubscribe = firestore().collection('driverTrack').doc(driverId.toString()).onSnapshot((doc) => {
      if (doc.exists) {
        const { lat, lng } = doc.data();
        const newLocation = { latitude: parseFloat(lat), longitude: parseFloat(lng) };

        if (!driverLocation) {
          setDriverLocation(newLocation);
        }

        storeRidePathIfNeeded(newLocation);
        let newRotation = rotation;
        if (lastPosition.current) {
          const distance = getDistance(lastPosition.current, newLocation);
          if (distance < 3) return;
          const angle = getBearing(lastPosition.current, newLocation);
          if (!isNaN(angle)) {
            setRotation(angle);
            newRotation = angle;
          }
        }
        lastPosition.current = newLocation;

        if (webViewRef.current) {
          const jsCode = `
            window.updateDriverMarker(${newLocation.latitude}, ${newLocation.longitude}, ${newRotation});
            window.animateCameraTo({ lat: ${newLocation.latitude}, lng: ${newLocation.longitude} });
            true;`;
          webViewRef.current.injectJavaScript(jsCode);
        }
      }
    });
    return () => unsubscribe();
  }, [driverId, rideDetails]);


  useEffect(() => {
    if (!driverLocation || !Destinationlocation || isRouteFetched.current) {
      return;
    }

    isRouteFetched.current = true;

    const origin = driverLocation;
    const destination = parseCoordinate(Destinationlocation);
    const directionsUrl = `https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=${Google_Map_Key}`;

    fetch(directionsUrl).then(res => res.json()).then(json => {
      if (json.routes.length) {
        const points = decodePolyline(json.routes[0].overview_polyline.points);
        setRouteCoordinates(points);
      }
    });
  }, [driverLocation, Destinationlocation]); 


  useEffect(() => {
    if (routeCoordinates.length > 0 && webViewRef.current) {
      const formattedPoints = routeCoordinates.map(p => ({ lat: p.latitude, lng: p.longitude }));
      const jsCode = `
        window.updatePolyline(${JSON.stringify(formattedPoints)});
        window.fitMapToPolyline(); 
        true;
      `;
      webViewRef.current.injectJavaScript(jsCode);
    }
  }, [routeCoordinates]);

  const decodePolyline = (t) => {
    let points = [], index = 0, lat = 0, lng = 0;
    while (index < t.length) {
      let b, shift = 0, result = 0;
      do { b = t.charCodeAt(index++) - 63; result |= (b & 0x1f) << shift; shift += 5; } while (b >= 0x20);
      const dlat = ((result & 1) ? ~(result >> 1) : (result >> 1)); lat += dlat;
      shift = 0; result = 0;
      do { b = t.charCodeAt(index++) - 63; result |= (b & 0x1f) << shift; shift += 5; } while (b >= 0x20);
      const dlng = ((result & 1) ? ~(result >> 1) : (result >> 1)); lng += dlng;
      points.push({ latitude: lat / 1e5, longitude: lng / 1e5 });
    }
    return points;
  };
  const getBearing = (start, end) => {
    const toRad = deg => deg * Math.PI / 180, toDeg = rad => rad * 180 / Math.PI;
    const lat1 = toRad(start.latitude), lon1 = toRad(start.longitude), lat2 = toRad(end.latitude), lon2 = toRad(end.longitude);
    const dLon = lon2 - lon1;
    const y = Math.sin(dLon) * Math.cos(lat2);
    const x = Math.cos(lat1) * Math.sin(lat2) - Math.sin(lat1) * Math.cos(lat2) * Math.cos(dLon);
    return (toDeg(Math.atan2(y, x)) + 360) % 360;
  };
  const getDistance = (from, to) => {
    const R = 6371000;
    const dLat = (to.latitude - from.latitude) * Math.PI / 180, dLon = (to.longitude - from.longitude) * Math.PI / 180;
    const lat1 = from.latitude * Math.PI / 180, lat2 = to.latitude * Math.PI / 180;
    const a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.sin(dLon / 2) * Math.sin(dLon / 2) * Math.cos(lat1) * Math.cos(lat2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    return R * c;
  };


  const initialRegion = {
    latitude: rideDetails?.pickup_latitude || 37.78825,
    longitude: rideDetails?.pickup_longitude || -122.4324,
  };
  const driverIconUrl = selfDriver?.vehicle_info?.vehicle_type_map_icon_url || '';
  const mapStyleString = isDark ? JSON.stringify(darkMapStyle) : '[]';
  const destinationCoords = Destinationlocation ? parseCoordinate(Destinationlocation) : null;
  const destinationForWebView = destinationCoords ? { lat: destinationCoords.latitude, lng: destinationCoords.longitude } : null;

  const htmlContent = `
  <!DOCTYPE html>
  <html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>Live Map</title>
    <style> html, body, #map { height: 100%; margin: 0; padding: 0; } </style>
  </head>
  <body>
    <div id="map"></div>
    <script src="https://maps.googleapis.com/maps/api/js?key=${Google_Map_Key}"></script>
    <script>
      let map, driverMarker, destinationMarker, routePolyline;

      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: { lat: ${initialRegion.latitude}, lng: ${initialRegion.longitude} },
          zoom: 16,
          styles: ${mapStyleString},
          disableDefaultUI: true
        });

        const destPos = ${JSON.stringify(destinationForWebView)};
        if (destPos) {
          destinationMarker = new google.maps.Marker({ position: destPos, map: map, title: "Destination" });
        }

        routePolyline = new google.maps.Polyline({
          path: [], geodesic: true, strokeColor: '${appColors.primary}', strokeOpacity: 1.0, strokeWeight: 4
        });
        routePolyline.setMap(map);
      }

      window.updateDriverMarker = function(lat, lng, rotation) {
        const newPosition = new google.maps.LatLng(lat, lng);
        if (!driverMarker) {
          driverMarker = new google.maps.Marker({
            position: newPosition, map: map,
            icon: { url: '${driverIconUrl}', scaledSize: new google.maps.Size(40, 40), anchor: new google.maps.Point(20, 20), }
          });
        } else {
          driverMarker.setPosition(newPosition);
        }
        const currentIcon = driverMarker.getIcon();
        currentIcon.rotation = rotation;
        driverMarker.setIcon(currentIcon);
      };
      
      window.updatePolyline = function(points) {
        if (routePolyline) { routePolyline.setPath(points); }
      };

    
      window.fitMapToPolyline = function() {
        const path = routePolyline.getPath();
        if (path.getLength() > 0) {
          const bounds = new google.maps.LatLngBounds();
          path.forEach(function(latLng) {
            bounds.extend(latLng);
          });
          map.fitBounds(bounds, 60);
        }
      };

      window.animateCameraTo = function(center) {
        if (map) { map.panTo(center); }
      };

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
        source={{ html: htmlContent }}
        javaScriptEnabled={true}
        domStorageEnabled={true}
        scrollEnabled={false}
      />
    </View>
  );
}