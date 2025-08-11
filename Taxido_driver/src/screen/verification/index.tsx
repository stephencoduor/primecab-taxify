import React, { useCallback, useEffect, useRef, useState } from "react";
import { BackHandler, Image, Text, TouchableOpacity, TouchableWithoutFeedback, View } from "react-native";
import Icons from "../../utils/icons/icons";
import appColors from "../../theme/appColors";
import Images from "../../utils/images/images";
import { useValues } from "../../utils/context";
import { useDispatch, useSelector } from "react-redux";
import styles from "./styles";
import { Button } from "../../commonComponents";
import { fontSizes, windowHeight } from "../../theme/appConstant";
import appFonts from "../../theme/appFonts";
import { selfDriverData } from "../../api/store/action";
import { useFocusEffect, useIsFocused, useNavigation, useTheme } from "@react-navigation/native";
import firestore from '@react-native-firebase/firestore'
import BottomSheet, { BottomSheetBackdrop, BottomSheetView } from "@gorhom/bottom-sheet";


export function Verification() {

    const { selfDriver } = useSelector((state: any) => state.account)
    const dispatch = useDispatch();
    const navigation = useNavigation();
    const [driverModal, setDriverModal] = useState(false);
    const { translateData } = useSelector((state) => state.setting);


    useFocusEffect(
        useCallback(() => {
            dispatch(selfDriverData())
        }, [dispatch]),
    )

    useEffect(() => {

        if (!selfDriver?.id) return;

        const unsubscribe = firestore()
            .collection('driverTrack')
            .doc(selfDriver.id.toString())
            .onSnapshot(doc => {
                const data = doc.data();

                if (data?.is_verified == 1) {
                    navigation.reset({
                        index: 0,
                        routes: [{ name: 'TabNav' }],
                    });
                }
            });
        return () => unsubscribe();
    }, [selfDriver?.id]);


    const gotoDocUpdate = () => {
        navigation.navigate('DocumentDetail', { NavValue: 1 });
    }


    const { viewRtlStyle, isDark } = useValues()
    const { colors } = useTheme()

    const hasRejectedDocument = Array.isArray(selfDriver?.documents)
        ? selfDriver.documents.some(doc => doc?.status === 'rejected')
        : false;


    const isFocused = useIsFocused();
    useEffect(() => {
        const backAction = () => {
            bottomSheetRef.current?.expand();
            return true;
        };

        if (isFocused) {
            const backHandler = BackHandler.addEventListener(
                "hardwareBackPress",
                backAction
            );
            return () => backHandler.remove();
        }
    }, [isFocused]);

    const handleExit = () => {
        BackHandler.exitApp();
        bottomSheetRef.current?.close(); 
    };
    const handleCancel = () => {
        bottomSheetRef.current?.close(); 
    };
    const bottomSheetRef = useRef(null);

    const renderBackdrop = useCallback(
        (props) => (
            <BottomSheetBackdrop
                {...props}
                pressBehavior="close"
                appearsOnIndex={0}
                disappearsOnIndex={-1}
            />
        ),
        []
    );


    return (
        <View style={{ height: '100%' }}>
            <View style={{ height: '10%', backgroundColor: appColors.white, width: '100%' }}>
                <Text style={{ top: windowHeight(3.8), justifyContent: 'center', textAlign: 'center', fontSize: fontSizes.FONT5, fontFamily: appFonts.medium, color: appColors.black }}>{translateData.verification}</Text>
            </View>
            <View style={[styles.main, { backgroundColor: isDark ? appColors.black : appColors.graybackground }]}>
                <Image source={Images.verification} resizeMode="contain" style={styles.image} />
                <View style={[styles.container, { flexDirection: viewRtlStyle }]}>
                    <Text style={[styles.title, { color: isDark ? appColors.white : appColors.primaryFont }]}>{translateData.verificationProcess}</Text>
                    <Icons.Info />
                </View>
                <Text style={styles.text}>{translateData.verificationNote}</Text>
                {hasRejectedDocument && (
                    <View style={styles.btn}>
                        <Button
                            title={translateData.updateDocument}
                            backgroundColor={appColors.primary}
                            color={appColors.white}
                            onPress={gotoDocUpdate}
                        />
                    </View>
                )}
            </View >

            <BottomSheet
                ref={bottomSheetRef}
                index={-1}
                snapPoints={['20%']}
                backdropComponent={renderBackdrop}
                enablePanDownToClose
                handleIndicatorStyle={{ backgroundColor: appColors.primary, width: '13%' }}

            >
                <BottomSheetView style={{ paddingHorizontal: windowHeight(2) }}>
                    <TouchableWithoutFeedback >
                        <TouchableOpacity
                            style={[styles.modalContainer, { backgroundColor: colors.card }]}
                            activeOpacity={1}
                        >
                            <Text
                                style={[
                                    styles.modalTitle,
                                    { color: isDark ? appColors.white : appColors.primaryFont },
                                ]}
                            >
                                {translateData.exitMsg}
                            </Text>
                            <View
                                style={[
                                    styles.buttonContainer,
                                    { flexDirection: viewRtlStyle },
                                ]}
                            >
                                <TouchableOpacity
                                    style={[
                                        styles.button,
                                        {
                                            backgroundColor: isDark
                                                ? colors.background
                                                : appColors.graybackground,
                                        },
                                    ]}
                                    onPress={handleExit}
                                >
                                    <Text
                                        style={[
                                            styles.buttonText,
                                            {
                                                color: isDark ? appColors.white : appColors.primaryFont,
                                            },
                                        ]}
                                    >
                                        {translateData.exit}
                                    </Text>
                                </TouchableOpacity>
                                <TouchableOpacity style={styles.button} onPress={handleCancel}>
                                    <Text style={styles.buttonText}>{translateData.cancel}</Text>
                                </TouchableOpacity>
                            </View>
                        </TouchableOpacity>
                    </TouchableWithoutFeedback>
                </BottomSheetView>
            </BottomSheet>
        </View>
    )
}
