import { useEffect, useRef } from 'react';
import DeviceInfo from 'react-native-device-info';
import { notificationHelper } from '../../commonComponents'

export function useBatteryLowLog() {
    const hasLogged20 = useRef(false);
    const hasLogged10 = useRef(false);
    const intervalRef = useRef<NodeJS.Timeout | null>(null);

    useEffect(() => {
        const checkBattery = async () => {
            try {
                const level = await DeviceInfo.getBatteryLevel(); 
                const percent = Math.round(level * 100);

                if (percent <= 20 && !hasLogged20.current) {
                    notificationHelper('', 'Battery is below 20%. Please charge soon. 🪫', 'error');
                    hasLogged20.current = true;
                }

                if (percent <= 10 && !hasLogged10.current) {
                    notificationHelper('', 'Battery is below 10%. App performance may degrade. 🪫', 'error');
                    hasLogged10.current = true;
                }

                if (percent > 76) {
                    hasLogged20.current = false;
                    hasLogged10.current = false;
                }
            } catch (e) {
                console.error('[BatteryLog] Failed to read battery level:', e);
            }
        };

        intervalRef.current = setInterval(checkBattery, 60000);
        checkBattery(); 

        return () => {
            if (intervalRef.current) clearInterval(intervalRef.current);
        };
    }, []);
}
