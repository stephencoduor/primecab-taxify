import React from "react";
import { Image, Text, TouchableOpacity, View } from "react-native";
import Icons from "../../../utils/icons/icons";
import appColors from "../../../theme/appColors";
import { fontSizes, windowHeight, windowWidth } from "../../../theme/appConstant";
import { BackButton } from "../../../commonComponents";
import appFonts from "../../../theme/appFonts";
import Images from "../../../utils/images/images";
import styles from "./styles";



const drivers = [
    {
        id: 1,
        name: 'Toyota Corolla Altis',
        email: 'CLMV069',
        status: 'Approved',
        statusColor: appColors.primary,
        bgColor: appColors.cardicon,
    },
    {
        id: 2,
        name: 'SUV',
        email: 'CLMV069',
        status: 'Waiting',
        statusColor: '#ECB238',
        bgColor: '#FDF7EB',
    },
    {
        id: 3,
        name: 'Toyota Corolla',
        email: 'CLMV069',
        status: 'Rejected',
        statusColor: appColors.red,
        bgColor: appColors.lightRed,
    },
];

const DriverCard = ({ name, email, status, statusColor, bgColor }) => (
    <View
        style={{
            backgroundColor: appColors.white,
            borderWidth: windowHeight(0.1),
            borderColor: appColors.border,
            width: '90%',
            height: windowHeight(16),
            marginTop: windowHeight(3),
            alignSelf: 'center',
            borderRadius: windowHeight(0.9),
            elevation: 1,
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
                color: appColors.primary,
                fontFamily: appFonts.medium,
                fontSize: fontSizes.FONT3SMALL,
                marginHorizontal: windowHeight(8.3),
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
                style={{
                    backgroundColor: bgColor,
                    padding: windowHeight(0.8),
                    borderRadius: windowHeight(2),
                    paddingHorizontal: windowHeight(2),
                }}
            >
                <Text
                    style={{
                        color: statusColor,
                        fontFamily: appFonts.medium,
                        fontSize: fontSizes.FONT3HALF,
                    }}
                >
                    {status}
                </Text>
            </View>

            <View
                style={{
                    alignItems: 'flex-end',
                    flexDirection: 'row',
                    justifyContent: 'space-between',
                    gap: 8,
                }}
            >
                <Icons.edit color="#60A5FA" />
                <View
                    style={{
                        height: windowHeight(2),
                        borderColor: appColors.border,
                        borderWidth: windowHeight(0.1),
                    }}
                />
                <Icons.Delete />
            </View>
        </View>
    </View>
);

export function ManageVehicle() {
    return (
        <View>
            <View
                style={[
                    styles.header,
                    {
                        backgroundColor: appColors.white,
                        flexDirection: 'row',
                    },
                ]}
            >
                <BackButton />
                <View style={styles.headerTitle}>
                    <Text
                        style={[styles.activeRide, { color: appColors.primaryFont }]}
                    >
                        Manage Vehicle
                    </Text>
                </View>
                <TouchableOpacity
                    style={{
                        height: windowHeight(4.7),
                        width: windowHeight(4.7),
                        borderWidth: 1,
                        borderRadius: windowHeight(0.9),
                        borderColor: appColors.border,
                        alignItems: 'center',
                        justifyContent: 'center',
                    }}
                >
                    <Icons.plus />
                </TouchableOpacity>
            </View>

            {drivers.map((driver) => (
                <DriverCard key={driver.id} {...driver} />
            ))}
        </View>
    );
};

