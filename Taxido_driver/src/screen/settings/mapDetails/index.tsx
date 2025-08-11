import { View } from 'react-native'
import React from 'react'
import { useRoute } from '@react-navigation/native'
import MapView, { Marker } from 'react-native-maps'
import MapViewDirections from 'react-native-maps-directions'
import appColors from '../../../theme/appColors'
import { useSelector } from 'react-redux'
import styles from '../../../style/commanStyles'
import { useValues } from '../../../utils/context'

export function MapDetails() {
  const route = useRoute()
  const { location } = route.params
  const { translateData } = useSelector(state => state.setting)
  const { Google_Map_Key } = useValues();

  const pickupPoint = {
    latitude: parseFloat(location[0]?.lat),
    longitude: parseFloat(location[0]?.lng),
  }

  const destinationPoint = {
    latitude: parseFloat(location[1]?.lat),
    longitude: parseFloat(location[1]?.lng),
  }

  return (
    <View style={styles.main}>
      <MapView
        style={styles.main}
        rotateEnabled={false}
        initialRegion={{
          latitude: (pickupPoint?.latitude + destinationPoint?.latitude) / 2,
          longitude: (pickupPoint?.longitude + destinationPoint?.longitude) / 2,
          latitudeDelta:
            Math.abs(pickupPoint?.latitude - destinationPoint?.latitude) + 0.1,
          longitudeDelta:
            Math.abs(pickupPoint?.longitude - destinationPoint?.longitude) +
            0.1,
        }}
      >
        <Marker coordinate={pickupPoint} title={translateData.pickupPoint} />

        <Marker
          coordinate={destinationPoint}
          title={translateData.destinationPoint}
        />

        <MapViewDirections
          origin={pickupPoint}
          destination={destinationPoint}
          apikey={Google_Map_Key}
          strokeWidth={4}
          strokeColor={appColors.primary}
        />
      </MapView>
    </View>
  )
}
