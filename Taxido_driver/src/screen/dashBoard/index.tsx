import React from 'react'
import { View, Text, StyleSheet, TouchableOpacity, Image, ScrollView } from 'react-native'
import appColors from '../../theme/appColors'
import { fontSizes, windowHeight, windowWidth } from '../../theme/appConstant'
import appFonts from '../../theme/appFonts'
import Icons from '../../utils/icons/icons'
import Svg, { G, Circle } from 'react-native-svg'
import Images from '../../utils/images/images'
import { useSelector } from 'react-redux'
import { useNavigation } from '@react-navigation/native'
import { useValues } from '../../utils/context'

export function DashBoard() {
  const { dashBoardList } = useSelector((state) => state.dashboard);
  const size = windowHeight(20)
  const strokeWidth = windowHeight(2)
  const radius = (size - strokeWidth) / 2
  const cx = size / 2
  const cy = size / 2
  const total = dashBoardList?.ride?.completed_rides + dashBoardList?.ride?.pending_rides + dashBoardList?.ride?.cancelled_rides
  const { navigate } = useNavigation()
  const { isDark } = useValues()
  const { translateData } = useSelector(state => state.setting)

  const data = [
    { value: dashBoardList?.ride?.completed_rides, color: appColors.primary, label: translateData.completed },
    { value: dashBoardList?.ride?.pending_rides, color: '#BADFD6', label: translateData.pendingRide },
    { value: dashBoardList?.ride?.cancelled_rides, color: '#E8F4F1', label: translateData.cancelled },
  ]

  let startAngle = -90

  const gotoDetails = () => {
    navigate('TotalEarnings')
  }

  return (
    <ScrollView
      vertical
      showsVerticalScrollIndicator={false}
      style={{ marginBottom: windowHeight(8), backgroundColor: isDark ? appColors.bgDark : appColors.graybackground, flex: 1 }}
    >
      <View>
        <View
          style={{ backgroundColor: isDark ? appColors.darkThemeSub : appColors.white, height: windowHeight(10) }}
        >
          <View
            style={{
              flexDirection: 'row',
              justifyContent: 'space-between',
              paddingHorizontal: windowHeight(3),
              marginTop: windowHeight(2),
              alignItems: 'center',
            }}
          >
            <Text
              style={{
                color: isDark ? appColors.white : appColors.primaryFont,
                fontFamily: appFonts.medium,
                fontSize: fontSizes.FONT5,
              }}
            >
              {translateData.dashboard}
            </Text>
            <TouchableOpacity onPress={() => navigate('Notification')}
              style={{
                backgroundColor: isDark ? appColors.darkThemeSub : appColors.white,
                borderColor: isDark ? appColors.darkBorderBlack : appColors.border,
                borderWidth: windowHeight(0.1),
                elevation: 2,
                width: windowHeight(5.5),
                height: windowHeight(5.5),
                borderRadius: windowHeight(3),
                alignItems: 'center',
                justifyContent: 'center',
              }}
            >
              <Icons.Notification color={isDark ? appColors.white : appColors.black} />
            </TouchableOpacity>
          </View>
        </View>

        <View style={[styles.chartContainer, { backgroundColor: isDark ? appColors.darkThemeSub : appColors.white }, { borderColor: isDark ? appColors.darkBorderBlack : appColors.border }]}>
          <View style={{ marginTop: windowHeight(3) }}>
            <Svg width={size} height={size}>
              <G rotation="0" origin={`${cx}, ${cy}`}>
                {data.map((item, index) => {
                  const angle = (item.value / total) * 360
                  const strokeLength = (angle / 360) * 2 * Math.PI * radius
                  const strokeDasharray = `${strokeLength} ${2 * Math.PI * radius
                    }`
                  const circle = (
                    <Circle
                      key={index}
                      cx={cx}
                      cy={cy}
                      r={radius}
                      stroke={item.color}
                      strokeWidth={strokeWidth}
                      fill="none"
                      strokeDasharray={strokeDasharray}
                      strokeLinecap="round"
                      rotation={startAngle}
                      origin={`${cx}, ${cy}`}
                    />
                  )
                  startAngle += angle + 4
                  return circle
                })}
              </G>
            </Svg>
          </View>

          <View style={styles.centerText}>
            <Text style={[styles.title, { color: isDark ? appColors.white : appColors.black }]}>{translateData.totalBooking}</Text>
            <Text style={styles.count}>{total}</Text>
          </View>

          <View style={[styles.statusContainer, { backgroundColor: isDark ? appColors.darkThemeSub : appColors.white }]}>
            {data.map((item, index) => (
              <View style={styles.statusBox} key={index}>
                <View style={styles.statusTop}>
                  <View
                    style={[styles.statusDot, { backgroundColor: item.color }]}
                  />
                  <Text style={[styles.statusLabel, { color: isDark ? appColors.darkText : appColors.iconColor }]}>{item.label}</Text>
                </View>
                <Text style={[styles.statusValue, { color: isDark ? appColors.white : appColors.black }]}>{item.value}</Text>
              </View>
            ))}
          </View>
        </View>
        <View
          style={{
            height: windowHeight(80),
            marginTop: windowHeight(3),
            backgroundColor: isDark ? appColors.bgDark : appColors.white
          }}
        >
          <TouchableOpacity
            style={{
              backgroundColor: isDark ? appColors.darkThemeSub : appColors.white,
              borderColor: isDark ? appColors.darkBorderBlack : appColors.border,
              borderWidth: windowHeight(0.1),
              height: windowHeight(12),
              width: '91%',
              alignSelf: 'center',
              marginTop: windowHeight(2.8),
              borderRadius: windowHeight(0.8),
              flexDirection: 'row',
              alignItems: 'center',
              justifyContent: 'space-between',
              paddingHorizontal: windowHeight(2),
            }}
            onPress={gotoDetails}
          >
            <View
              style={{
                backgroundColor: '#FCF9EA',
                width: windowHeight(8),
                height: windowHeight(8),
                borderRadius: windowHeight(0.8),
                alignItems: 'center',
                justifyContent: 'center',
              }}
            >
              <Image
                source={Images.mapFrame}
                resizeMode="contain"
                style={{
                  height: windowHeight(4),
                  width: windowHeight(4),
                }}
              />
            </View>

            <View style={{ flex: 1, marginLeft: windowHeight(2) }}>
              <Text
                style={{
                  color: isDark ? appColors.white : appColors.black,
                  fontSize: fontSizes.FONT4,
                  fontFamily: appFonts.medium,
                }}
              >
                Total Earnings
              </Text>
              <Text
                style={{
                  color: '#ECB238',
                  fontSize: fontSizes.FONT4HALF,
                  fontFamily: appFonts.bold,
                  marginTop: windowHeight(0.5),
                }}
              >
                {dashBoardList?.ride?.currency_symbol}{dashBoardList?.ride?.total_earnings}
              </Text>
            </View>

            <Icons.LeftArrow color={isDark ? appColors.darkText : appColors.primaryFont} />
          </TouchableOpacity>

          <Text
            style={{
              color: isDark ? appColors.white : appColors.black,
              marginHorizontal: windowWidth(5),
              marginTop: windowHeight(2.5),
              fontFamily: appFonts.medium,
              fontSize: fontSizes.FONT4,
            }}
          >
            {translateData.drivePerformance}
          </Text>
          <View
            style={{
              flexDirection: 'row',
              justifyContent: 'space-between',
              gap: 5,
            }}
          >
            <View
              style={{
                height: windowHeight(21),
                width: windowHeight(20),
                borderColor: isDark ? appColors.darkBorderBlack : appColors.border,
                borderWidth: windowHeight(0.1),
                marginHorizontal: windowHeight(2.5),
                borderRadius: windowHeight(0.8),
                marginTop: windowHeight(2),
              }}
            >
              <View style={{ flexDirection: 'row' }}>
                <View
                  style={{
                    backgroundColor: '#F1F7FE',
                    height: windowHeight(6),
                    width: windowHeight(6),
                    borderRadius: windowHeight(0.7),
                    marginTop: windowHeight(2),
                    marginHorizontal: windowHeight(2),
                    alignItems: 'center',
                    justifyContent: 'center',
                  }}
                >
                  <Image
                    source={Images.mapFrame1}
                    resizeMode="contain"
                    style={{
                      height: windowHeight(4),
                      width: windowHeight(3),
                    }}
                  />
                </View>
                <View>
                  <Text
                    style={{
                      color: '#47A1E5',
                      top: windowHeight(2),
                      fontFamily: appFonts.bold,
                      fontSize: fontSizes.FONT5,
                      textAlign: 'center'
                    }}
                  >
                    {dashBoardList?.driver_performance?.total_distance}
                  </Text>
                  <Text
                    style={{
                      color: '#47A1E5',
                      top: windowHeight(2),
                      fontFamily: appFonts.bold,
                      fontSize: fontSizes.FONT5,
                      textAlign: 'center'
                    }}
                  >
                    {dashBoardList?.driver_performance?.unit}
                  </Text>
                </View>
              </View>
              <Text
                style={{
                  color: isDark ? appColors.white : appColors.black,
                  marginHorizontal: windowHeight(2),
                  marginTop: windowHeight(1.7),
                  fontFamily: appFonts.medium,
                }}
              >
                {translateData.totalDistances}
              </Text>
              <Image
                source={Images.mapFrame2}
                resizeMode="contain"
                style={{
                  height: windowHeight(10),
                  width: windowHeight(21),
                  alignSelf: 'center',
                }}
              />
            </View>
            <View
              style={{
                height: windowHeight(21),
                width: windowHeight(20),
                borderColor: isDark ? appColors.darkBorderBlack : appColors.border,
                borderWidth: windowHeight(0.1),
                borderRadius: windowHeight(0.8),
                marginTop: windowHeight(2),
                right: windowHeight(2.5),
              }}
            >
              <View style={{ flexDirection: 'row' }}>
                <View
                  style={{
                    backgroundColor: '#FFF4F1',
                    height: windowHeight(6),
                    width: windowHeight(6),
                    borderRadius: windowHeight(0.7),
                    marginTop: windowHeight(2),
                    marginHorizontal: windowHeight(2),
                    alignItems: 'center',
                    justifyContent: 'center',
                  }}
                >
                  <Image
                    source={Images.mapFrame3}
                    resizeMode="contain"
                    style={{
                      height: windowHeight(4),
                      width: windowHeight(3),
                    }}
                  />
                </View>
                <Text
                  style={{
                    color: '#FF8367',
                    top: windowHeight(3.5),
                    fontFamily: appFonts.bold,
                    fontSize: fontSizes.FONT5,
                  }}
                >
                  {dashBoardList?.driver_performance?.total_hours}h
                </Text>
              </View>
              <Text
                style={{
                  color: isDark ? appColors.white : appColors.black,
                  marginHorizontal: windowHeight(2),
                  marginTop: windowHeight(1.7),
                  fontFamily: appFonts.medium,
                }}
              >
                {translateData.totalHours}
              </Text>
              <Image
                source={Images.mapFrame4}
                resizeMode="contain"
                style={{
                  height: windowHeight(10),
                  width: windowHeight(21),
                  alignSelf: 'center',
                }}
              />
            </View>
          </View>

          <Text
            style={{
              color: isDark ? appColors.white : appColors.black,
              marginHorizontal: windowWidth(5),
              marginTop: windowHeight(2.5),
              fontFamily: appFonts.medium,
              fontSize: fontSizes.FONT4,
            }}
          >
            {translateData.averageDrivePerformance}
          </Text>
          <View
            style={{
              flexDirection: 'row',
              justifyContent: 'space-between',
              gap: 5,
            }}
          >
            <View
              style={{
                height: windowHeight(26),
                width: windowHeight(20),
                borderColor: isDark ? appColors.darkBorderBlack : appColors.border,
                borderWidth: windowHeight(0.1),
                marginHorizontal: windowHeight(2.5),
                borderRadius: windowHeight(0.8),
                marginTop: windowHeight(2),
              }}
            >
              <View style={{ flexDirection: 'row' }}>
                <View
                  style={{
                    backgroundColor: '#EEFBF6',
                    height: windowHeight(6),
                    width: windowHeight(6),
                    borderRadius: windowHeight(0.7),
                    marginTop: windowHeight(2),
                    marginHorizontal: windowHeight(2),
                    alignItems: 'center',
                    justifyContent: 'center',
                  }}
                >
                  <Image
                    source={Images.mapFrame5}
                    resizeMode="contain"
                    style={{
                      height: windowHeight(4),
                      width: windowHeight(3),
                    }}
                  />
                </View>
                <View>
                  <Text
                    style={{
                      color: appColors.primary,
                      top: windowHeight(2),
                      fontFamily: appFonts.bold,
                      fontSize: fontSizes.FONT5,
                      textAlign: 'center'
                    }}
                  >
                    {dashBoardList?.driver_performance?.average_distance}
                  </Text>
                  <Text
                    style={{
                      color: appColors.primary,
                      top: windowHeight(2),
                      fontFamily: appFonts.bold,
                      fontSize: fontSizes.FONT5,
                      textAlign: 'center'
                    }}
                  >
                    {dashBoardList?.driver_performance?.unit}
                  </Text>
                </View>
              </View>
              <Text
                style={{
                  color: isDark ? appColors.white : appColors.black,
                  marginHorizontal: windowHeight(2),
                  marginTop: windowHeight(1.7),
                  fontFamily: appFonts.medium,
                }}
              >
                {translateData.averageDistances}
              </Text>
              <Image
                source={Images.mapFrame6}
                style={{
                  height: windowHeight(12.4),
                  width: windowHeight(21),
                  alignSelf: 'center',
                  marginTop: windowHeight(1.8),
                }}
              />
            </View>
            <View
              style={{
                height: windowHeight(26),
                width: windowHeight(20),
                borderColor: isDark ? appColors.darkBorderBlack : appColors.border,
                borderWidth: windowHeight(0.1),
                borderRadius: windowHeight(0.8),
                marginTop: windowHeight(2),
                right: windowHeight(2.5),
              }}
            >
              <View style={{ flexDirection: 'row' }}>
                <View
                  style={{
                    backgroundColor: '#F8F8F8',
                    height: windowHeight(6),
                    width: windowHeight(6),
                    borderRadius: windowHeight(0.7),
                    marginTop: windowHeight(2),
                    marginHorizontal: windowHeight(2),
                    alignItems: 'center',
                    justifyContent: 'center',
                  }}
                >
                  <Image
                    source={Images.mapFrame8}
                    resizeMode="contain"
                    style={{
                      height: windowHeight(4),
                      width: windowHeight(3),
                    }}
                  />
                </View>
                <Text
                  style={{
                    color: '#86909C',
                    top: windowHeight(3.5),
                    fontFamily: appFonts.bold,
                    fontSize: fontSizes.FONT5,
                  }}
                >
                  {dashBoardList?.driver_performance?.average_hours}
                </Text>
              </View>
              <Text
                style={{
                  color: isDark ? appColors.white : appColors.black,
                  marginHorizontal: windowHeight(2),
                  marginTop: windowHeight(1.7),
                  fontFamily: appFonts.medium,
                }}
              >
                {translateData.averageHours}{' '}
              </Text>
              <Image
                source={Images.mapFrame7}
                style={{
                  height: windowHeight(10),
                  width: windowHeight(20),
                  alignSelf: 'center',
                  top: windowHeight(3),
                }}
              />
            </View>
          </View>
        </View>
      </View>
    </ScrollView>
  )
}

