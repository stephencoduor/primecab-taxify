import React, { useEffect, useRef, useState } from "react";
import {Animated,Image,StyleSheet,Text,TouchableOpacity,View} from "react-native";
import MapView, { Marker } from "react-native-maps";
import { useSelector } from "react-redux";
import { fontSizes, windowHeight, windowWidth } from "../../../theme/appConstant";
import appColors from "../../../theme/appColors";
import Icons from "../../../utils/icons/icons";
import appFonts from "../../../theme/appFonts";

const PulseCircle = ({ delay = 0, color }) => {
    const scale = useRef(new Animated.Value(1)).current;
    const opacity = useRef(new Animated.Value(0.6)).current;

    useEffect(() => {
        Animated.loop(
            Animated.sequence([
                Animated.delay(delay),
                Animated.parallel([
                    Animated.timing(scale, {
                        toValue: 2,
                        duration: 2000,
                        useNativeDriver: true,
                    }),
                    Animated.timing(opacity, {
                        toValue: 0,
                        duration: 2000,
                        useNativeDriver: true,
                    }),
                ]),
                Animated.timing(scale, {
                    toValue: 1,
                    duration: 0,
                    useNativeDriver: true,
                }),
                Animated.timing(opacity, {
                    toValue: 0.6,
                    duration: 0,
                    useNativeDriver: true,
                }),
            ])
        ).start();
    }, [delay]);

    return (
        <Animated.View
            style={[
                styles.pulse,
                {
                    backgroundColor: color,
                    transform: [{ scale }],
                    opacity,
                },
            ]}
        />
    );
};

