import { View, Text, ScrollView, TouchableOpacity, BackHandler } from 'react-native'
import React, { useEffect, useState } from 'react'
import { useNavigation, useRoute, useTheme } from '@react-navigation/native'
import styles from './styles'
import commanStyle from '../../../style/commanStyles'
import { Payment, Bill } from '../endRide/component'
import { Profile } from './component/profile'
import { Header, Address } from '../../../commonComponents'
import { RateCustomer } from '../rateCustomer'
import { NativeStackNavigationProp } from '@react-navigation/native-stack'
import { RootStackParamList } from '../../../navigation/main/types'
import { useSelector } from 'react-redux'
import { useValues } from '../../../utils/context'
import appColors from '../../../theme/appColors'
import firestore from '@react-native-firebase/firestore'
import { windowHeight } from '../../../theme/appConstant'
import appFonts from '../../../theme/appFonts'

type navigation = NativeStackNavigationProp<RootStackParamList>

export function RideDetails() {
  const route = useRoute()
  const ride_Id = route?.params || {}
  const navigation = useNavigation<navigation>()
  const { colors } = useTheme()
  const [modalVisible, setModalVisible] = useState(false)
  const { isDark } = useValues()
  const { translateData } = useSelector(state => state.setting)
  const [rideData, setRideData] = useState(null);
  const { zoneValue } = useSelector((state) => state.zoneUpdate)

  useEffect(() => {
    fetchRideData();
  }, []);

  const fetchRideData = async () => {
    try {
      const rideDoc = await firestore().collection('rides').doc(ride_Id?.ride_Id.toString()).get();

      if (rideDoc.exists) {
        setRideData(rideDoc?.data());
      } else {
        console.warn('No ride found with the provided ID.');
      }
    } catch (error) {
      console.error('Error fetching ride data:', error);
    }
  };


  const toggleModal = () => {
    setModalVisible(!modalVisible)
  }

  useEffect(() => {
    const handleBackPress = () => {
      navigation.navigate('TabNav')
      return true
    }

    const backHandler = BackHandler.addEventListener(
      'hardwareBackPress',
      handleBackPress,
    )
    return () => backHandler.remove()
  }, [navigation])



  return (
    <ScrollView style={commanStyle.main} showsVerticalScrollIndicator={false}>
      <View style={{ height: windowHeight(9.5), backgroundColor: isDark ? appColors.darkThemeSub : appColors.white, }}>
        <Text style={[styles.activeRide, { color: colors.text }]}>{translateData.rideDetails}</Text>
      </View>
      <View style={[styles.contain, { backgroundColor: colors.background }]}>
        <Profile userDetails={rideData?.rider} rideDetails={rideData} />
        <Address rideDetails={rideData} />
        <View style={styles.spaceTop}>
          {rideData?.payment_status == "PENDING" ? (
            <Bill pressRefresh={fetchRideData} />
          ) : (
            <>
              <Text style={{ fontFamily: appFonts.medium, marginTop: windowHeight(1.2), marginBottom: windowHeight(0.8), color: isDark ? appColors.white : appColors.black }}>Bill Summary</Text>
              <View style={{ backgroundColor: isDark ? appColors.darkThemeSub : appColors.white, padding: windowHeight(1), borderRadius: windowHeight(1) }}>
                <View style={{ flexDirection: 'row', justifyContent: 'space-between', marginVertical: windowHeight(0.5) }}>
                  <Text style={{ fontFamily: appFonts.regular, color: isDark ? appColors.white : appColors.black }}>{translateData.subTotal}</Text>
                  <Text style={{ fontFamily: appFonts.regular, color: isDark ? appColors.darkText : appColors.primaryFont }}>{zoneValue?.currency_symbol}{rideData?.sub_total}</Text>
                </View>
                <View style={{ flexDirection: 'row', justifyContent: 'space-between', marginVertical: windowHeight(0.5) }}>
                  <Text style={{ fontFamily: appFonts.regular, color: isDark ? appColors.white : appColors.black }}>{translateData.tax}</Text>
                  <Text style={{ fontFamily: appFonts.regular, color: isDark ? appColors.darkText : appColors.primaryFont }}>{zoneValue?.currency_symbol}{rideData?.tax}</Text>
                </View>
                <View style={{ flexDirection: 'row', justifyContent: 'space-between', marginVertical: windowHeight(0.5) }}>
                  <Text style={{ fontFamily: appFonts.regular, color: isDark ? appColors.white : appColors.black }}>{translateData.platformFees}</Text>
                  <Text style={{ fontFamily: appFonts.regular, color: isDark ? appColors.darkText : appColors.primaryFont }}>{zoneValue?.currency_symbol}{rideData?.platform_fees}</Text>
                </View>
                <View style={{ borderBottomWidth: 1, borderBottomColor: appColors.border, borderStyle: 'dashed', marginVertical: windowHeight(1) }} />
                <View style={{ flexDirection: 'row', justifyContent: 'space-between' }}>
                  <Text style={{ fontFamily: appFonts.medium, color: isDark ? appColors.white : appColors.black }}>{translateData.totalBill}</Text>
                  <Text style={{ fontFamily: appFonts.bold, color: appColors.primary }}>{zoneValue?.currency_symbol}{rideData?.total}</Text>
                </View>
              </View>
            </>
          )}
        </View>
        <Payment rideDetails={rideData} />
      </View>
      <TouchableOpacity
        activeOpacity={0.7}
        style={styles.review}
        onPress={toggleModal}
      >
        <Text
          style={{
            color: isDark ? appColors.white : appColors.primaryFont,
            textAlign: 'center',
          }}
        >
          {translateData.reviewCustomer}
        </Text>
      </TouchableOpacity>
      <RateCustomer
        modalVisible={modalVisible}
        setModalVisible={setModalVisible}
      />
    </ScrollView>
  )
}
