import React, { useEffect, useState } from 'react';
import { View, TouchableOpacity, Text } from 'react-native';
import { useSelector } from 'react-redux';
import styles from './styles';
import { useValues } from '../../../../../utils/context';
import { useTheme } from '@react-navigation/native';
import appColors from '../../../../../theme/appColors';



export function Selection({ onButtonPress }) {
  const { translateData } = useSelector(state => state.setting);
  const [internalTab, setInternalTab] = useState('');
  const [activeTab, setActiveTab] = useState('wallet');
  const { viewRtlStyle } = useValues();
  const { colors } = useTheme()
  const { isDark } = useValues()

  useEffect(() => {
    setInternalTab(activeTab);
  }, [activeTab]);

  const handleTabPress = (tab) => {
    setInternalTab(tab);
    if (onButtonPress) {
      onButtonPress(tab);
    }
  };

  return (
    <View
      style={[
        styles.selection,
        { flexDirection: viewRtlStyle, backgroundColor: colors.card },
      ]}
    >
      <View style={styles.container}>
        <TouchableOpacity
          style={[
            styles.tab,
            styles.leftTab,
            internalTab === 'wallet'
              ? styles.activeTab
              : styles.inactiveTab,
            internalTab !== 'wallet' && {
              backgroundColor: isDark ? appColors.bgDark : appColors.white,
            },
          ]}
          onPress={() => handleTabPress('wallet')}
        >
          <Text
            style={[
              internalTab === 'wallet' ? styles.activeText : styles.inactiveText,
            ]}
          >
            {translateData.totalEarning}

          </Text>
        </TouchableOpacity>

        <TouchableOpacity
          style={[
            styles.tab,
            styles.rightTab,
            internalTab === 'withdraw' ? styles.activeTab : styles.inactiveTab,
            internalTab !== 'withdraw' && { backgroundColor: isDark ? appColors.bgDark : appColors.white },
          ]}

          onPress={() => handleTabPress('withdraw')}
        >
          <Text
            style={[
              internalTab === 'withdraw' ? styles.activeText : styles.inactiveText,
            ]}
          >
            {translateData.withdrawHistory}

          </Text>
        </TouchableOpacity>
      </View>
    </View>
  );
}
