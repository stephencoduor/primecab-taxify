import React, { useEffect } from 'react';
import { BackHandler, View, StyleSheet, TouchableOpacity, Text } from 'react-native';
import { WebView } from 'react-native-webview';
import { useNavigation, useRoute } from '@react-navigation/native';

export function MapWebView() {
    const navigation = useNavigation();
    const route = useRoute();
    const { lat, lng, type } = route.params || {};

    const mapType = (type || '').toLowerCase();

    const url =
        mapType === 'waze'
            ? `https://waze.com/ul?ll=${lat},${lng}&navigate=yes`
            : mapType === 'bing'
                ? `https://bing.com/maps/default.aspx?cp=${lat}~${lng}`
                : `https://www.google.com/maps/dir/?api=1&destination=${lat},${lng}`;


    useEffect(() => {
        const backHandler = BackHandler.addEventListener('hardwareBackPress', () => {
            navigation.goBack();
            return true;
        });

        return () => backHandler.remove();
    }, []);

    return (
        <View style={{ flex: 1 }}>
            <WebView source={{ uri: url }} />
        </View>
    );
};

const styles = StyleSheet.create({
    backBtn: {
        position: 'absolute',
        top: 40,
        left: 20,
        backgroundColor: 'black',
        padding: 10,
        borderRadius: 8,
        zIndex: 10,
    },
    backText: {
        color: 'white',
        fontSize: 14,
    },
});

