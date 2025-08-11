import { View, Image, Text } from 'react-native'
import React, { useState, useRef } from 'react'
import commanStyles from '../../../../style/commanStyles'
import MapView from 'react-native-maps';
import { Polyline, Marker } from 'react-native-svg';
import { useDispatch, useSelector } from 'react-redux';
import colors from '../../../../assets/icons/colors';
import { BackButton, Button, DriverProfile } from '../../../../commonComponents';
import appColors from '../../../../theme/appColors';
import Images from '../../../../utils/images/images';
import styles from './styles';
import { useValues } from '../../../../utils/context';
import { useNavigation, useTheme, useRoute } from '@react-navigation/native'
import firestore from '@react-native-firebase/firestore'
import { ambulanceRideData, rideDataPut } from '../../../../api/store/action';
import { DriverLoginInterface } from '../../../../api/interface/authInterface';

export function AmbulanceTrack() {
    const route = useRoute()
    const { rideData } = route.params
    const { viewRtlStyle } = useValues()
    const { colors } = useTheme()
    const navigation = useNavigation()
    const markerRef = useRef(null)
    const [routeCoordinates, setRouteCoordinates] = useState([])
    const [heading, setHeading] = useState(0)
    const { translateData } = useSelector(state => state.setting)
    const [completeLoading, setCompleteLoading] = useState(false);
    const [rideStarted, setRideStarted] = useState(false);
    const dispatch = useDispatch()

    const startRide = async () => {
        try {
            setRideStarted(true);
            let payload: DriverLoginInterface = {
                ride_id: rideData?.id,
            };

            dispatch(ambulanceRideData(payload))
                .then(res => {
                })
        } catch (error) {
            console.error("Error updating ride status:", error);
        }
    };


    const gotoPickupPatient = async () => {
        try {
            dispatch(
                rideDataPut({
                    data: {
                        status: 'completed',
                    },
                    ride_id: rideData?.id,
                }),).then(async (res: any) => {

                    if (res?.payload?.id) {
                        navigation.navigate('RideDetails', { ride_Id: res?.payload?.id });
                    } else {
                    }
                })
        } catch (error) {
            console.error("Error updating ride status:", error);
        }
    }
    return (
        <View style={commanStyles.main}>
            {/* <MapView
                style={styles.map}
                initialRegion={{
                    latitude: rideData?.location[0]?.lat,
                    longitude: rideData?.location[0]?.lng,
                    latitudeDelta: 0.01,
                    longitudeDelta: 0.01,
                }}
                showsUserLocation={false}
            >
                <Polyline
                    coordinates={routeCoordinates}
                    strokeColor="green"
                    strokeWidth={5}
                />
                <Marker.Animated
                    ref={markerRef}
                    coordinate={{
                        latitude: rideData?.location[0]?.lat,
                        longitude: rideData?.location[0]?.lng,
                    }}
                    rotation={heading}
                >
                    <Image source={Images.texiImage} style={styles.vehicle_map_icon} />
                </Marker.Animated>
            </MapView> */}
            <View style={styles.extraSection}></View>
            <View style={styles.backButton}>
                <BackButton />
            </View>
            <View style={styles.greenSection}>
                <View
                    style={[
                        styles.additionalSection,
                        { backgroundColor: colors.card, borderColor: colors.border },
                    ]}
                >
                    <DriverProfile
                        userDetails={rideData?.rider}
                        borderRadius={25}
                        showInfoIcon={true}
                        iconColor={appColors.primary}
                        backgroundColor={appColors.white}
                        rideDetails={rideData}
                    />
                </View>
                <Button
                    onPress={rideStarted ? gotoPickupPatient : startRide}
                    title={rideStarted ? translateData.pickPatient : translateData.startRide}
                    backgroundColor={appColors.primary}
                    color={appColors.white}
                    loading={completeLoading}
                />

            </View>
        </View>
    )
}
