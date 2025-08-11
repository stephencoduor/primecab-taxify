import React, { useState, useEffect } from 'react';
import { ScrollView, View, Text, Platform } from 'react-native';
import { launchCamera, launchImageLibrary } from 'react-native-image-picker';
import appColors from '../../../../theme/appColors';
import { ProgressBar } from '../component';
import { useNavigation, useTheme } from '@react-navigation/native';
import { Header, TitleView } from '../../component';
import styles from '../../registration/documentVerify/styles';
import { useValues } from '../../../../utils/context';
import { useDispatch, useSelector } from 'react-redux';
import { documentGet } from '../../../../api/store/action/documentAction';
import RenderUpload from './component';
import { Button } from '../../../../commonComponents';
import { windowHeight } from '../../../../theme/appConstant';
import DateTimePicker from '@react-native-community/datetimepicker';
import { getValue } from '../../../../utils/localstorage';

export function UploadedDocument() {
  const { navigate } = useNavigation();
  const dispatch = useDispatch();
  const { colors } = useTheme();
  const { textRtlStyle, setDocumentDetail, isDark } = useValues();
  const { documentData } = useSelector((state) => state.documents);
  const { translateData } = useSelector((state) => state.setting);
  const [uploadedDocuments, setUploadedDocuments] = useState<Record<string, any>>({});
  const [expiryDates, setExpiryDates] = useState<Record<string, string | null>>({});
  const [showWarning, setShowWarning] = useState<Record<string, boolean>>({});
  const [showDatePicker, setShowDatePicker] = useState({ visible: false, slug: null });

  useEffect(() => {
    dispatch(documentGet());
  }, []);


  const handleDocumentUpload = async (documentType: string, source: 'camera' | 'gallery' = 'gallery') => {
    try {
      const options = { mediaType: 'photo', quality: 1 };
      const res = source === 'camera' ? await launchCamera(options) : await launchImageLibrary(options);

      if (res?.assets?.length > 0) {
        const file = res.assets[0];
        setUploadedDocuments((prev) => ({
          ...prev,
          [documentType]: {
            uri: file.uri!,
            type: file.type!,
            name: file.fileName || `file_${Date.now()}`,
          },
        }));
        setShowWarning((prev) => ({ ...prev, [documentType]: false }));
      }
    } catch (err) {
      console.error('Upload error:', err);
    }
  };

  const onDateChange = (event, selectedDate) => {
    const currentSlug = showDatePicker.slug;

    if (event.type === 'set' && selectedDate && currentSlug) {
      const formattedDate = new Date(selectedDate).toISOString().split('T')[0];

      const updatedDates = {
        ...expiryDates,
        [currentSlug]: formattedDate,
      };

      setExpiryDates(updatedDates);

      Object.entries(updatedDates).forEach(([slug, date]) => {
      });
    } else {
    }

    setShowDatePicker({ visible: false, slug: null });
  };


  const driverDocs = documentData?.data?.filter((doc) => doc.type === 'driver') || [];
  const vehicleDocs = documentData?.data?.filter((doc) => doc.type === 'vehicle') || [];
  const gotoDocument = async () => {
    let hasErrors = false;
    const warnings: Record<string, boolean> = {};

    documentData?.data?.forEach((doc) => {
      const uploaded = uploadedDocuments[doc.slug];
      const requiresDate = doc.need_expired_date === 1;
      if (!uploaded || (requiresDate && !expiryDates[doc.slug])) {
        warnings[doc.slug] = true;
        hasErrors = true;
      }
    });

    setShowWarning(warnings);
    if (hasErrors) return;

    const finalData = Object.keys(uploadedDocuments).reduce((acc, key) => {
      acc[key] = {
        file: uploadedDocuments[key],
        expiryDate: expiryDates[key] ?? null,
      };
      return acc;
    }, {});

    setDocumentDetail(finalData);

    const userType = await getValue('userType');
    if (userType === 'driver') {
      navigate('VehicleRegistration');
    } else if (userType === 'fleet') {
      navigate('FleetDetails');
    } else {
      navigate('VehicleRegistration');
    }
  };


  const getValidDate = (value) => {
    const date = new Date(value);
    return isNaN(date.getTime()) ? new Date() : date;
  };


  return (
    <View style={{ flex: 1 }}>
      <Header backgroundColor={isDark ? colors.card : appColors.white} />
      <ProgressBar fill={2} />

      <ScrollView style={styles.main} showsVerticalScrollIndicator={false}>
        <View style={[styles.sub, { backgroundColor: colors.background }]}>

          <View style={styles.spaceHorizantal}>
            {driverDocs?.length > 0 && (
              <>
                <TitleView
                  title={translateData.driverDocuments}
                  subTitle={translateData.equireddocumentsdriver}
                />
                {driverDocs.map((doc) => (
                  <View key={doc.id} style={styles.dateContainer}>
                    <RenderUpload
                      uploadedDocuments={uploadedDocuments}
                      handleDocumentUpload={handleDocumentUpload}
                      documentType={doc.slug}
                      label={`${translateData.upload} ${doc.name}`}
                      expiryDate={expiryDates[doc.slug]}
                      needExpiryDate={doc.need_expired_date === 1}
                      onPressDate={(slug) =>
                        setShowDatePicker({ visible: true, slug })
                      }
                    />

                    {showWarning[doc.slug] && (
                      <Text
                        style={[
                          styles.titleText,
                          {
                            textAlign: textRtlStyle,
                            color: appColors.red,
                            marginTop: 5,
                          },
                        ]}
                      >
                        {uploadedDocuments[doc.slug] &&
                          doc.need_expired_date === 1 &&
                          !expiryDates[doc.slug]
                          ? translateData.expiryDateRequired
                          : `${doc.name} ${translateData.isRequired}`}
                      </Text>
                    )}
                  </View>
                ))}
              </>
            )}
            <View style={{ borderColor: appColors.border, borderWidth: windowHeight(0.1), marginTop: windowHeight(0.8) }}></View>

            {vehicleDocs?.length > 1 && (
              <View style={{ marginTop: windowHeight(1) }}>
                <TitleView
                  title={translateData.vehicleDocuments}
                  subTitle={translateData.requireddocumentsforverification}
                />
                {vehicleDocs.map((doc) => (
                  <View key={doc.id} style={styles.dateContainer}>
                    <RenderUpload
                      uploadedDocuments={uploadedDocuments}
                      handleDocumentUpload={handleDocumentUpload}
                      documentType={doc.slug}
                      label={`${translateData.upload} ${doc.name}`}
                      expiryDate={expiryDates[doc.slug]}
                      needExpiryDate={doc.need_expired_date === 1}
                      onPressDate={(slug) =>
                        setShowDatePicker({ visible: true, slug })
                      }
                    />

                    {showWarning[doc.slug] && (
                      <Text
                        style={[
                          styles.titleText,
                          {
                            textAlign: textRtlStyle,
                            color: appColors.red,
                            marginTop: 5,
                          },
                        ]}
                      >
                        {uploadedDocuments[doc.slug] &&
                          doc.need_expired_date === 1 &&
                          !expiryDates[doc.slug]
                          ? translateData.expiryDateRequired
                          : `${doc.name} ${translateData.isRequired}`}
                      </Text>
                    )}
                  </View>
                ))}
              </View>
            )}
          </View>

        </View>
      </ScrollView>

      <View style={styles.buttonView}>
        <Button
          onPress={gotoDocument}
          title={translateData.next}
          backgroundColor={appColors.primary}
          color={appColors.white}
        />
      </View>

      {showDatePicker.visible && showDatePicker.slug && (
        <DateTimePicker
          value={getValidDate(expiryDates[showDatePicker.slug])}
          mode="date"
          display={Platform.OS === 'ios' ? 'spinner' : 'default'}
          onChange={onDateChange}
          minimumDate={new Date()}
        />
      )}
    </View>
  );

}