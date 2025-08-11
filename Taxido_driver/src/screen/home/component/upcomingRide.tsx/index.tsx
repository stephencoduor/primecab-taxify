import { View, Text, Image, TouchableOpacity } from 'react-native'
import React, { useState, useImperativeHandle, forwardRef, useEffect } from 'react'
import Icons from '../../../../utils/icons/icons'
import styles from './styles'
import { useValues } from '../../../../utils/context'
import { useNavigation, useTheme } from '@react-navigation/native'
import appColors from '../../../../theme/appColors'
import { fontSizes, windowHeight, windowWidth } from '../../../../theme/appConstant'
import CalanderSmall from '../../../../assets/icons/caladerSmall'
import Clock from '../../../../assets/icons/clock'
import { useDispatch, useSelector } from 'react-redux'
import { acceptRequestValue, rejectRequestValue, rideDataGet, rideDataGets } from '../../../../api/store/action'
import { notificationHelper } from '../../../../commonComponents'
import appFonts from '../../../../theme/appFonts'
import firestore from '@react-native-firebase/firestore'
import { ProgressBar } from '../../../../commonComponents/helper/progressBarHelper'
import { formatDates } from '../../../../utils/functions'
import NotificationHelper from '../../../../commonComponents/helper/localNotificationhelper'
import useSmartLocation from '../../../../commonComponents/helper/locationHelper'
import CustomSlider from '../../../../commonComponents/CustomSlider'
interface UpcomingRideProps {
  ride: any
  gotoRide: () => void
  gotoInfo: () => void
  selectDriver: () => void
  onRideDeclined: () => void
}

