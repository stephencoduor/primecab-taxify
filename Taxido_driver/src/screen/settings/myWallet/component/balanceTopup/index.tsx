import { View, Text, Image, TouchableOpacity } from 'react-native'
import React, { useState } from 'react'
import { useNavigation } from '@react-navigation/native'
import styles from './styles'
import { NativeStackNavigationProp } from '@react-navigation/native-stack'
import { RootStackParamList } from '../../../../../navigation/main/types'
import { useValues } from '../../../../../utils/context'
import { useSelector } from 'react-redux'
import appFonts from '../../../../../theme/appFonts'
import { fontSizes, windowHeight, windowWidth } from '../../../../../theme/appConstant'
import appColors from '../../../../../theme/appColors'
import Images from '../../../../../utils/images/images'
import Icons from '../../../../../utils/icons/icons'
import { notificationHelper } from '../../../../../commonComponents'

type NavigationProps = NativeStackNavigationProp<RootStackParamList>

interface BalanceTopupProps {
  walletTypedata: number
}

export function BalanceTopup({ walletTypedata }: BalanceTopupProps) {
  const navigation = useNavigation<NavigationProps>()
  const { taxidoSettingData,translateData } = useSelector(state => state.setting)
  const { zoneValue } = useSelector((state) => state.zoneUpdate)
  const [isVisible, setIsVisible] = useState(true);
  const rawAmount = `${zoneValue?.currency_symbol}${((zoneValue?.exchange_rate ?? 0) * (walletTypedata ?? 0)).toFixed(2)}`;
  const maskedAmount = `${zoneValue?.currency_symbol}**** **`;

  const gotoTopWithDraw = () => {
    if (walletTypedata >= taxidoSettingData?.taxido_values?.driver_commission?.min_withdraw_amount) {
      navigation.navigate('TopupWallet')
    } else {
      notificationHelper("", `${translateData.minimumAmount} ${zoneValue?.currency_symbol}${(zoneValue?.exchange_rate * taxidoSettingData?.taxido_values?.driver_commission?.min_withdraw_amount).toFixed(2)}.`, "error")
    }
  }

  const gotoTopUp = () => {
    navigation.navigate('TopUp')
  }


  const today = new Date();
  const formattedDate = today.toLocaleDateString('en-US', {
    year: 'numeric',
    month: 'long',
    day: 'numeric',
  });

  return (
    <View style={styles.mainBalance}>
      <Image source={Images.cardBackground} style={styles.walletImage} />
      <View style={[styles.subBalance]}>
        <View style={{ marginHorizontal: windowWidth(4) }}>
          <View style={styles.balanceView}>
            <Text style={styles.balanceTitle}>{translateData.availableBalance}</Text>
          </View>
          <View style={{ borderBottomWidth: 1, borderStyle: 'dashed', width: '100%', borderColor: '#81BFAF' }} />
          <View
            style={{
              flexDirection: 'row',
              marginVertical: windowHeight(2.2),
              alignItems: 'center',
            }}
          >
            <Text
              style={[
                styles.totalBalance,
                {
                  fontVariant: ['tabular-nums'],
                  minWidth: 100,
                  textAlign: 'center',
                },
              ]}
            >
              {isVisible ? rawAmount : maskedAmount}
            </Text>

            <TouchableOpacity
              onPress={() => setIsVisible(prev => !prev)}
              style={{
                marginHorizontal: windowWidth(2),
                alignItems: 'center',
                justifyContent: 'center',
                height: windowHeight(3),
              }}
            >
              {isVisible ? <Icons.WalletEye /> : <Icons.WalletEyeClose />}
            </TouchableOpacity>
          </View>

          <View style={{ flexDirection: 'row', justifyContent: 'space-between' }}>
            <TouchableOpacity activeOpacity={0.9} onPress={gotoTopUp} style={{ backgroundColor: appColors.white, height: windowHeight(4.4), width: '47.5%', flexDirection: 'row', alignItems: 'center', justifyContent: 'center', borderRadius: windowHeight(0.8) }}>
              <Icons.TopUp />
              <Text style={{ color: appColors.primary, marginHorizontal: windowWidth(1.5), fontFamily: appFonts.medium }}>{translateData.topUp}</Text>
            </TouchableOpacity>
            <TouchableOpacity activeOpacity={0.9} onPress={gotoTopWithDraw} style={{ backgroundColor: appColors.white, height: windowHeight(4.4), width: '47.5%', flexDirection: 'row', alignItems: 'center', justifyContent: 'center', borderRadius: windowHeight(0.8) }}>
              <Icons.DollorLarge />
              <Text
                style={{
                  color: appColors.primary,
                  marginHorizontal: windowWidth(1.5),
                  fontFamily: appFonts.medium,
                }}
              >
                {translateData.topupWallet}
              </Text>
            </TouchableOpacity>
          </View>
        </View>
      </View>
      <Text style={{ color: '#B7C7C4', fontFamily: appFonts.regular, fontSize: fontSizes.FONT4, textAlign: 'center', marginTop: windowHeight(1) }}>Balance as of {formattedDate} </Text>
    </View>
  )
}
