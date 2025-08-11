import React, { useEffect } from 'react'
import { View } from 'react-native'
import { Header } from '../component'
import styles from './styles'
import { RideStatus } from '../rideStatus'
import appColors from '../../../theme/appColors'
import { rideDataGets } from '../../../api/store/action'
import { useDispatch } from 'react-redux'

export function MyRide() {
  const dispatch = useDispatch()

  useEffect(() => {
    dispatch(rideDataGets())
  }, [])
  return (
    <View style={styles.main}>
      <Header />
      <View>
        <View
          style={{
            backgroundColor: appColors.graybackground,
          }}
        >
          <RideStatus />
        </View>
      </View>
    </View>
  )
}

export default MyRide
