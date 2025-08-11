import React from 'react'
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs'
import { Home } from '../../screen/home'
import { MyRide, Settings } from '../../screen'
import { Text, TouchableOpacity, Vibration } from 'react-native'
import appColors from '../../theme/appColors'
import Icons from '../../utils/icons/icons'
import styles from './styles'
import { useSelector } from 'react-redux'
import { useValues } from '../../utils/context'
import { DashBoard } from '../../screen/dashBoard'
import { FleetHome } from '../../screen/fleet'

const Tab = createBottomTabNavigator()

export default function App() {
  const { translateData } = useSelector(state => state.setting)
  const { rtl } = useValues()

  const defaultTranslations = {
    home: 'Home',
    activeRide: 'DashBoard',
    myRide: 'My Ride',
    settings: 'Settings',
  }

  const t = translateData || defaultTranslations

  const screens = [
    {
      name: 'Home',
      component: Home,
      icon: Icons.Home,
      label: t.home,
    },
    {
      name: 'DashBoard',
      component: DashBoard,
      icon: Icons.DashBoard,
      label: 'DashBoard',
    },
    {
      name: 'My Ride',
      component: MyRide,
      icon: Icons.Car,
      label: t.myRide,
    },
    {
      name: 'Settings',
      component: Settings,
      icon: Icons.Setting,
      label: t.settings,
    },
  ]

  const orderedScreens = rtl ? [...screens].reverse() : screens

  return (
    <Tab.Navigator
      detachInactiveScreens={false}

      screenOptions={{
        tabBarStyle: styles.tabBarContainer,
        headerShown: false,
      }}
    >
      {orderedScreens.map(({ name, component, icon: Icon, label }) => (
        <Tab.Screen
          key={name}
          name={name}
          component={component}
          options={{
            tabBarIcon: ({ focused }) => (
              <Icon
                color={focused ? appColors.white : appColors.categoryTitle}
              />
            ),
            tabBarButton: (props) => (
              <TouchableOpacity
                {...props}
                onPress={() => {
                  Vibration.vibrate(42);
                  props.onPress?.();
                }}
              />
            ),
            tabBarLabel: ({ focused }) => (
              <Text
                style={[
                  styles.tabBarLabelStyle,
                  {
                    color: focused ? appColors.white : appColors.categoryTitle,
                    textAlign: rtl ? 'right' : 'left',
                    writingDirection: rtl ? 'rtl' : 'ltr',
                  },
                ]}
              >
                {label}
              </Text>
            ),
          }}
        />
      ))}
    </Tab.Navigator>
  )
}
