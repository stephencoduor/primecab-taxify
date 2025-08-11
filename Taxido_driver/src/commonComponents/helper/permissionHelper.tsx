import { Alert, BackHandler, Linking, PermissionsAndroid, Platform } from 'react-native';
import { request, PERMISSIONS, RESULTS, openSettings } from 'react-native-permissions';
import Geolocation from '@react-native-community/geolocation';
import AsyncStorage from '@react-native-async-storage/async-storage';

const isAndroid = Platform.OS === 'android';
const isIOS = Platform.OS === 'ios';


export const requestLocationPermission = async () => {
    if (Platform.OS === 'android') {
        try {
            const granted = await PermissionsAndroid.requestMultiple([
                PermissionsAndroid.PERMISSIONS.ACCESS_FINE_LOCATION,
                PermissionsAndroid.PERMISSIONS.ACCESS_BACKGROUND_LOCATION,
            ]);

            const fineGranted = granted['android.permission.ACCESS_FINE_LOCATION'] === 'granted';
            const backgroundGranted = granted['android.permission.ACCESS_BACKGROUND_LOCATION'] === 'granted';

            if (!fineGranted) {
                Alert.alert(
                    'Permission Required',
                    'App needs location permission to work properly.',
                    [
                        {
                            text: 'Open Settings',
                            onPress: () => {
                                openSettings().catch(() => {
                                    Linking.openSettings();
                                });
                            },
                        },
                        {
                            text: 'Exit',
                            style: 'destructive',
                            onPress: () => {
                                BackHandler.exitApp();
                            },
                        },
                    ],);
                return false;
            }

            if (!backgroundGranted) {
                Alert.alert(
                    'Background Location Required',
                    'App needs background location permission to track location when app is in background.',
                    [
                        { text: 'Cancel', style: 'cancel' },
                        {
                            text: 'Open Settings',
                            onPress: () => Linking.openSettings(),
                        },
                    ]
                );
                return false;
            }

            return true;
        } catch (err) {
            console.warn(err);
            return false;
        }
    }

    return true;
};






export const handlePermissionDenied = () => {
    Alert.alert(
        'Permission Required',
        'Location permission is required to proceed. Please enable it in settings.',
        [
            {
                text: 'Go to Settings',
                onPress: () => Linking.openSettings(),
            },
            {
                text: 'Exit App',
                onPress: () => BackHandler.exitApp(),
                style: 'cancel',
            },
        ],
        { cancelable: false }
    );
};


export const getAndStoreLocation = async (): Promise<{ lat: number; lng: number } | null> => {
    return new Promise((resolve, reject) => {
        Geolocation.getCurrentPosition(
            async (position) => {
                const { latitude, longitude } = position.coords;
                await AsyncStorage.setItem('user_latitude', latitude.toString());
                await AsyncStorage.setItem('user_longitude', longitude.toString());
                resolve({ lat: latitude, lng: longitude });
            },
            (error) => {
                console.warn('[Location Error]', error);
                reject(null);
            },
            { enableHighAccuracy: true, timeout: 15000, maximumAge: 0 }
        );
    });
};

export const getStoredLocation = async (): Promise<{ lat: number; lng: number } | null> => {
    const lat = await AsyncStorage.getItem('user_latitude');
    const lng = await AsyncStorage.getItem('user_longitude');
    if (lat && lng) return { lat: parseFloat(lat), lng: parseFloat(lng) };
    return null;
};


export const requestCameraPermission = async () => {
    const permission = isIOS ? PERMISSIONS.IOS.CAMERA : PERMISSIONS.ANDROID.CAMERA;
    const result = await request(permission);
    return result === RESULTS.GRANTED;
};

export const requestNotificationPermission = async () => {
    const permission = isIOS ? PERMISSIONS.IOS.NOTIFICATIONS : PERMISSIONS.ANDROID.POST_NOTIFICATIONS;
    const result = await request(permission);
    return result === RESULTS.GRANTED;
};

export const requestStoragePermission = async () => {
    if (isAndroid) {
        const result = await PermissionsAndroid.request(PermissionsAndroid.PERMISSIONS.READ_EXTERNAL_STORAGE);
        return result === PermissionsAndroid.RESULTS.GRANTED;
    }
    return true; 
};
