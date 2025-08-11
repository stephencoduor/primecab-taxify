import React, { useState } from 'react'
import { Image, ScrollView, StyleSheet, Text, TouchableOpacity, View } from 'react-native'
import {
  fontSizes,
  windowHeight,
  windowWidth,
} from '../../../theme/appConstant'
import appColors from '../../../theme/appColors'
import appFonts from '../../../theme/appFonts'
import Images from '../../../utils/images/images'
import Icons from '../../../utils/icons/icons'
import Svg, { Circle, G } from 'react-native-svg'

export function FleetDashBoard() {
  const size = windowHeight(20)
  const strokeWidth = windowHeight(2)
  const radius = (size - strokeWidth) / 2
  const cx = size / 2
  const cy = size / 2
  const total = 3100 + 500 + 2500

  const data = [
    { value: 3100, color: appColors.primary, label: 'Completed' },
    { value: 500, color: '#BADFD6', label: 'Pending' },
    { value: 2500, color: '#E8F4F1', label: 'Cancelled' },
  ]

  let startAngle = -90


  
const drivers = [
  {
    id: 1,
    name: 'Carlos Martinez',
    email: 'jonathanhiggins@gmail.com',
  
  },
  {
    id: 2,
    name: 'Carlos Martinez',
    email: 'jonathanhiggins@gmail.com',

  },
    {
    id: 3,
    name: 'Carlos Martinez',
    email: 'jonathanhiggins@gmail.com',
  
  },
  {
    id: 4,
    name: 'Carlos Martinez',
    email: 'jonathanhiggins@gmail.com',

  },
 
];

 const rating = 4.8;
  const reviews = 127;
  const [showAll, setShowAll] = useState(false);

const visibleDrivers = showAll ? drivers : drivers.slice(0, 3);

const DriverCard = ({ name, email, status, statusColor, bgColor }) => (
  <View
    style={{
      backgroundColor: appColors.white,
      borderWidth: windowHeight(0.1),
      borderColor: appColors.border,
      width: '89%',
      height: windowHeight(17),
      marginTop: windowHeight(2),
      alignSelf: 'center',
      borderRadius: windowHeight(0.9),
      bottom:windowHeight(2)
    }}
  >
    <View
      style={{
        flexDirection: 'row',
        marginTop: windowHeight(2),
        marginHorizontal: windowHeight(2),
      }}
    >
      <Image
        source={Images.user}
        resizeMode="contain"
        style={{ height: windowHeight(5), width: windowHeight(5) }}
      />
      <Text
        style={{
          color: appColors.black,
          fontFamily: appFonts.medium,
          fontSize: fontSizes.FONT3SMALL,
          marginHorizontal: windowHeight(1.4),
          marginTop: windowHeight(0.5),
        }}
      >
        {name}
      </Text>
    </View>

    <Text
      style={{
        color: appColors.iconColor,
        fontFamily: appFonts.medium,
        fontSize: fontSizes.FONT3SMALL,
        marginHorizontal: windowHeight(8.5),
        bottom: windowHeight(2.3),
      }}
    >
      {email}
    </Text>

    <View
      style={{
        borderWidth: windowHeight(0.1),
        borderColor: appColors.border,
        width: '90%',
        alignSelf: 'center',
      }}
    />

    <View
      style={{
        flexDirection: 'row',
        justifyContent: 'space-between',
        marginTop: windowHeight(1.8),
        marginHorizontal: windowWidth(4),
      }}
    >
      <View
      >
        <Text style={{color:appColors.iconColor,fontFamily: appFonts.regular,
            fontSize: fontSizes.FONT3HALF}}>Total Reviews:</Text>
      </View>

      <View
        style={{
          alignItems: 'flex-end',
          flexDirection: 'row',
          justifyContent: 'space-between',
          gap: 8,
        }}
      >
        <Text style={{color:appColors.iconColor,fontFamily: appFonts.regular,
            fontSize: fontSizes.FONT3HALF}}>Total Earnings:</Text>
      </View>
    </View>
    <View style={{flexDirection:'row',justifyContent:'space-between',paddingHorizontal:windowWidth(3.5),marginTop:windowHeight(0.4)}}>
  <View style={{ flexDirection: 'row', alignItems: 'center' }}>
      {Array.from({ length: 5 }).map((_, index) => {
        const full = index + 1 <= rating;
        const half = index + 0.5 <= rating && index + 1 > rating;

        if (full) {
          return <Icons.RatingStar key={index} />;
        } else if (half) {
          return <Icons.RatingHalfStar key={index} />;
        } else {
          return <Icons.RatingEmptyStar key={index} />;
        }
      })}
      <Text style={{ left: windowHeight(1) ,color:appColors.black,fontSize:fontSizes.FONT3,fontFamily:appFonts.regular}}>{rating}</Text>
            <Text style={{ marginHorizontal: windowHeight(1.5),color:appColors.iconColor,fontSize:fontSizes.FONT3,fontFamily:appFonts.regular }}>(127)</Text>

    </View>
    <Text style={{color:appColors.primary,fontFamily:appFonts.bold,fontSize:fontSizes.FONT4}}>$1,000.00</Text>
    </View>
  </View>
);


  return (
    <ScrollView
      vertical
      showsVerticalScrollIndicator={false}
      style={{ marginBottom: windowHeight(0) }}
    >
      <View style={{ backgroundColor: '#F4F4F4', flex: 1 }}>
        <View
          style={{ backgroundColor: appColors.white, height: windowHeight(10) }}
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
                color: appColors.primaryFont,
                fontFamily: appFonts.medium,
                fontSize: fontSizes.FONT5,
              }}
            >
              Dashboard
            </Text>
            <View
              style={{
                backgroundColor: appColors.white,
                borderColor: appColors.border,
                borderWidth: windowHeight(0.1),
                elevation: 2,
                width: windowHeight(5.5),
                height: windowHeight(5.5),
                borderRadius: windowHeight(3),
                alignItems: 'center',
                justifyContent: 'center',
              }}
            >
              <Icons.Notification color="black" />
            </View>
          </View>
        </View>

        <View style={styles.chartContainer}>
          <View style={{ marginTop: windowHeight(3) }}>
            <Svg width={size} height={size}>
              <G rotation="0" origin={`${cx}, ${cy}`}>
                {data.map((item, index) => {
                  const angle = (item.value / total) * 360
                  const strokeLength = (angle / 360) * 2 * Math.PI * radius
                  const strokeDasharray = `${strokeLength} ${
                    2 * Math.PI * radius
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
            <Text style={styles.title}>Total Booking</Text>
            <Text style={styles.count}>{total}</Text>
          </View>

          <View style={styles.statusContainer}>
            {data.map((item, index) => (
              <View style={styles.statusBox} key={index}>
                <View style={styles.statusTop}>
                  <View
                    style={[styles.statusDot, { backgroundColor: item.color }]}
                  />
                  <Text style={styles.statusLabel}>{item.label}</Text>
                </View>
                <Text style={styles.statusValue}>{item.value}</Text>
              </View>
            ))}
          </View>
        </View>
        <View
          style={{
            backgroundColor: appColors.white,
            height: windowHeight(150),
            marginTop: windowHeight(3),
          }}
        >
          <View
            style={{
              backgroundColor: appColors.white,
              borderWidth: windowHeight(0.1),
              height: windowHeight(12),
              width: '91%',
              borderColor: appColors.border,
              alignSelf: 'center',
              marginTop: windowHeight(2.8),
              borderRadius: windowHeight(0.8),
              flexDirection: 'row',
              alignItems: 'center',
              justifyContent: 'space-between',
              paddingHorizontal: windowHeight(2),
            }}
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
                  color: appColors.black,
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
                $3,000.00
              </Text>
            </View>

            <Icons.LeftArrow />
          </View>

          <Text
            style={{
              color: appColors.black,
              marginHorizontal: windowWidth(5),
              marginTop: windowHeight(2.5),
              fontFamily: appFonts.medium,
              fontSize: fontSizes.FONT4,
            }}
          >
            Total Ride Performance
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
                height: windowHeight(14),
                width: windowHeight(20),
                borderColor: appColors.border,
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
                    source={Images.mapFrame9}
                    resizeMode="contain"
                    style={{
                      height: windowHeight(4),
                      width: windowHeight(3),
                    }}
                  />
                </View>
                <Text
                  style={{
                    color: '#47A1E5',
                    top: windowHeight(3.5),
                    fontFamily: appFonts.bold,
                    fontSize: fontSizes.FONT5,
                  }}
                >
                  15
                </Text>
              </View>
              <Text
                style={{
                  color: appColors.black,
                  marginHorizontal: windowHeight(2),
                  marginTop: windowHeight(1.9),
                  fontFamily: appFonts.medium,
                }}
              >
                Total Drivers
              </Text>
            </View>
            <View
              style={{
                height: windowHeight(21),
                width: windowHeight(20.5),
                borderColor: appColors.border,
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
                  100h
                </Text>
              </View>
              <Text
                style={{
                  color: appColors.black,
                  marginHorizontal: windowHeight(2),
                  marginTop: windowHeight(1.7),
                  fontFamily: appFonts.medium,
                }}
              >
                Total Hours
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

          <View
            style={{
              flexDirection: 'row',
              justifyContent: 'space-between',
              gap: 5,
            }}
          >
            <View
              style={{
                height: windowHeight(21.5),
                width: windowHeight(20),
                borderColor: appColors.border,
                borderWidth: windowHeight(0.1),
                marginHorizontal: windowHeight(2.5),
                borderRadius: windowHeight(0.8),
                bottom: windowHeight(4.8),
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
                <Text
                  style={{
                    color: appColors.primary,
                    top: windowHeight(3.5),
                    fontFamily: appFonts.bold,
                    fontSize: fontSizes.FONT5,
                  }}
                >
                  50KM
                </Text>
              </View>
              <Text
                style={{
                  color: appColors.black,
                  marginHorizontal: windowHeight(2),
                  marginTop: windowHeight(1.7),
                  fontFamily: appFonts.medium,
                }}
              >
                Total Distances
              </Text>
              <Image
                source={Images.mapFrame10}
                resizeMode='contain'
                style={{
                  height: windowHeight(9.4),
                  width: windowHeight(20),
                  alignSelf: 'center',
                }}
              />
            </View>
            <View
              style={{
                height: windowHeight(14.8),
                width: windowHeight(20.55),
                borderColor: appColors.border,
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
                  50
                </Text>
              </View>
              <Text
                style={{
                  color: appColors.black,
                  marginHorizontal: windowHeight(2),
                  marginTop: windowHeight(2.3),
                  fontFamily: appFonts.medium,
                }}
              >
                Total Vehicle
              </Text>
              
            </View>
          </View>
           <View style={{flexDirection:'row',justifyContent:'space-between',              bottom:windowHeight(2.5),paddingHorizontal:windowHeight(2.6)
}}>
            <Text
            style={{
              color: appColors.black,
              fontFamily: appFonts.medium,
              fontSize: fontSizes.FONT4,
            }}
          >Top Drivers</Text>
          {/* <View style={{flexDirection:'row',gap:11}}>
          <Text style={{color:appColors.primary}}>View All</Text>
          <Icons.RightArrow/>
          </View> */}
          <TouchableOpacity
  onPress={() => setShowAll(prev => !prev)}
  style={{ flexDirection: 'row', gap: 11 }}
>
  <Text style={{ color: appColors.primary }}>
    {showAll ? 'Show Less' : 'View All'}
  </Text>
  <Icons.RightArrow style={{ transform: [{ rotate: showAll ? '180deg' : '0deg' }] }} />
</TouchableOpacity>

            </View>
          {/* {drivers.map((driver) => (
        <DriverCard key={driver.id} {...driver} />
      ))} */}
      {visibleDrivers.map((driver) => (
  <DriverCard key={driver.id} {...driver} />
))}
        </View>
        
      
       
      </View>
    </ScrollView>
  )
}

const styles = StyleSheet.create({
  chartContainer: {
    alignItems: 'center',
    marginTop: windowHeight(2.6),
    backgroundColor: appColors.white,
    marginHorizontal: windowHeight(2.5),
    borderRadius: windowHeight(0.8),
    paddingBottom: windowHeight(2.3),
    borderWidth: windowHeight(0.1),
    borderColor: appColors.border,
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