export const UpcomingRide = forwardRef(function UpcomingRide({ ride, gotoRide, gotoInfo, selectDriver, onRideDeclined }, ref) {
  const { textRtlStyle, viewRtlStyle, isDark, rtl, Google_Map_Key, notificationValue } = useValues();
  const { colors } = useTheme()
  const { translateData, taxidoSettingData } = useSelector(state => state.setting)
  const dispatch = useDispatch()
  const { zoneValue } = useSelector(state => state.zoneUpdate)
  const { navigate } = useNavigation()
  const { selfDriver } = useSelector((state: any) => state.account)
  const [declined, setDeclined] = useState(false);
  const formattedDate = formatDates(ride?.created_at)
  const { currentLatitude, currentLongitude } = useSmartLocation();
  const [distance, setDistance] = useState('')

  const acceptRide = rideId => {
    const payload = {
      ride_request_id: rideId,
    }
    dispatch(acceptRequestValue(payload))
      .unwrap()
      .then(async res => {
        if (res?.id) {
          dispatch(rideDataGet(res?.id))
          if (ride?.service_category?.service_category_type === 'rental') {
            handleCreateRental(rideId, res)
            dispatch(rideDataGets())
          } else {
            if (ride?.service_category?.service_category_type === 'schedule') {
              dispatch(rideDataGets())
              if (notificationValue == true) {
                NotificationHelper.showNotification({
                  title: '🚗 Ride Scheduled',
                  message: 'A ride has been scheduled. Please check the details in your app.',
                })
                onRideDeclined();
              }
              notificationHelper('', translateData.rideScheduled, 'success')
            } else {
              onRideDeclined();
              navigate('AcceptFare', { ride_Id: res?.id, ride_Details: res })
              dispatch(rideDataGets())
            }
          }
        } else {
          notificationHelper('', translateData.somthingwentwroung, "error")
        }
      })
      .catch(err => {
      })
  }

  useImperativeHandle(ref, () => ({
    acceptRide,
  }));

  const handleCreateRental = async (rideId, res) => {
    onRideDeclined();
    try {
      await firestore()
        .collection('ride_requests')
        .doc(rideId.toString())
        .collection('rental_request')
        .doc(rideId.toString())
        .update({
          status: 'accepted',
          ride_id: res?.id,
        });

      if (notificationValue == true) {
        NotificationHelper.showNotification({
          title: '🚖 Rental Request Approved',
          message: 'You have been assigned a rental. Please check the MyRides details and proceed',
        })
      }
      try {
        const driverId = res?.driver_id || selfDriver.id;
        const driverDocRef = firestore()
          .collection('driver_ride_requests')
          .doc(driverId.toString());
        const docSnapshot = await driverDocRef.get();

        if (!docSnapshot.exists) {
          console.warn('Driver document does not exist.');
          return;
        }

        const rideRequests = docSnapshot.data().ride_requests || [];
        const updatedRequests = rideRequests.filter(
          (request) => request.id !== rideId.toString()
        );

        await driverDocRef.update({
          ride_requests: updatedRequests,
        });

        await firestore()
          .collection('rides')
          .doc(res.id.toString())
          .set(res);
        navigate('RideDetails', { ride_Id: res?.id })

      } catch (error) {
        console.error('Error removing ride request:', error);
      }
    } catch (error) {
      console.error('Error handling rental creation:', error);
    }
  }

  const acceptAmbulance = rideId => {
    onRideDeclined();
    const payload = {
      ride_request_id: rideId,
    }

    dispatch(acceptRequestValue(payload))
      .unwrap()
      .then(async res => {
        if (res?.id) {
          dispatch(rideDataGet(res?.id))
            .then(async (res: any) => {

              navigate('AmbulanceTrack', { rideData: res?.payload })
              dispatch(rideDataGets())
            })
        } else {
          notificationHelper('', res?.message, 'error')
        }
      })
      .catch(err => {
      })
  }

  const declineRide = async rideId => {
    onRideDeclined();
    const driverId = selfDriver?.id
    if (!rideId || !driverId) return
    setDeclined(true);
    const payload = {
      ride_request_id: rideId,
    }
    dispatch(rejectRequestValue(payload))
      .unwrap()
      .then(async res => {
      })
  }


  const calculateDrivingDistance = () => {
    const url = `https://maps.googleapis.com/maps/api/distancematrix/json?origins=${currentLatitude},${currentLongitude}&destinations=${ride?.location_coordinates[0]?.lat},${ride?.location_coordinates[0]?.lng}&mode=driving&units=metric&key=${Google_Map_Key}`;

    fetch(url)
      .then(response => response.json())
      .then(data => {
        if (data.status === 'OK' && data.rows[0].elements[0].status === 'OK') {
          const distance = data.rows[0].elements[0].distance.text; // e.g., "5.6 km"
          setDistance(distance);
        } else {
          console.error('Error:', data.status, data.rows[0].elements[0].status);
          console.error('Details:', data.error_message || 'No additional details');
          setDistance('Error');
        }
      })
      .catch(error => {
        console.error('Fetch error:', error);
        setDistance('Error');
      });
  };

  useEffect(() => {
    if (currentLatitude && currentLongitude && ride?.location_coordinates[0]?.lat && ride?.location_coordinates[0]?.lng) {
      calculateDrivingDistance();
    }
  }, [currentLatitude, currentLongitude, ride?.location_coordinates[0]?.lat, ride?.location_coordinates[0]?.lng]);


  const endTime = ride?.end_time;
  const startTime = ride?.start_time;

  let formattedDate1 = '';
  let formattedTime1 = '';
  let formattedDate2 = '';
  let formattedTime2 = '';

  if (startTime) {
    const startDateObj = new Date(startTime.replace(" ", "T"));
    const options = { day: 'numeric', month: 'long' };
    formattedDate1 = startDateObj.toLocaleDateString('en-GB', options);
    let hours = startDateObj.getHours();
    const ampm = hours >= 12 ? 'PM' : 'AM';
    hours = hours % 12 || 12;
    formattedTime1 = `${hours} ${ampm}`;
  }

  if (endTime) {
    const endDateObj = new Date(endTime.replace(" ", "T"));
    const options = { day: 'numeric', month: 'long' };
    formattedDate2 = endDateObj.toLocaleDateString('en-GB', options);
    let hours = endDateObj.getHours();
    const ampm = hours >= 12 ? 'PM' : 'AM';
    hours = hours % 12 || 12;
    formattedTime2 = `${hours} ${ampm}`;
  }



  return (
    <TouchableOpacity
      activeOpacity={0.7}
      onPress={() => {
        if (
          ride?.service?.service_type !== 'ambulance' &&
          taxidoSettingData?.taxido_values?.activation?.bidding != 0
        ) {
          gotoRide(ride)
        }
      }}
      disabled={
        ride?.service?.service_type === 'ambulance' ||
        taxidoSettingData?.taxido_values?.activation?.bidding == 0
      }
      style={[
        styles.main,
        { backgroundColor: colors.card, borderColor: colors.border },
      ]}
    >
      <View
        style={[
          styles.top,
          {
            backgroundColor: colors.background,
          },
        ]}
      >

        {taxidoSettingData?.taxido_values?.activation?.bidding == 0 &&
          !declined &&
          ride?.service_category?.service_category_type !== 'rental' && ride?.service?.service_type !== 'ambulance' && (
            <ProgressBar
              onComplete={() => {
                declineRide(ride?.id);
              }}
            />
          )}
        {ride?.service_category?.service_category_type == 'rental' && (
          <ProgressBar
            onComplete={() => {
              declineRide(ride?.id);
            }}
          />
        )}
        {ride?.service?.service_type === 'ambulance' && (
          <ProgressBar
            onComplete={() => {
              declineRide(ride?.id);
            }}
          />
        )}
        <View style={{ paddingHorizontal: windowWidth(3) }} >
          <View style={[styles.alignment, { flexDirection: viewRtlStyle }]}>
            <View style={[styles.profile, { flexDirection: viewRtlStyle }]}>
              {ride?.rider?.profile_image?.original_url ? (
                <Image
                  source={{ uri: ride?.rider?.profile_image.original_url }}
                  style={styles.userimage}
                />
              ) : (
                <View style={[styles.userimage, styles.initialsCircle]}>
                  <Text
                    style={{
                      fontSize: fontSizes.FONT4HALF,
                      color: appColors.white,
                      fontFamily: appFonts.bold,
                    }}
                  >
                    {ride?.rider?.name?.charAt(0)?.toUpperCase()}
                  </Text>
                </View>
              )}
              <View style={styles.rideContainer}>
                <Text style={[styles.userName, { color: colors.text }]}>
                  {ride?.rider?.name}
                </Text>
                <View
                  style={[
                    styles.starContainer,
                    {
                      flexDirection: viewRtlStyle,
                      left: rtl ? windowHeight(4) : windowHeight(0.5),
                    },
                  ]}
                >
                  {Array.from({ length: 5 }).map((_, index) => {
                    const fullStarThreshold = index + 1
                    const halfStarThreshold = index + 0.5
                    if (ride?.rider?.rating_count >= fullStarThreshold) {
                      return <Icons.RatingStar key={index} />
                    } else if (ride?.rider?.rating_count >= halfStarThreshold) {
                      return <Icons.RatingHalfStar key={index} />
                    } else {
                      return <Icons.RatingEmptyStar key={index} />
                    }
                  })}
                  <Text
                    style={[
                      styles.text1,
                      {
                        color: isDark ? appColors.white : appColors.primaryFont,
                        left: windowWidth(1),
                      },
                    ]}
                  >
                    {ride?.rider?.rating_count}
                  </Text>
                  <Text
                    style={[
                      styles.text1,
                      {
                        color: isDark ? appColors.white : appColors.secondaryFont,
                        left: windowWidth(2),
                      },
                    ]}
                  >
                    ({ride?.rider?.reviews_count})
                  </Text>
                  {ride?.rider?.reviews_count > 0 && (
                    <>
                      <Text
                        style={[
                          styles.text1,
                          {
                            color: isDark
                              ? appColors.white
                              : appColors.secondaryFont,
                            left: windowWidth(2),
                          },
                        ]}
                      >
                        (
                      </Text>
                      <Text
                        style={[
                          styles.text1,
                          {
                            color: isDark
                              ? appColors.white
                              : appColors.secondaryFont,
                            left: windowWidth(2),
                          },
                        ]}
                      >
                        {ride?.rider?.reviews_count})
                      </Text>
                    </>
                  )}
                </View>
              </View>
            </View>
            <View style={styles.rate}>
              <Text style={styles.price}>
                {zoneValue?.currency_symbol}
                {ride?.total}
              </Text>
              <Text style={{ color: appColors.primaryFont, fontFamily: appFonts.medium }}>{parseFloat(ride?.distance).toFixed(1)} {ride?.distance_unit}</Text>
            </View>
          </View>
          <View
            style={{
              flexDirection: viewRtlStyle,
              justifyContent: 'space-between',
            }}
          >
            {ride?.service_category?.service_category_type === 'rental' ? (
              <View
                style={[styles.distanceValue, { flexDirection: viewRtlStyle }]}
              >
                <Icons.DayCalander color={colors.text} />
                <Text style={[styles.distance, { color: colors.text }]}>
                  {' '}
                  {ride?.no_of_days} {translateData.days}
                </Text>
              </View>
            ) : (
              <></>
            )}
          </View>
          {ride?.service_category?.service_category_type === 'schedule' && (
            <View
              style={[
                styles.scheduleContainer,
                {
                  flexDirection: viewRtlStyle,
                },
              ]}
            >
              <View style={styles.containerSchedule}>
                <Text style={styles.startDateText}>
                  {translateData.startDate}
                </Text>
                <View
                  style={[styles.calanderSmall, { flexDirection: viewRtlStyle }]}
                >
                  <CalanderSmall />
                  <Text style={styles.formattedDateText}>
                    {' '}
                    {formattedDate.date}
                  </Text>
                </View>
              </View>
              <View
                style={[styles.startContainer, { borderColor: colors.border }]}
              />
              <View style={styles.containerSchedule}>
                <Text style={styles.startTime}>{translateData.startTime}</Text>
                <View
                  style={[styles.scheduleClock, { flexDirection: viewRtlStyle }]}
                >
                  <Clock />
                  <Text style={styles.formattedDateText}>
                    {' '}
                    {formattedDate.time}
                  </Text>
                </View>
              </View>
            </View>
          )}
          {ride?.service_category?.service_category_type === 'rental' && (
            <>
              <View
                style={[styles.rentalContainer, { flexDirection: viewRtlStyle }]}
              >
                <View style={styles.containerSchedule}>
                  <Text style={styles.startTime}>{translateData.startDate}</Text>
                  <View
                    style={[
                      styles.scheduleClock,
                      { flexDirection: viewRtlStyle },
                    ]}
                  >
                    <CalanderSmall />
                    <Text style={styles.formattedDateText}>
                      {' '}
                      {formattedDate1}
                    </Text>
                  </View>
                </View>
                <View
                  style={[styles.rentalBorder, { borderColor: colors.border }]}
                />
                <View style={styles.containerSchedule}>
                  <Text style={styles.startTime}>{translateData.startTime}</Text>
                  <View
                    style={[
                      styles.scheduleClock,
                      { flexDirection: viewRtlStyle },
                    ]}
                  >
                    <Clock />
                    <Text style={styles.formattedDateText}>
                      {' '}
                      {formattedTime1}
                    </Text>
                  </View>
                </View>
              </View>
              <View
                style={[
                  styles.rentalDateContainer,
                  {
                    flexDirection: viewRtlStyle,
                  },
                ]}
              >
                <View style={styles.containerSchedule}>
                  <Text style={styles.startTime}>{translateData.endDate}</Text>
                  <View
                    style={[
                      styles.scheduleClock,
                      { flexDirection: viewRtlStyle },
                    ]}
                  >
                    <CalanderSmall />
                    <Text style={styles.formattedDateText}>
                      {' '}
                      {formattedDate2}
                    </Text>
                  </View>
                </View>
                <View
                  style={[styles.rentalBorder, { borderColor: colors.border }]}
                />
                <View style={styles.containerSchedule}>
                  <Text style={styles.startTime}>{translateData.endTime}</Text>
                  <View
                    style={[
                      styles.scheduleClock,
                      { flexDirection: viewRtlStyle },
                    ]}
                  >
                    <Clock />
                    <Text style={styles.formattedDateText}>
                      {' '}
                      {formattedTime1}
                    </Text>
                  </View>
                </View>
              </View>
            </>
          )}
          <View
            style={[styles.mainContainer, { flexDirection: viewRtlStyle }]}
          >
            <View>
              <Icons.location color={colors.text} />
              {ride?.service?.service_type !== 'ambulance' && (
                <>
                  <View
                    style={[
                      styles.verticaldot,
                      {
                        borderColor: appColors.darkBorderBlack, height: windowHeight(5.5),
                      },
                    ]}
                  />
                  <View style={styles.gps}>
                    <Icons.gps color={colors.text} />
                  </View>
                </>
              )}
            </View>
            <View>
              {ride?.service?.service_type !== 'ambulance' && (
                <>
                  <Text
                    style={[
                      styles.pickup,
                      { color: colors.text, textAlign: textRtlStyle },
                    ]}
                  >
                    {ride?.locations[0]}
                  </Text>
                  <Text style={[styles.distance, { color: appColors.secondaryFont, marginTop: windowHeight(1), marginHorizontal: windowWidth(1) }]}>
                    {' '}
                    {distance} {translateData.away}
                  </Text>
                  <View style={styles.borderContainer}>
                    <View
                      style={[styles.border, { borderColor: colors.border, marginVertical: 0, marginTop: windowHeight(0.5), marginBottom: windowHeight(1) }]}
                    />
                  </View>
                </>
              )}
              <Text
                style={[
                  styles.drop,
                  { color: colors.text, textAlign: textRtlStyle },
                ]}
              >
                {ride?.locations[ride?.locations.length - 1]}
              </Text>
            </View>
          </View>
        </View>
        {taxidoSettingData?.taxido_values?.activation?.bidding == 1 && (
          <Text style={{ textAlign: 'center', color: appColors.primary, fontFamily: appFonts.medium, textDecorationLine: 'underline' }}>{translateData.viewDetails}</Text>
        )}
      </View>
      <View
        style={[
          styles.bottom,
          styles.alignment,

        ]}
      >
        {ride?.service?.service_type !== 'ambulance' && (
          <>
            {ride?.service?.service_type === 'cab' &&
              (ride?.service_category?.service_category_type === 'ride' ||
                ride?.service_category?.service_category_type ===
                'intervirt') &&
              taxidoSettingData?.taxido_values?.activation?.bidding == 0 && (
                <View style={{ flexDirection: 'row', justifyContent: 'space-between' }}>
                  <View style={{ width: '65%', left: windowWidth(6) }}>
                    <CustomSlider buttonText='Accept' buttonWidth={windowWidth(68)} sliderSize={windowHeight(5)} buttonHeight={windowHeight(6.2)} leftPadding={windowWidth(1)} rightPadding={windowWidth(2.5)} onSwipeSuccess={() => {
                      acceptRide(ride?.id)
                    }} />
                  </View>
                  <TouchableOpacity
                    style={[
                      styles.acceptContainer,
                      { width: '16%', marginBottom: windowHeight(1.5), backgroundColor: appColors.alertRed },
                    ]}
                    activeOpacity={0.7}
                    onPress={() => {
                      declineRide(ride?.id)
                    }}
                  >
                    <Text style={styles.acceptText}><Icons.Cancel /></Text>
                  </TouchableOpacity>
                </View>
              )}
          </>
        )}
      </View>
      {
        (ride?.service?.service_type === 'freight' ||
          ride?.service?.service_type === 'parcel' ||
          ride?.service_category?.service_category_type === 'schedule' ||
          ride?.service_category?.service_category_type === 'package') && (
          <>
            {taxidoSettingData?.taxido_values?.activation?.bidding == 1 ? (
              <TouchableOpacity
                activeOpacity={0.7}
                style={[
                  styles.rentalInfoContainer,
                  {
                    backgroundColor: isDark
                      ? colors.background
                      : appColors.graybackground,
                  },
                ]}
                onPress={() => gotoInfo(ride)}
              >
                <Text style={styles.moreInfo}>{translateData.moreInfo}</Text>
              </TouchableOpacity>
            ) : taxidoSettingData?.taxido_values?.activation?.bidding == 0 ? (
              <View style={{ flexDirection: 'row', justifyContent: 'space-between' }}>
                <View style={{ width: '65%', left: windowWidth(6) }}>
                  <CustomSlider buttonText='Accept' buttonWidth={windowWidth(68)} sliderSize={windowHeight(5)} buttonHeight={windowHeight(6.2)} leftPadding={windowWidth(1)} rightPadding={windowWidth(2.5)} onSwipeSuccess={() => { acceptRide(ride.id) }} />
                </View>
                <TouchableOpacity
                  style={[
                    styles.acceptContainer,
                    { width: '16%', marginBottom: windowHeight(1.5), backgroundColor: appColors.alertRed },
                  ]}
                  activeOpacity={0.7}
                  onPress={() => gotoInfo(ride)}
                >
                  <Text style={styles.acceptText}>!</Text>
                </TouchableOpacity>
              </View>
            ) : null}
          </>
        )
      }
      {
        ride?.service_category?.service_category_type === 'rental' && (
          <View style={{ flexDirection: 'row', justifyContent: 'space-between' }}>
            <View style={{ width: '65%', left: windowWidth(6) }}>
              <CustomSlider buttonText='Accept' buttonWidth={windowWidth(68)} sliderSize={windowHeight(5)} buttonHeight={windowHeight(6.2)} leftPadding={windowWidth(1)} rightPadding={windowWidth(2.5)} onSwipeSuccess={() => {
                if (ride.is_with_driver == 1) {
                  selectDriver(ride);
                } else {
                  acceptRide(ride?.id)
                }
              }} />
            </View>
            <TouchableOpacity
              style={[
                styles.acceptContainer,
                { width: '16%', marginBottom: windowHeight(1.5), backgroundColor: appColors.alertRed },
              ]}
              activeOpacity={0.7}
              onPress={() => gotoInfo(ride)}
            >
              <Text style={styles.acceptText}>!</Text>
            </TouchableOpacity>
          </View>
        )
      }
      {
        ride?.service?.service_type === 'ambulance' && (
          <TouchableOpacity
            style={[
              styles.acceptContainer,
              { width: '100%', marginTop: windowHeight(1) },
            ]}
            activeOpacity={0.7}
            onPress={() => acceptAmbulance(ride?.id)}
          >
            <Text style={styles.acceptText}>{translateData.accept}</Text>
          </TouchableOpacity>
        )
      }
    </TouchableOpacity >
  )
});
