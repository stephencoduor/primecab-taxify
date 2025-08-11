import React, { useState } from 'react';
import { View, Dimensions, ActivityIndicator, StyleSheet, Text, TouchableOpacity } from 'react-native';
import { WebView } from 'react-native-webview';
import appColors from '../../../theme/appColors';
import { fontSizes, windowHeight } from '../../../theme/appConstant';
import { useValues } from '../../../utils/context';
import { useSelector } from 'react-redux';
import Icons from '../../../utils/icons/icons';
import appFonts from '../../../theme/appFonts';

export function PdfViewer({ route }) {
    const { pdfUrl } = route?.params || {};
    const { isDark } = useValues();
    const [loading, setLoading] = useState(true);
    const pdfGoogleViewer = `https://docs.google.com/gview?embedded=true&url=${encodeURIComponent(pdfUrl)}`;

    const downloadInvoice = async () => {
      
    };

    return (
        <View style={{ flex: 1, }}>
            <View style={[styles.headerView, { backgroundColor: appColors.white }]}>

                <TouchableOpacity style={{ borderWidth: 1, borderColor: appColors.border, borderRadius: windowHeight(0.9), height: windowHeight(5), width: windowHeight(5), alignItems: 'center', justifyContent: 'center' }}>
                    <Icons.Back color={appColors.black} />
                </TouchableOpacity>
                <Text style={{ fontFamily: appFonts.medium, fontSize: fontSizes?.FONT4HALF }}>Invoice</Text>
                <TouchableOpacity onPress={downloadInvoice} style={{ borderWidth: 1, borderColor: appColors.border, borderRadius: windowHeight(0.9), height: windowHeight(5), width: windowHeight(5), alignItems: 'center', justifyContent: 'center' }}>
                    <Icons.Download color={appColors.black} />
                </TouchableOpacity>
            </View>
            {loading && (
                <View style={styles.loaderContainer}>
                    <ActivityIndicator size="large" color={appColors.primary} />
                </View>
            )}

            <WebView
                source={{ uri: pdfGoogleViewer }}
                style={{ flex: 1, width: Dimensions.get('window').width, backgroundColor: isDark ? appColors.primaryFont : appColors.graybackground }}
                javaScriptEnabled={true}
                domStorageEnabled={true}
                onLoadStart={() => setLoading(true)}
                onLoadEnd={() => setLoading(false)}
                onError={(error) => {
                    setLoading(false);
                }}
            />
        </View>
    );
}

const styles = StyleSheet.create({
    loaderContainer: {
        position: 'absolute',
        top: '50%',
        left: '50%',
        marginTop: -25,
        marginLeft: -25,
        zIndex: 10,
    },
    container: {
        width: windowHeight(32),
        height: windowHeight(32),
        backgroundColor: appColors.white,
        borderWidth: windowHeight(1),
        alignItems: 'center',
        justifyContent: 'center',
        borderRadius: windowHeight(5),
    },
    headerView: {
        height: windowHeight(8),
        flexDirection: 'row',
        width: '100%',
        justifyContent: 'space-between',
        paddingHorizontal: windowHeight(2),
        alignItems: 'center',
    },
});
