import React, { useState } from "react";
import { ScrollView, Text, TextInput, View } from "react-native";
import styles from "./styles";
import { Header, TitleView } from "../../component";
import { ProgressBar } from "../component";
import appColors from "../../../../theme/appColors";
import { useValues } from "../../../../utils/context";
import { useTheme } from "@react-navigation/native";
import { Button, Input } from "../../../../commonComponents";
import { useSelector } from "react-redux";
import { fontSizes, windowHeight, windowWidth } from "../../../../theme/appConstant";
import appFonts from "../../../../theme/appFonts";

export function FleetDetails() {
    const { isDark, textRtlStyle } = useValues();
    const { colors } = useTheme();
    const { translateData } = useSelector(state => state.setting);
    const [companyName, setCompanyName] = useState('');
    const [companyEmail, setCompanyEmail] = useState('');
    const [companyAddress, setCompanyAddress] = useState('');
    const [city, setCity] = useState('');
    const [postalCode, setPostalCode] = useState('');
    const [warnings, setWarnings] = useState({
        companyName: false,
        companyEmail: false,
        companyAddress: false,
        city: false,
        postalCode: false
    });

    const onNext = () => {
        const newWarnings = {
            companyName: !companyName.trim(),
            companyEmail: !companyEmail.trim(),
            companyAddress: !companyAddress.trim(),
            city: !city.trim(),
            postalCode: !postalCode.trim()
        };
        setWarnings(newWarnings);

        const hasError = Object.values(newWarnings).some(v => v);
        if (!hasError) {
        }
    };

    return (
        <View style={{ flex: 1 }}>
            <Header backgroundColor={isDark ? colors.card : appColors.white} />
            <ProgressBar fill={2} />
            <ScrollView style={[styles.subView, { backgroundColor: colors.background }]} showsVerticalScrollIndicator={false}>
                <View style={styles.space}>
                    <TitleView
                        title={'Add Company Details'}
                        subTitle={'Add your business info to set up your company profile.'}
                    />
                    <Input
                        title={'Company Name'}
                        titleShow={true}
                        placeholder={'Enter company name'}
                        value={companyName}
                        onChangeText={(text) => {
                            setCompanyName(text);
                            setWarnings(prev => ({
                                ...prev,
                                companyName: !text.trim()
                            }));
                        }}

                        warning={'Please Enter Your company name'}
                        showWarning={warnings.companyName}
                        backgroundColor={isDark ? appColors.darkThemeSub : appColors.white}
                        borderColor={colors.border}
                    />
                    <Input
                        title={'Company Email'}
                        titleShow={true}
                        placeholder={'Enter company email id'}
                        value={companyEmail}
                        onChangeText={(text) => {
                            setCompanyEmail(text);
                            setWarnings(prev => ({
                                ...prev,
                                companyEmail: !text.trim()
                            }));
                        }}

                        warning={'Please Enter Your company email id'}
                        showWarning={warnings.companyEmail}
                        backgroundColor={isDark ? appColors.darkThemeSub : appColors.white}
                        borderColor={colors.border}
                    />
                    <View style={{ marginTop: windowHeight(0.8) }}>
                        <Text style={{
                            marginBottom: windowHeight(1),
                            color: isDark ? appColors.white : appColors.primaryFont,
                            fontFamily: appFonts.medium,
                            textAlign: textRtlStyle,
                        }}>Company Address</Text>
                        <View style={{
                            borderRadius: windowHeight(0.8),
                            backgroundColor: isDark ? appColors.darkThemeSub : appColors.white,
                            borderColor: colors.border,
                            borderWidth: windowHeight(0.1),
                            height: windowHeight(10)
                        }}>
                            <TextInput
                                value={companyAddress}
                                onChangeText={(text) => {
                                    setCompanyAddress(text);
                                    setWarnings(prev => ({
                                        ...prev,
                                        companyAddress: !text.trim()
                                    }));
                                }}

                                placeholder={'Enter company address'}
                                placeholderTextColor={isDark ? appColors.darkText : appColors.secondaryFont}
                                style={{
                                    color: isDark ? appColors.white : appColors.black,
                                    paddingHorizontal: windowWidth(4),
                                    fontFamily: appFonts.regular,
                                    fontSize: fontSizes.FONT4,
                                    overflow: 'hidden',
                                    top: windowHeight(0.6)
                                }}
                            />
                        </View>
                        {warnings.companyAddress &&
                            <Text style={{ color: appColors.red, marginTop: windowHeight(0.8), fontSize: fontSizes.FONT3 }}>
                                Please Enter Your company address
                            </Text>
                        }
                    </View>
                    <View style={{ marginTop: windowHeight(1.8) }}>
                        <Input
                            title={'City'}
                            titleShow={true}
                            placeholder={'Enter city'}
                            value={city}
                            onChangeText={(text) => {
                                setCity(text);
                                setWarnings(prev => ({
                                    ...prev,
                                    city: !text.trim()
                                }));
                            }}
                            warning={'Please Enter Your city'}
                            showWarning={warnings.city}
                            backgroundColor={isDark ? appColors.darkThemeSub : appColors.white}
                            borderColor={colors.border}
                        />
                        <Input
                            title={'Postal Code'}
                            titleShow={true}
                            placeholder={'Enter postal code'}
                            value={postalCode}
                            onChangeText={(text) => {
                                setPostalCode(text);
                                setWarnings(prev => ({
                                    ...prev,
                                    postalCode: !text.trim()
                                }));
                            }}
                            warning={'Please Enter Your postal code'}
                            showWarning={warnings.postalCode}
                            backgroundColor={isDark ? appColors.darkThemeSub : appColors.white}
                            borderColor={colors.border}
                        />

                    </View>
                </View>
                <View style={styles.margin}>
                    <Button
                        title={translateData.next}
                        backgroundColor={appColors.primary}
                        color={appColors.white}
                        onPress={onNext}
                    />
                </View>
            </ScrollView>
        </View>
    );
}
