import { View, Text } from 'react-native'
import React from 'react'
import styles from './styles'
import Icons from '../../../../../utils/icons/icons'
import appColors from '../../../../../theme/appColors'
import { ListItem } from '../'
import { useTheme } from '@react-navigation/native'
import { useValues } from '../../../../../utils/context'
import { useSelector } from 'react-redux'
import { useAppNavigation } from '../../../../../utils/navigation'

export function General() {
  const navigation = useAppNavigation()
  const { colors } = useTheme()
  const { textRtlStyle, isDark } = useValues()
  const { translateData } = useSelector(state => state.setting)
  const { selfDriver } = useSelector((state: any) => state.account);

  console.log('selfDriver?.service_category_id', selfDriver?.service_category_id);


  return (
    <View>
      <Text
        style={[
          styles.title,
          { color: colors.text, textAlign: textRtlStyle },
        ]}
      >
        {translateData.general}
      </Text>
      <View
        style={[
          styles.listView,
          { backgroundColor: colors.card, borderColor: colors.border },
        ]}
      >
        <>
          <ListItem
            icon={<Icons.UserSetting color={colors.text} />}
            text={translateData.profileSettings}
            backgroundColor={
              isDark ? colors.background : appColors.graybackground
            }
            color={isDark ? appColors.white : appColors.primaryFont}
            onPress={() => navigation.navigate('ProfileSetting')}
            showNextIcon={true}
          />
          <View style={[styles.border, { borderColor: colors.border }]} />

          <ListItem
            icon={<Icons.WalletSetting color={colors.text} />}
            text={translateData.myWallet}
            backgroundColor={
              isDark ? colors.background : appColors.graybackground
            }
            color={isDark ? appColors.white : appColors.primaryFont}
            onPress={() => navigation.navigate('MyWallet')}
            showNextIcon
          />
          <View style={[styles.border, { borderColor: colors.border }]} />

          <ListItem
            icon={<Icons.Bank color={colors.text} />}
            text={translateData.appSetting}
            backgroundColor={
              isDark ? colors.background : appColors.graybackground
            }
            color={isDark ? appColors.white : appColors.primaryFont}
            onPress={() => navigation.navigate('AppSettings')}
            showNextIcon
          />
          <View style={[styles.border, { borderColor: colors.border }]} />

          <ListItem
            icon={<Icons.Subscription color={colors.text} />}
            text={translateData.subscriptionPlan}
            backgroundColor={
              isDark ? colors.background : appColors.graybackground
            }
            color={isDark ? appColors.white : appColors.primaryFont}
            onPress={() => navigation.navigate('Subscription')}
            showNextIcon
          />
          <View style={[styles.border, { borderColor: colors.border }]} />
          {selfDriver?.service_category_id == 5 &&
            <>
              <ListItem
                icon={<Icons.VehicleList color={colors.text} />}
                text={translateData.rentalVehicle}
                backgroundColor={
                  isDark ? colors.background : appColors.graybackground
                }
                color={isDark ? appColors.white : appColors.primaryFont}
                onPress={() => navigation.navigate('VehicleList')}
                showNextIcon
              />
              <View style={[styles.border, { borderColor: colors.border }]} />
            </>
          }
          <ListItem
            icon={<Icons.MessageEmpty color={colors.text} />}
            text={translateData.supportTicket}
            backgroundColor={
              isDark ? colors.background : appColors.graybackground
            }
            color={isDark ? appColors.white : appColors.primaryFont}
            onPress={() => navigation.navigate('SupportTicket')}
            showNextIcon
          />
          <View style={[styles.border, { borderColor: colors.border }]} />
          <ListItem
            icon={<Icons.HelpSupport color={colors.text} />}
            text={"Chat with Staff"}
            backgroundColor={
              isDark ? colors.background : appColors.graybackground
            }
            color={isDark ? appColors.white : appColors.primaryFont}
            onPress={() => navigation.navigate('Chat', {
              driverId: selfDriver?.id,
              from: "help",
              riderName: selfDriver?.name
            })}

            showNextIcon
          />
          <View style={[styles.border, { borderColor: colors.border }]} />
          {/* <ListItem
            icon={<Icons.VehicleList color={colors.text} />}
            text={"Manage Vehicle"}
            backgroundColor={
              isDark ? colors.background : appColors.graybackground
            }
            color={isDark ? appColors.white : appColors.primaryFont}
            onPress={() => navigation.navigate('ManageVehicle')}
            showNextIcon={true}
          />
          <View style={[styles.border, { borderColor: colors.border }]} />

          <ListItem
            icon={<Icons.Driver color={colors.text} />}
            text={"Manage Driver"}
            backgroundColor={
              isDark ? colors.background : appColors.graybackground
            }
            color={isDark ? appColors.white : appColors.primaryFont}
            onPress={() => navigation.navigate('DriverList')}
            showNextIcon={true}
          /> */}
        </>

      </View>
    </View>
  )
}
