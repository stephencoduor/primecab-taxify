import { View, Text, Image, TouchableOpacity } from 'react-native'
import React, { useEffect, useState } from 'react'
import styles from './styles'
import { useValues } from '../../../../../utils/context'
import { NativeStackNavigationProp } from '@react-navigation/native-stack'
import { RootStackParamList } from '../../../../../navigation/main/types'
import { useNavigation, useTheme } from '@react-navigation/native'
import { useDispatch, useSelector } from 'react-redux'
import appColors from '../../../../../theme/appColors'
import { UserContainerLoader } from './userLoader'
import { getValue } from '../../../../../utils/localstorage'
import { selfDriverData } from '../../../../../api/store/action'

type NavigationType = NativeStackNavigationProp<RootStackParamList>

export function Profile() {
  const { viewRtlStyle, textRtlStyle } = useValues()
  const { colors } = useTheme()
  const { navigate } = useNavigation<NavigationType>()
  const dispatch = useDispatch()
  const { translateData } = useSelector(state => state.setting)
  const { selfDriver } = useSelector(state => state.account)
  const { walletTypedata } = useSelector(state => state.wallet)
  const [walletLoading, setWalletLoading] = useState(true)
  const [token, setToken] = useState<string | null>(null)
  const { zoneValue } = useSelector((state) => state.zoneUpdate)
  const char = selfDriver?.name ? selfDriver.name.charAt(0) : ''
  const navigation = useNavigation()
  
  useEffect(() => {
    const fetchData = async () => {
      setWalletLoading(true)
      const value = await getValue('token')
      setToken(value)
      setWalletLoading(false)
    }

    fetchData()
  }, [dispatch])

  useEffect(() => {
    dispatch(selfDriverData())
  }, [dispatch])

  const navigationProfile = () => {
    navigation.navigate('ProfileSetting')
  }
  return (
    <View
      style={[
        styles.main,
        { backgroundColor: colors.card, borderColor: colors.border },
      ]}
    >
      {walletLoading ? (
        <UserContainerLoader />
      ) : (
        <>
          <View style={[styles.detainContain, { flexDirection: viewRtlStyle }]}>
            <TouchableOpacity onPress={navigationProfile} activeOpacity={0.7}>
              {selfDriver?.profile_image_url ? (
                <Image
                  source={{ uri: selfDriver?.profile_image_url }}
                  style={styles.profileImage}
                />
              ) : (
                <View style={styles.nameTag}>
                  <Text style={[styles.char, { color: appColors.white }]}>
                    {char}
                  </Text>
                </View>
              )}
            </TouchableOpacity>

            <View style={styles.details}>
              <Text
                style={[
                  styles.name,
                  { color: colors.text, textAlign: textRtlStyle },
                ]}
              >
                {selfDriver?.name || translateData.guest}
              </Text>
              {selfDriver?.email && (
                <Text style={[styles.mail, { textAlign: textRtlStyle }]}>
                  {selfDriver?.email}
                </Text>
              )}
            </View>
          </View>

          <TouchableOpacity
            activeOpacity={0.7}
            style={styles.walletContain}
            onPress={() => navigate('MyWallet')}
          >
            <View style={[styles.wallet, { flexDirection: viewRtlStyle }]}>
              <Text style={styles.walletTitle}>
                {translateData.walletBalance}
              </Text>
              <Text style={styles.walletAmount}>
                {zoneValue?.currency_symbol}
                {isNaN(zoneValue?.exchange_rate * walletTypedata?.balance)
                  ? '0'
                  : (zoneValue?.exchange_rate * walletTypedata?.balance).toFixed(2)}
              </Text>

            </View>
          </TouchableOpacity>
        </>
      )}
    </View>
  )
}
