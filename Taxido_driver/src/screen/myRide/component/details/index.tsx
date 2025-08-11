import { View, Text, Image, TouchableOpacity } from 'react-native'
import React from 'react'
import { DriverProfile, Address } from '../../../../commonComponents'
import appColors from '../../../../theme/appColors'
import images from '../../../../utils/images/images'
import styles from './styles'
import { useValues } from '../../../../utils/context'
import { useTheme } from '@react-navigation/native'
import { NativeStackNavigationProp } from '@react-navigation/native-stack'
import { RootStackParamList } from '../../../../navigation/main/types'
import { useNavigation } from '@react-navigation/native'
import Clock from '../../../../assets/icons/clock'
import Calander from '../../../../assets/icons/caladerSmall'
import { useSelector } from 'react-redux'
import { apiformatDates, formatDates } from '../../../../utils/functions'
type navigation = NativeStackNavigationProp<RootStackParamList>

export function Details({ rideDetails, vehicleDetail }) {
  const { viewRtlStyle, isDark, textRtlStyle } = useValues()
  const { colors } = useTheme()
  const navigation = useNavigation<navigation>()
  const { zoneValue } = useSelector((state) => state.zoneUpdate)


  const gotoPath = () => {
    navigation.navigate('MapDetails', {
      location: rideDetails?.location_coordinates,
    })
  }

  const formattedDate = apiformatDates(rideDetails.created_at)

  return (
    <View>
      <View
        style={[
          styles.main,
          { backgroundColor: colors.card, borderColor: colors.border },
        ]}
      >
        <DriverProfile
          rideDetails={rideDetails}
          borderRadius={30}
          backgroundColor={appColors.white}
          iconColor={appColors.primary}
          showInfoIcon={false}
          showCarTitle={true}
        />
        <View style={[styles.border, { borderColor: colors.border }]} />
        <View style={[styles.rideData, { flexDirection: viewRtlStyle }]}>
          <View style={[styles.carIdView, { flexDirection: viewRtlStyle }]}>
            <Image
              source={{ uri: rideDetails?.vehicle_type?.vehicle_image_url }}
              style={styles.carImage}
            />
            <View style={styles.tripTextContainer}>
              <Text style={[styles.idNo, { color: colors.text }]}>
                #{rideDetails?.ride_number}
              </Text>
              <Text style={[styles.tripCostText, { textAlign: textRtlStyle }]}>
                {zoneValue?.currency_symbol}
                {rideDetails.total}
              </Text>
            </View>
          </View>

          <View style={styles.iconView}>
            <View style={[styles.viewIcon, { flexDirection: viewRtlStyle }]}>
              <Calander />
              <Text style={styles.date}>{formattedDate.date}</Text>
            </View>
            <View style={[styles.viewIcon, { flexDirection: viewRtlStyle }]}>
              <Clock />
              <Text style={styles.date}>{formattedDate.time}</Text>
            </View>
          </View>
        </View>

        <TouchableOpacity
          activeOpacity={0.7}
          style={[styles.mapView, { flexDirection: viewRtlStyle }]}
          onPress={gotoPath}
        >
          {isDark ? (
            <Image source={images.mapDark} style={styles.mapImage} />
          ) : (
            <Image source={images.map} style={styles.mapImage} />
          )}
        </TouchableOpacity>
      </View>
      <View style={styles.addressView}>
        <Address color={appColors.black} rideDetails={rideDetails} />
      </View>
    </View>
  )
}
