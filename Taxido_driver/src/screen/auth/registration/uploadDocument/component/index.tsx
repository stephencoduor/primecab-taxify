import React, { useState } from 'react';
import { View, Text, TouchableOpacity, Image, Modal, Pressable } from 'react-native';
import styles from './styles';
import { useTheme } from '@react-navigation/native';
import appColors from '../../../../../theme/appColors';
import { fontSizes, windowHeight, windowWidth } from '../../../../../theme/appConstant';
import appFonts from '../../../../../theme/appFonts';
import { useValues } from '../../../../../utils/context';
import Icons from '../../../../../utils/icons/icons';
import { useSelector } from 'react-redux';

type Props = {
  uploadedDocuments: Record<string, any>;
  handleDocumentUpload: (docType: string, source?: 'camera' | 'gallery') => void;
  documentType: string;
  label: string;
  expiryDate: string;
  needExpiryDate?: boolean;
  onPressDate?: (slug: string) => void;
};

const RenderUpload: React.FC<Props> = ({
  uploadedDocuments,
  handleDocumentUpload,
  documentType,
  label,
  expiryDate,
  needExpiryDate = false,
  onPressDate,
}) => {
  const { colors } = useTheme();
  const { textRtlStyle } = useValues();
  const [expanded, setExpanded] = useState(false);
  const [showUploadOptions, setShowUploadOptions] = useState(false);
  const { translateData } = useSelector((state) => state.setting);

  return (
    <>
      <TouchableOpacity
        activeOpacity={1}
        onPress={() => setExpanded(!expanded)}
        style={{
          backgroundColor: colors.card,
          borderRadius: windowHeight(0.8),
          borderWidth: windowHeight(0.15),
          borderColor: colors.border,
          paddingHorizontal: windowWidth(3),
          paddingVertical: windowHeight(2),
        }}
      >
        <View style={{ flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center' }}>
          <Text
            style={{
              color: appColors.black,
              fontSize: fontSizes.FONT3HALF,
              fontFamily: appFonts.medium,
              writingDirection: textRtlStyle,
            }}
          >
            {label}
          </Text>
          <Icons.LeftArrow style={{ transform: [{ rotate: expanded ? '90deg' : '0deg' }] }} />
        </View>

        {!expanded && uploadedDocuments[documentType]?.uri && (
          <Text
            style={{
              marginTop: windowHeight(0.5),
              color: appColors.price,
              fontSize: fontSizes.FONT3,
              fontFamily: appFonts.medium,
              writingDirection: textRtlStyle,
            }}
          >
            {translateData.complete}
          </Text>
        )}

        {expanded && (
          <View style={{ marginTop: windowHeight(2) }}>
            <TouchableOpacity
              activeOpacity={0.8}
              onPress={() => setShowUploadOptions(true)}
              style={{
                borderRadius: windowHeight(0.5),
                borderWidth: windowHeight(0.1),
                borderColor: colors.border,
                padding: windowHeight(1),
              }}
            >
              {uploadedDocuments[documentType]?.uri ? (
                <Image
                  source={{ uri: uploadedDocuments[documentType].uri }}
                  style={[styles.innerContainerImage, { borderColor: colors.border }]}
                />
              ) : (
                <View style={[styles.innerContainer, { borderColor: colors.border }]}>
                  <View style={styles.download}>
                    <Icons.Download color={appColors.secondaryFont} />
                  </View>
                  <Text style={styles.label}>{label}</Text>
                </View>
              )}
            </TouchableOpacity>

            {needExpiryDate && (
              <>
                <Text
                  style={{
                    marginTop: windowHeight(2),
                    marginBottom: windowHeight(0.8),
                    color: colors.text,
                    fontSize: fontSizes.FONT3HALF,
                    fontFamily: appFonts.medium,
                  }}
                >
                  {translateData.expiryDate}
                </Text>
                <TouchableOpacity
                  onPress={() => onPressDate?.(documentType)}
                  style={{
                    borderColor: appColors.border,
                    borderWidth: windowHeight(0.15),
                    borderRadius: windowHeight(0.5),
                    height: windowHeight(5.5),
                    justifyContent: 'center',
                    paddingHorizontal: windowWidth(2),
                  }}
                >
                  <Text
                    style={{
                      color: colors.text,
                      fontSize: fontSizes.FONT3HALF,
                      fontFamily: appFonts.regular,
                    }}
                  >
                    {expiryDate || translateData.expiryDate}
                  </Text>
                </TouchableOpacity>
              </>
            )}
          </View>
        )}
      </TouchableOpacity>

      <Modal
        visible={showUploadOptions}
        animationType="none"
        transparent
        onRequestClose={() => setShowUploadOptions(false)}
      >
        <Pressable
          onPress={() => setShowUploadOptions(false)}
          style={{
            flex: 1,
            backgroundColor: 'rgba(0,0,0,0.5)',
            justifyContent: 'center',
          }}
        >
          <View
            style={{
              backgroundColor: appColors.white,
              padding: windowHeight(1),
              borderRadius: windowHeight(1),
              width: '91%',
              alignSelf: 'center',

            }}
          >
            <TouchableOpacity style={{ alignSelf: 'flex-end', marginTop: windowHeight(1), right: windowHeight(0.8) }} onPress={() => setShowUploadOptions(false)}
            >
              <Icons.Close />
            </TouchableOpacity>
            <Text style={{ alignSelf: 'center', color: appColors.black, fontFamily: appFonts.medium, fontSize: fontSizes.FONT4HALF }}>{translateData.selectOne}</Text>
            <TouchableOpacity
              onPress={() => {
                setShowUploadOptions(false);
                handleDocumentUpload(documentType, 'gallery');
              }}
              style={{ paddingVertical: windowHeight(1.9) }}
            >
              <View style={{ flexDirection: 'row', alignItems: 'center', marginHorizontal: windowWidth(3) }}>
                <View style={{ backgroundColor: appColors.cardicon, height: windowHeight(5), width: windowHeight(5), borderRadius: windowHeight(3), alignSelf: 'center', justifyContent: 'center', alignItems: 'center' }}>
                  <Icons.Gallery />
                </View>
                <Text style={{ fontSize: fontSizes.FONT3HALF, fontFamily: appFonts.medium, marginHorizontal: windowWidth(3) }}>
                  {translateData.chooseFromGallery}
                </Text>
              </View>
              <View style={{ borderWidth: windowHeight(0.1), borderColor: appColors.border, width: '92%', alignSelf: 'center', top: windowHeight(1.5) }} />
            </TouchableOpacity>
            <TouchableOpacity
              onPress={() => {
                setShowUploadOptions(false);
                handleDocumentUpload(documentType, 'camera');
              }}
              style={{ paddingVertical: windowHeight(1) }}
            >
              <View style={{ flexDirection: 'row', alignItems: 'center', marginHorizontal: windowWidth(3) }}>
                <View style={{ backgroundColor: appColors.cardicon, height: windowHeight(5), width: windowHeight(5), borderRadius: windowHeight(3), alignSelf: 'center', justifyContent: 'center', alignItems: 'center' }}>
                  <Icons.Camera1 />

                </View>
                <Text style={{ fontSize: fontSizes.FONT3HALF, fontFamily: appFonts.medium, marginHorizontal: windowWidth(3) }}>
                  {translateData.openCamera}
                </Text>
              </View>
            </TouchableOpacity>

          </View>
        </Pressable>
      </Modal>
    </>
  );
};

export default RenderUpload;
