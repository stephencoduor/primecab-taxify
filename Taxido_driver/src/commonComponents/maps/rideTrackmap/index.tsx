import React, { useEffect, useState } from 'react'
import { View, PermissionsAndroid, Image } from 'react-native'
import MapView, { Marker } from 'react-native-maps'
import MapViewDirections from 'react-native-maps-directions'
import appColors from '../../../theme/appColors'
import darkMapStyle from '../../../screen/mapView/darkMap'
import { useValues } from '../../../utils/context'
import { useSelector } from 'react-redux'
import firestore from '@react-native-firebase/firestore'

export function RideTrackMap({ DestinationLocation, driverId }) {
    const [driverLocation, setDriverLocation] = useState(null)
    const { isDark, Google_Map_Key } = useValues()
    const { translateData } = useSelector(state => state.setting)
    const { selfDriver } = useSelector((state: any) => state.account)

    useEffect(() => {
        if (!driverId) return

        const unsubscribe = firestore()
            .collection('driverTrack')
            .doc(driverId.toString())
            .onSnapshot(doc => {
                if (doc.exists) {
                    const data = doc.data()
                    const lat = parseFloat(data.lat)
                    const lng = parseFloat(data.lng)

                    if (!isNaN(lat) && !isNaN(lng)) {
                        setDriverLocation({ latitude: lat, longitude: lng })
                    } else {
                    }
                }
            }, error => {
                console.error('Firestore listener error:', error)
            })

        return () => unsubscribe()
    }, [driverId])






    useEffect(() => {
        const requestLocationPermission = async () => {
            try {
                const granted = await PermissionsAndroid.request(
                    PermissionsAndroid.PERMISSIONS.ACCESS_FINE_LOCATION,
                    {
                        title: 'Location Permission',
                        message: 'App needs access to your location.',
                        buttonNeutral: 'Ask Me Later',
                        buttonNegative: 'Cancel',
                        buttonPositive: 'OK',
                    },
                )
                if (granted === PermissionsAndroid.RESULTS.GRANTED) {
                } else {
                }
            } catch (err) { }
        }

        requestLocationPermission()
    }, [])

    const mapCustomStyle = isDark ? darkMapStyle : ''


    const parseCoordinate = coordinate => ({
        latitude: parseFloat(coordinate.lat),
        longitude: parseFloat(coordinate.lng),
    })




    const initialRegion = {
        latitude: 37.78825,
        longitude: -122.4324,
        latitudeDelta: 0.0922,
        longitudeDelta: 0.0421,
    }

    return (
        <View style={{ flex: 1 }}>
            <MapView
                style={{ flex: 1 }}
                initialRegion={initialRegion}
                showsUserLocation={true}
                customMapStyle={mapCustomStyle || []}
                rotateEnabled={false}
            >
                {driverLocation && (
                    <Marker coordinate={driverLocation}>
                        <Image
                            source={{ uri: selfDriver?.vehicle_info?.vehicle_type_map_icon_url }}
                            style={{ width: 40, height: 40 }}
                            resizeMode="contain"
                        />
                    </Marker>
                )}
                {DestinationLocation && (
                    <Marker
                        coordinate={parseCoordinate(DestinationLocation)}
                        title={translateData.markerTwo}
                        description={translateData.secondMarkerlocation}
                    />
                )}
                {driverLocation && DestinationLocation && (
                    <MapViewDirections
                        origin={driverLocation}
                        destination={parseCoordinate(DestinationLocation)}
                        apikey={Google_Map_Key}
                        strokeWidth={4}
                        strokeColor={appColors.primary}
                        optimizeWaypoints={true}
                        mode="DRIVING"
                    />
                )}

            </MapView>
        </View>
    )
}
