import { Image, TouchableOpacity, TouchableWithoutFeedback, View, Text } from 'react-native'
import React, { useCallback, useEffect, useRef, useState } from 'react'
import {LanguageModal,Notification,DarkTheme,Rtl} from './component/'
import styles from './styles'
import { CustomRadioButton, Header } from '../../../commonComponents'
import { useTheme } from '@react-navigation/native'
import { useDispatch, useSelector } from 'react-redux'
import { languageDataGet, translateDataGet } from '../../../api/store/action'
import BottomSheet, { BottomSheetBackdrop, BottomSheetView } from '@gorhom/bottom-sheet'
import { fontSizes, windowHeight } from '../../../theme/appConstant'
import appColors from '../../../theme/appColors'
import appFonts from '../../../theme/appFonts'
import { useValues } from '../../../utils/context'
import AsyncStorage from '@react-native-async-storage/async-storage'

export function AppSettings() {
  const { colors } = useTheme()
  const { translateData, languageData } = useSelector(state => state.setting)
  const dispatch = useDispatch()

  useEffect(() => {
    dispatch(languageDataGet())
  }, [])


  const bottomSheetRef = useRef(null);
  const openSheet = () => bottomSheetRef.current?.expand();

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


  const [modalVisible, setModalVisible] = useState(false)
  const [selectedLanguage, setSelectedLanguage] = useState('en')
  const { viewRtlStyle, setRtl, viewSelfRtlStyle } = useValues()


  useEffect(() => {
    ; (async () => {
      try {
        const storedLanguage = await AsyncStorage.getItem('selectedLanguage')
        if (storedLanguage) {
          setSelectedLanguage(storedLanguage)
          setRtl(storedLanguage === 'ar')
        }
      } catch (error) {
        console.error('Error retrieving selected language:', error)
      }
    })()
  }, [])


  const closeModal = async () => {
    bottomSheetRef.current?.close();
    await AsyncStorage.setItem('selectedLanguage', selectedLanguage)
    setRtl(selectedLanguage === 'ar')
    dispatch(translateDataGet())
  }

  return (
    <View style={[styles.main, { backgroundColor: colors.background }]}>
      <Header title={translateData.appSetting} />
      <View style={styles.container}>
        <View
          style={[
            styles.listContainer,
            { backgroundColor: colors.card, borderColor: colors.border },
          ]}
        >
          <>
            <DarkTheme />
            <Notification />
            <Rtl />
            <LanguageModal openSheet={openSheet} />
          </>
        </View>
      </View>
      <BottomSheet
        ref={bottomSheetRef}
        index={-1}
        snapPoints={['60%']}
        backdropComponent={renderBackdrop}
        enablePanDownToClose
        handleIndicatorStyle={{ backgroundColor: appColors.primary, width: '13%' }}
        backgroundStyle={{ backgroundColor: colors.card }}

      >
        <BottomSheetView style={{ paddingHorizontal: windowHeight(2) }}>
          <TouchableWithoutFeedback >
            <TouchableWithoutFeedback>
              <View>
                <Text style={{
                  color: colors.text,
                  textAlign: 'center',
                  fontFamily: appFonts.medium,
                  fontSize: fontSizes.FONT4HALF,
                  marginBottom: windowHeight(1),
                  marginTop: windowHeight(2)
                }}>
                  {translateData.changeLanguage}
                </Text>

                {languageData?.data?.map(item => (
                  <View key={item.locale}>
                    <TouchableOpacity
                      style={[
                        styles.modalAlign,
                        { flexDirection: viewRtlStyle },
                      ]}
                      onPress={() => setSelectedLanguage(item.locale)}
                    >
                      <View
                        style={[
                          styles.selection,
                          { flexDirection: viewRtlStyle },
                        ]}
                      >
                        <Image
                          source={{ uri: item.flag }}
                          style={styles.imageCountry}
                        />
                        <Text
                          style={[
                            styles.name,
                            {
                              color: colors.text,
                              fontWeight:
                                selectedLanguage === item.locale
                                  ? '500'
                                  : '300',
                            },
                          ]}
                        >
                          {item.name.toLowerCase()}
                        </Text>
                      </View>
                      <View style={{ left: windowHeight(1.5) }}>
                        <CustomRadioButton
                          selected={selectedLanguage === item.locale}
                        />
                      </View>
                    </TouchableOpacity>
                    <View
                      style={[
                        styles.borderBottom,
                        { borderColor: colors.border },
                      ]}
                    />
                  </View>
                ))}

                <TouchableOpacity
                  activeOpacity={0.7}

                  onPress={closeModal}
                  style={styles.buttonView}
                >
                  <Text style={styles.buttonTitle}>{translateData.update}</Text>
                </TouchableOpacity>
              </View>
            </TouchableWithoutFeedback>
          </TouchableWithoutFeedback>
        </BottomSheetView>
      </BottomSheet>
    </View>
  )
}
