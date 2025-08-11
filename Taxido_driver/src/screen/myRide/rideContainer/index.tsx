import { FlatList, Image, Text, TouchableOpacity, View, ActivityIndicator, Linking } from 'react-native'
import React, { useState } from 'react'
import Images from '../../../utils/images/images'
import { styles } from './style'
import { LineContainer, LocationDetails } from '../../../commonComponents'
import { useValues } from '../../../utils/context'
import Icons from '../../../utils/icons/icons'
import { useSelector } from 'react-redux'
import { useTheme } from '@react-navigation/native'
import appColors from '../../../theme/appColors'
import appFonts from '../../../theme/appFonts'
import { LoaderRide } from './loaderRide'
import { fontSizes, windowHeight, windowWidth } from '../../../theme/appConstant'
import { apiformatDates } from '../../../utils/functions'
import { useAppNavigation } from '../../../utils/navigation'

export default function RideContainer({ status }) {
  const { navigate } = useAppNavigation()
  const { viewRtlStyle, textRtlStyle, isDark } = useValues()
  const { colors } = useTheme()
  const { rideGets } = useSelector(state => state.ride)
  const { allVehicle } = useSelector(state => state.vehicleType)
  const { translateData } = useSelector(state => state.setting)
  const [page, setPage] = useState(1)
  const [loading, setLoading] = useState(false)
  const [hasMoreData, setHasMoreData] = useState(true)
  const { zoneValue } = useSelector(state => state.zoneUpdate)
  const acceptedRides = rideGets?.data?.filter(ride => {
    const rideStatus = ride?.ride_status?.slug?.toLowerCase()
    const categorySlug = ride?.service_category?.name?.toLowerCase()
    const currentStatus = status?.toLowerCase()?.trim()
    if (!rideStatus) return false
    if (currentStatus === 'schedule') {
      return categorySlug === 'schedule' && rideStatus !== 'cancelled'
    }
    if (currentStatus === 'accepted') {
      return (
        categorySlug !== 'schedule' &&
        rideStatus !== 'completed' &&
        rideStatus !== 'cancelled'
      )
    }
    return rideStatus === currentStatus
  })

  const statusMapping = {
    accepted: {
      text: 'Pending',
      color: appColors.completeColor,
    },
    started: {
      text: 'Active',
      color: appColors.activeColor,
    },
    schedule: {
      text: 'Scheduled',
      color: appColors.scheduleColor,
    },
    cancelled: {
      text: 'Cancel',
      color: appColors.alertRed,
    },
    completed: {
      text: 'Completed',
      color: appColors.primary,
    },
  }
  const paginatedData = acceptedRides?.slice(0, page * 5) || []

  const gotoMessage = item => {
    navigate('Chat', {
      driverId: item?.driver?.id,
      riderId: item?.rider?.id,
      rideId: item?.id,
      riderName: item?.rider?.name,
      riderImage: item?.rider?.profile_image?.original_url,
    })
  }

  const gotoCall = item => {
    const phoneNumber = item?.driver?.phone
    Linking.openURL(`tel:${phoneNumber}`)
  }

  const loadMoreData = () => {
    if (!loading && hasMoreData) {
      setLoading(true)
      setTimeout(() => {
        if (paginatedData.length < acceptedRides?.length) {
          setPage(prevPage => prevPage + 1)
        } else {
          setHasMoreData(false)
        }
        setLoading(false)
      }, 1000)
    }
  }

  const handlePress = (selectedItem, vehicleData) => {
    let rideStatus = statusMapping[selectedItem.ride_status.slug]?.text

    navigate('PendingDetails', {
      item: selectedItem,
      vehicleDetail: vehicleData,
      rideStatus: rideStatus,
    })
  }

  const renderItem = ({ item }) => {

    const { vehicle_type_id } = item.vehicle_type_id || {}

    const vehicleData = Array.isArray(allVehicle)
      ? allVehicle.find(vehicle => vehicle?.id == vehicle_type_id)
      : undefined

    const formattedDate = apiformatDates(item.created_at)
    const hasProfileImage = !!item?.rider?.driver_profile_image_url

    return (
      <View style={[styles.container]}>
        <TouchableOpacity
          onPress={() => handlePress(item, vehicleData)}
          activeOpacity={0.7}
        >
          <View
            style={[
              styles.rideInfoContainer,
              {
                backgroundColor: isDark ? colors.card : appColors.white,
                borderColor: colors.border,
              },
            ]}
          >
            <View
              style={[
                styles.profileInfoContainer,
                { flexDirection: viewRtlStyle },
              ]}
            >
              {hasProfileImage ? (
                <Image
                  style={styles.profileImage}
                  source={{ uri: item.rider.driver_profile_image_url }}
                />
              ) : (
                <View
                  style={{
                    width: windowWidth(12),
                    height: windowWidth(12),
                    borderRadius: windowHeight(10),
                    backgroundColor: appColors.primary,
                    justifyContent: 'center',
                    alignItems: 'center',
                  }}
                >
                  <Text
                    style={{
                      fontSize: fontSizes.FONT4HALF,
                      fontFamily: appFonts.bold,
                      color: appColors.white,
                    }}
                  >
                    {item?.rider?.name?.charAt(0)?.toUpperCase() || 'D'}
                  </Text>
                </View>
              )}

              <View style={styles.profileTextContainer}>
                <Text
                  style={[
                    styles.profileName,
                    { color: isDark ? appColors.white : appColors.primaryFont },
                    { textAlign: textRtlStyle },
                  ]}
                >
                  {item?.rider?.name}
                </Text>
                <View
                  style={[
                    styles.carInfoContainer,
                    { flexDirection: viewRtlStyle },
                  ]}
                >
                  {Array.from({ length: 5 }).map((_, index) => {
                    const fullStarThreshold = index + 1
                    const halfStarThreshold = index + 0.5
                    if (item?.driver?.rating_count >= fullStarThreshold) {
                      return <Icons.RatingStar key={index} />
                    } else if (item?.rider?.rating_count >= halfStarThreshold) {
                      return <Icons.RatingHalfStar key={index} />
                    } else {
                      return <Icons.RatingEmptyStar key={index} />
                    }
                  })}
                  <View
                    style={[
                      styles.ratingContainer,
                      {
                        flexDirection: viewRtlStyle,
                        marginHorizontal: windowWidth(1.8),
                      },
                    ]}
                  >
                    <Text
                      style={[
                        styles.rating_count,
                        {
                          color: isDark
                            ? appColors.white
                            : appColors.primaryFont,
                        },
                      ]}
                    >
                      {Number(item?.driver?.rating_count).toFixed(1)}
                    </Text>
                    <Text style={styles.reviews_count}>
                      ({item?.driver?.review_count})
                    </Text>
                  </View>
                </View>
              </View>
              {item?.ride_status?.slug === 'accepted' &&
                item?.ride_status?.slug === 'pending' &&
                item?.ride_status?.slug === 'schedule' && (
                  <View
                    style={[
                      styles.acceptedContainer,
                      {
                        flexDirection: viewRtlStyle,
                      },
                    ]}
                  >
                    <TouchableOpacity
                      activeOpacity={0.7}
                      style={[
                        styles.callContainer,
                        {
                          borderColor: colors.border,
                        },
                      ]}
                      onPress={() => gotoMessage(item)}
                    >
                      <Icons.Message color={appColors.primary} />
                    </TouchableOpacity>
                    <TouchableOpacity
                      activeOpacity={0.7}
                      style={[
                        styles.callContainer,
                        {
                          borderColor: colors.border,
                        },
                      ]}
                      onPress={() => gotoCall(item)}
                    >
                      <Icons.Call color={appColors.primary} />
                    </TouchableOpacity>
                  </View>
                )}
              {item?.ride_status?.slug !== 'completed' &&
                item?.ride_status?.slug !== 'cancelled' && (
                  <View
                    style={[
                      styles.acceptedContainer,
                      {
                        flexDirection: viewRtlStyle,
                      },
                    ]}
                  >
                    <TouchableOpacity
                      activeOpacity={0.7}
                      style={[
                        styles.callContainer,
                        {
                          borderColor: colors.border,
                        },
                      ]}
                      onPress={() => gotoMessage(item)}
                    >
                      <Icons.Message color={appColors.primary} />
                    </TouchableOpacity>
                    <TouchableOpacity
                      activeOpacity={0.7}
                      style={[
                        styles.callContainer,
                        {
                          borderColor: colors.border,
                        },
                      ]}
                      onPress={() => gotoCall(item)}
                    >
                      <Icons.Call color={appColors.primary} />
                    </TouchableOpacity>
                  </View>
                )}
            </View>
            <View
              style={[styles.containerService, { flexDirection: viewRtlStyle }]}
            >
              <View style={styles.serviceContainer}>
                <Text style={styles.serviceName}>{item?.service?.name}</Text>
              </View>

              {item?.service?.service_type !== 'ambulance' && (
                <View style={styles.service_category_Container}>
                  <Text
                    style={{
                      color: appColors.darkPurpal,
                      fontFamily: appFonts.regular,
                    }}
                  >
                    {item?.service_category?.name}
                  </Text>
                </View>
              )}
            </View>
            <View
              style={[
                styles.dashedLine,
                {
                  borderColor: colors.border,
                },
              ]}
            />
            <View style={{ flexDirection: viewRtlStyle }}>
              <Image
                style={styles.tripImage}
                source={{ uri: item?.vehicle_type?.vehicle_image_url }}
              />
              <View style={styles.tripTextContainer}>
                <Text
                  style={[
                    styles.tripIDText,
                    {
                      color: isDark ? appColors.white : appColors.primaryFont,
                      textAlign: textRtlStyle,
                    },
                  ]}
                >
                  #{item?.ride_number}
                </Text>
                <Text
                  style={[styles.tripCostText, { textAlign: textRtlStyle }]}
                >
                  {zoneValue?.currency_symbol}
                  {item.total}
                </Text>
              </View>
              <View style={styles.iconContainer1}>
                <View
                  style={[
                    styles.containerIcon,
                    { flexDirection: viewRtlStyle },
                  ]}
                >
                  <View style={styles.calanderSmall}>
                    <Icons.CalanderSmall />
                  </View>
                  <Text style={styles.tripDateText}>{formattedDate.date}</Text>
                </View>
                <View
                  style={[
                    styles.containerIcon,
                    { flexDirection: viewRtlStyle },
                  ]}
                >
                  <View style={styles.clock}>
                    <Icons.Clock />
                  </View>
                  <Text style={styles.tripDateText}>{formattedDate.time}</Text>
                </View>
              </View>
            </View>
          </View>
          <LineContainer />
        </TouchableOpacity>
        <LocationDetails locationDetails={item.locations} />
      </View>
    )
  }

  return (
    <View style={styles.listContainer}>
      {loading && !acceptedRides?.length ? (
        <LoaderRide />
      ) : acceptedRides?.length === 0 ? (
        <View style={styles.noDataContainer}>
          <Image source={Images.noRides} style={styles.noDataImage} />
          <Text style={styles.noDataText}>{translateData.norideTitle}</Text>
          <Text style={styles.noDataDesc}>
            {translateData.norideDescription}
          </Text>
        </View>
      ) : (
        <>
          <FlatList
            data={paginatedData}
            scrollEnabled={true}
            keyExtractor={item => item.id.toString()}
            renderItem={renderItem}
            onEndReached={loadMoreData}
            onEndReachedThreshold={0.9}
            ListFooterComponent={
              loading && (
                <ActivityIndicator
                  size="large"
                  color={appColors.buttonBg}
                  style={{ marginTop: 10 }}
                />
              )
            }
          />
          <View style={styles.bottomView} />
        </>
      )}
    </View>
  )
}
