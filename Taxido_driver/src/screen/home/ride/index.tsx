import { View, Text, TouchableOpacity, TextInput, Vibration } from 'react-native';
import React, { useState, useEffect } from 'react';
import appColors from '../../../theme/appColors';
import { useTheme, useRoute } from '@react-navigation/native';
import styles from './styles';
import { Map } from '../../mapView';
import commanStyles from '../../../style/commanStyles';
import { Button, BackButton, notificationHelper } from '../../../commonComponents';
import { UserDetails } from './component/userDetails';
import { useValues } from '../../../utils/context';
import { DriverRideRequest } from '../../../api/interface/rideRequestInterface';
import { bidDataPost, rideDataGets } from '../../../api/store/action/index';
import { useDispatch, useSelector } from 'react-redux';
import { windowHeight } from '../../../theme/appConstant';
import firestore from '@react-native-firebase/firestore';
import { useAppNavigation } from '../../../utils/navigation';
import NotificationHelper from '../../../commonComponents/helper/localNotificationhelper';

export function Ride() {
  const navigation = useAppNavigation();
  const { textRtlStyle, viewRtlStyle, isDark, notificationValue } = useValues();
  const { colors } = useTheme();
  const [bidId, setBidID] = useState<number | null>(null);
  const route = useRoute();
  const { ride } = route.params;
  const [value, setValue] = useState(String(ride?.total));
  const dispatch = useDispatch();
  const { translateData, taxidoSettingData } = useSelector(state => state.setting);
  const { zoneValue } = useSelector(state => state.zoneUpdate);
  const [bidload, setbidloading] = useState(false);
  const increaseAmount = parseFloat(taxidoSettingData?.taxido_values?.ride?.increase_amount_range ?? 10);
  const minFare = parseFloat(ride?.total);
  const maxPercentage = parseFloat(taxidoSettingData?.taxido_values?.ride?.max_bidding_fare_driver ?? 0);
  const maxFare = minFare + (minFare * maxPercentage / 100);
  const numericFare = parseFloat(String(value).replace(/,/g, '').replace(zoneValue?.currency_symbol, ''));
  const safeFare = isNaN(numericFare) ? minFare : numericFare;
  const isPlusDisabled = safeFare >= maxFare;
  const isMinusDisabled = safeFare <= minFare;

  useEffect(() => {
    if (!ride?.id || !bidId) return;
    const unsubscribe = firestore()
      .collection('ride_requests')
      .doc(String(ride.id))
      .collection('bids')
      .doc(String(bidId))
      .onSnapshot(async (doc) => {
        if (!doc.exists) {
          navigation.goBack();
          return;
        }
        const data = doc.data();
        const status = data?.status;
        const ride_ID = data?.ride_id;
        if (status == 'accepted') {
          dispatch(rideDataGets());
          if (data?.service_category?.service_category_type === 'schedule') {
            navigation.navigate('TabNav');
            if (notificationValue == true) {
              NotificationHelper.showNotification({
                title: '🚖 Ride Scheduled',
                message: 'A ride has been scheduled. Please review the Myride details and prepare for pickup',
              });
            }
          } else {
            navigation.navigate('AcceptFare', { ride_Id: ride_ID });
            if (notificationValue == true) {
              NotificationHelper.showNotification({
                title: '🎉 Bid Approved',
                message: 'Your bid has been approved. Let’s hit the road! 🚗 Check MyRides for details.',
              });
            }
          }
        } else if (status === 'rejected') {
          navigation.goBack();
          notificationHelper('', 'Your bid has been rejected by the rider.', 'error');
          if (notificationValue == true) {
            NotificationHelper.showNotification({
              title: '😕 Bid Not Accepted',
              message: 'Your bid wasn’t selected this time. Keep bidding — more rides are waiting! 🚗',
            });
          }
        }
      });

    return () => unsubscribe();
  }, [ride?.id, bidId]);

  const truncateToTwoDecimals = value => {
    return Math.trunc(value * 100) / 100;
  };


  const gotoAcceptFare = async () => {
    setbidloading(true);
    const payload: DriverRideRequest = {
      amount: truncateToTwoDecimals(safeFare),
      ride_request_id: ride?.id,
      currency_code: zoneValue?.currency_code,
    };

    dispatch(bidDataPost(payload))
      .unwrap()
      .then(async (res: any) => {
        if (res?.id) {
          notificationHelper('', translateData.bidPlace, 'success');
          setBidID(res.id);
        } else {
          notificationHelper('', res?.message, 'error');
        }
        setbidloading(false);
      });
  };

  const handleIncrement = () => {
    Vibration.vibrate(42)
    const newFare = safeFare + increaseAmount;
    setValue(newFare >= maxFare ? String(maxFare) : String(newFare));
  };

  const handleDecrement = () => {
    Vibration.vibrate(42)
    const newFare = safeFare - increaseAmount;
    setValue(newFare <= minFare ? String(minFare) : String(newFare));
  };

  const handleChange = (text: string) => {
    const numericText = text.replace(zoneValue?.currency_symbol, '').replace(/,/g, '');
    const num = parseFloat(numericText);
    if (!isNaN(num)) {
      setValue(String(num));
    } else {
      setValue('0');
    }
  };

  const formatCurrency = (amount: string | number) => {
    const num = typeof amount === 'string' ? parseFloat(amount) : amount;
    return `${zoneValue?.currency_symbol}${num.toLocaleString(undefined, { minimumFractionDigits: 2 })}`;
  };

  const buttonColor = safeFare >= ride?.ride_fare ? appColors.primary : appColors.disabled;

  return (
    <View style={commanStyles.main}>
      <View style={styles.mapSection}>
        <Map Destinationlocation={ride?.location_coordinates[1]} driverId={ride?.drivers?.id} />
      </View>
      <View style={styles.extraSection}></View>
      <View style={[styles.backButton]}>
        <BackButton />
      </View>
      <View style={styles.greenSection}>
        <UserDetails RideData={ride} />
        <View style={[styles.bottomView, { backgroundColor: colors.card }]}>
          <Text style={[styles.text, { color: colors.text, textAlign: textRtlStyle }]}> {translateData.offerYourFare} </Text>
          <View style={[styles.boxContainer, { backgroundColor: colors.background, flexDirection: viewRtlStyle }]}>
            <TouchableOpacity
              activeOpacity={0.7}
              onPress={handleDecrement}
              style={[styles.boxLeft, { backgroundColor: colors.card, opacity: isMinusDisabled ? 0.5 : 1 }]}
              disabled={isMinusDisabled}
            >
              <Text style={[styles.value, { color: isDark ? appColors.white : appColors.primaryFont }]}> -{increaseAmount} </Text>
            </TouchableOpacity>

            <View style={{ top: windowHeight(0.4) }}>
              <TextInput
                borderColor={colors.background}
                value={formatCurrency(value)}
                onChangeText={handleChange}
                keyboardType="numeric"
                style={styles.textInput}
              />
            </View>

            <TouchableOpacity
              activeOpacity={0.7}
              onPress={handleIncrement}
              style={[styles.boxRight, { backgroundColor: colors.card, opacity: isPlusDisabled ? 0.5 : 1 }]}
              disabled={isPlusDisabled}
            >
              <Text style={[styles.value, { color: isDark ? appColors.white : appColors.primaryFont }]}> +{increaseAmount} </Text>
            </TouchableOpacity>
          </View>

          <View style={styles.button}>
            <Button
              onPress={gotoAcceptFare}
              title={`${translateData.acceptFareon} ${zoneValue?.currency_symbol}${safeFare.toFixed(2)}`}
              backgroundColor={buttonColor}
              color={appColors.white}
              loading={bidload}
            />
          </View>
        </View>
      </View>
    </View>
  );
}