const styles = StyleSheet.create({
  chartContainer: {
    alignItems: 'center',
    marginTop: windowHeight(2.6),
    marginHorizontal: windowHeight(2.5),
    borderRadius: windowHeight(0.8),
    paddingBottom: windowHeight(2.3),
    borderWidth: windowHeight(0.1)
  },
  centerText: {
    position: 'absolute',
    top: '34%',
    alignItems: 'center',
  },
  title: {
    fontSize: fontSizes.FONT3HALF,
    color: appColors.black,
    fontFamily: appFonts.medium,
  },
  count: {
    fontSize: fontSizes.FONT4HALF,
    fontFamily: appFonts.bold,
    color: appColors.primary,
    top: '15%',
  },

  legendValue: {
    fontWeight: 'bold',
  },
  statusContainer: {
    flexDirection: 'row',
    justifyContent: 'space-around',
    marginTop: windowHeight(4),
    width: '100%',
    backgroundColor: appColors.white,
  },
  statusBox: {
    alignItems: 'center',
  },
  statusTop: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 4,
  },
  statusDot: {
    width: windowHeight(1.6),
    height: windowHeight(0.6),
    borderRadius: 4,
    marginRight: 6,
  },
  statusLabel: {
    fontSize: fontSizes.FONT3HALF,
    color: appColors.iconColor,
    fontFamily: appFonts.regular,
  },
  statusValue: {
    fontSize: fontSizes.FONT3HALF,
    fontFamily: appFonts.regular,
    color: appColors.black,

    left: windowWidth(2.8),
  },
})
