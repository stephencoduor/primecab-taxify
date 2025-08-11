
import React, { useRef } from 'react';
import { View, StyleSheet, Animated, PanResponder } from 'react-native';
import FastImage from 'react-native-fast-image';
import Gifs from '../../utils/gifs/gifs';
import appColors from '../../theme/appColors';
import appFonts from '../../theme/appFonts';
import { fontSizes, windowWidth } from '../../theme/appConstant';

const CustomSlider = ({
    buttonText = 'Slide to Start',
    onSwipeSuccess = () => { },
    buttonWidth = 280,
    buttonHeight = 60,
    sliderSize = 50,
    leftPadding = 10,
    rightPadding = 20,
}) => {
    const translateX = useRef(new Animated.Value(0)).current;
    const textTranslateX = useRef(new Animated.Value(0)).current;
    const textOpacity = useRef(new Animated.Value(1)).current;
    const maxSlide = buttonWidth - sliderSize - rightPadding;

    const resetButton = () => {
        Animated.timing(translateX, {
            toValue: 0,
            duration: 300,
            useNativeDriver: false,
        }).start();

        Animated.timing(textTranslateX, {
            toValue: 0,
            duration: 300,
            useNativeDriver: false,
        }).start();

        Animated.timing(textOpacity, {
            toValue: 1,
            duration: 300,
            useNativeDriver: false,
        }).start();
    };

    const handleSwipeSuccess = () => {
        onSwipeSuccess();
        Animated.timing(translateX, {
            toValue: maxSlide,
            duration: 200,
            useNativeDriver: false,
        }).start();

        Animated.timing(textTranslateX, {
            toValue: maxSlide * 0.6,
            duration: 200,
            useNativeDriver: false,
        }).start();

        Animated.timing(textOpacity, {
            toValue: 0,
            duration: 200,
            useNativeDriver: false,
        }).start();
        setTimeout(resetButton, 1000);
    };

    const panResponder = PanResponder.create({
        onStartShouldSetPanResponder: () => true,
        onMoveShouldSetPanResponder: () => true,
        onPanResponderMove: (_, gesture) => {
            const newValue = Math.min(Math.max(0, gesture.dx), maxSlide);
            translateX.setValue(newValue);
            textTranslateX.setValue(newValue * 0.6);
            textOpacity.setValue(1 - newValue / maxSlide);
        },
        onPanResponderRelease: (_, gesture) => {
            if (gesture.dx > maxSlide - 10) {
                handleSwipeSuccess();
            } else {
                resetButton();
            }
        },
    });

    return (
        <View style={styles.container}>
            <View
                style={[
                    styles.swipeButton,
                    {
                        width: buttonWidth,
                        height: buttonHeight,
                        borderRadius: windowWidth(1.8),
                    },
                ]}
            >
                <Animated.Text
                    style={[
                        styles.swipeText,
                        {
                            transform: [{ translateX: textTranslateX }],
                            opacity: textOpacity,
                        },
                    ]}
                >
                    {buttonText}
                </Animated.Text>

                <Animated.View
                    style={[
                        styles.slider,
                        {
                            width: sliderSize,
                            height: sliderSize,
                            borderRadius: windowWidth(1.8),
                            left: leftPadding,
                            transform: [{ translateX }],
                        },
                    ]}
                    {...panResponder.panHandlers}
                >
                    <FastImage
                        source={Gifs.ActiveRideGo}
                        style={{
                            width: sliderSize + 10,
                            height: sliderSize + 10,
                        }}
                    />
                </Animated.View>
            </View>
        </View>
    );
};

const styles = StyleSheet.create({
    container: {
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: 'transparent',
    },
    swipeButton: {
        justifyContent: 'center',
        alignItems: 'center',
        position: 'relative',
        overflow: 'hidden',
        backgroundColor: appColors.primary,
    },
    swipeText: {
        color: appColors.white,
        fontSize: fontSizes.FONT4,
        position: 'absolute',
        textAlign: 'center',
        width: '100%',
        fontFamily: appFonts.medium,
    },
    slider: {
        backgroundColor: appColors.white,
        position: 'absolute',
        justifyContent: 'center',
        alignItems: 'center',
        elevation: 5,
        shadowColor: appColors.black,
        shadowOpacity: 0.2,
        shadowRadius: 5,
    },
});

export default CustomSlider;