export function FleetHome() {

    const { selfDriver } = useSelector((state: any) => state.account);
    const { zoneValue } = useSelector((state) => state.zoneUpdate);
    const char = selfDriver?.name ? selfDriver.name.charAt(0) : '';
    const [localImageUri, setLocalImageUri] = useState<string | null>(null);
    const [isVisible, setIsVisible] = useState(true);
    const [status, setStatus] = useState<'online' | 'offline'>('online');

    const amount = selfDriver?.wallet_balance ?? 0;
    const rawAmount = `${zoneValue?.currency_symbol}${(zoneValue?.exchange_rate * amount).toFixed(2)}`;
    const maskedAmount = `${zoneValue?.currency_symbol}**** **`;

    const cycleStatus = () => {
        setStatus(prev => (prev === 'online' ? 'offline' : 'online'));
    };


    const statusColors = {
        online: {
            outer: '#198E70',
            inner: '#199675',
            pulse1: '#579577',
            pulse2: '#DFEBE8',
            label: 'Online',
        },
        offline: {
            outer: '#F14848',
            inner: '#FF4B4B',
            pulse1: '#B42D30',
            pulse2: '#F5D5D6',
            label: 'Offline',
        },

    };

    const current = statusColors[status] || statusColors['online'];

    return (
        <View style={{ flex: 1 }}>
            <MapView
                style={StyleSheet.absoluteFillObject}
                rotateEnabled={false}
                initialRegion={{
                    latitude: 23.0225,
                    longitude: 72.5714,
                    latitudeDelta: 0.01,
                    longitudeDelta: 0.01,
                }}
            >
                <Marker coordinate={{ latitude: 23.0225, longitude: 72.5714 }} />
            </MapView>

            <View style={{ flexDirection: 'row', justifyContent: 'space-between', top: '3%', alignItems: 'center' }}>
                <View
                    style={{
                        flexDirection: 'row',
                        alignItems: 'center',
                        backgroundColor: appColors.primary,
                        height: windowHeight(5),
                        borderRadius: windowHeight(8.5),
                        paddingHorizontal: windowWidth(4.3),
                        left: '35%',
                    }}
                >
                    <TouchableOpacity onPress={() => setIsVisible(prev => !prev)}>
                        {isVisible ? <Icons.Eye /> : <Icons.WalletEyeClose />}
                    </TouchableOpacity>
                    <View
                        style={{
                            height: windowHeight(1.5),
                            width: windowHeight(0.1),
                            backgroundColor: appColors.white,
                            marginHorizontal: windowWidth(1.5),
                        }}
                    />
                    <Text style={styles.text}>
                        {isVisible ? rawAmount : maskedAmount}
                    </Text>
                </View>

                <View style={{ alignItems: 'flex-end', alignSelf: 'flex-end', right: windowHeight(2) }}>
                    {localImageUri || selfDriver?.profile_image_url ? (
                        <Image
                            style={{
                                backgroundColor: appColors.primary,
                                height: windowHeight(5.5),
                                width: windowHeight(5.5),
                                borderRadius: windowHeight(5),
                            }}
                            source={{
                                uri: localImageUri || selfDriver?.profile_image_url,
                            }}
                        />
                    ) : (
                        <View
                            style={{
                                alignItems: 'center',
                                justifyContent: 'center',
                                width: windowHeight(5.5),
                                height: windowHeight(5.5),
                                backgroundColor: appColors.primary,
                                borderRadius: windowHeight(74),
                            }}
                        >
                            <Text
                                style={{
                                    color: appColors.white,
                                    fontFamily: appFonts.bold,
                                    fontSize: fontSizes.FONT5,
                                }}
                            >
                                {char}
                            </Text>
                        </View>
                    )}
                </View>
            </View>

            <View
                style={{
                    marginHorizontal: windowHeight(2),
                    top: '80.5%',
                    position: 'absolute',
                    backgroundColor: appColors.white,
                    borderColor: appColors.border,
                    justifyContent: 'center',
                    borderWidth: windowHeight(0.15),
                    height: windowHeight(7),
                    width: windowHeight(7),
                    borderRadius: windowHeight(4),
                    alignItems: 'center',
                }}
            >
                <Icons.SOS />
            </View>

            <View
                style={{
                    top: '75.3%',
                    backgroundColor: appColors.white,
                    height: windowHeight(7),
                    width: windowHeight(7),
                    borderRadius: windowHeight(4),
                    borderColor: appColors.border,
                    justifyContent: 'center',
                    borderWidth: windowHeight(0.15),
                    alignItems: "center",
                    alignSelf: 'flex-end',
                    right: windowHeight(2),
                }}
            >
                <Icons.LocationIcon />
            </View>

            <TouchableOpacity style={styles.container} onPress={cycleStatus}>
                <PulseCircle delay={0} color={current.pulse1} />
                <PulseCircle delay={600} color={current.pulse2} />

                <View style={[styles.staticOuterCircle, { backgroundColor: current.outer }]} />
                <View style={[styles.button, { backgroundColor: current.inner }]}>
                    <Icons.Fleet />
                </View>
            </TouchableOpacity>

            <View
                style={{
                    position: 'absolute',
                    backgroundColor: 'black',
                    paddingVertical: windowHeight(1),
                    paddingHorizontal: windowHeight(1.5),
                    borderRadius: windowHeight(0.8),
                    alignSelf: 'center',
                    top: '73.5%',
                }}
            >
                <Text
                    style={{
                        color: appColors.white,
                        fontSize: fontSizes.FONT3,
                        fontFamily: appFonts.medium,
                    }}
                >
                    {current.label}
                </Text>
                <View
                    style={{
                        position: 'absolute',
                        top: windowHeight(3.6),
                        alignSelf: 'center',
                        width: 0,
                        height: 0,
                        borderLeftWidth: windowHeight(0.8),
                        borderRightWidth: windowHeight(0.8),
                        borderTopWidth: windowHeight(0.8),
                        borderLeftColor: 'transparent',
                        borderRightColor: 'transparent',
                        borderTopColor: appColors.black,
                    }}
                />
            </View>
        </View>
    );
}

const SIZE = windowHeight(7);
const OUTER_SIZE = SIZE + windowHeight(1.2);

const styles = StyleSheet.create({
    text: {
        color: appColors.white,
        fontSize: fontSizes.FONT4,
        fontFamily: appFonts.medium,
    },
    container: {
        alignSelf: 'center',
        position: 'absolute',
        top: '73.7%',
        height: SIZE * 3,
        width: SIZE * 3,
        justifyContent: 'center',
        alignItems: 'center',
    },
    pulse: {
        position: 'absolute',
        height: SIZE,
        width: SIZE,
        borderRadius: SIZE / 2,
        zIndex: 0,
    },
    staticOuterCircle: {
        position: 'absolute',
        height: OUTER_SIZE,
        width: OUTER_SIZE,
        borderRadius: OUTER_SIZE / 2,
        zIndex: 1,
    },
    button: {
        height: SIZE,
        width: SIZE,
        borderRadius: SIZE / 2,
        justifyContent: 'center',
        alignItems: 'center',
        borderColor: 'white',
        borderWidth: windowHeight(0.15),
        zIndex: 2,
    },


})
