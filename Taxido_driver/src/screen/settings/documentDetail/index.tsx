import React, { useEffect, useState } from 'react'
import { ScrollView, View, Text, TouchableOpacity, Image } from 'react-native'
import DocumentPicker, { DocumentPickerResponse } from 'react-native-document-picker'
import appColors from '../../../theme/appColors'
import { useNavigation, useRoute, useTheme } from '@react-navigation/native'
import { TitleView } from '../../auth/component'
import styles from '../../auth/registration/documentVerify/styles'
import { NativeStackNavigationProp } from '@react-navigation/native-stack'
import { RootStackParamList } from '../../../navigation/main/types'
import { Header, Button, notificationHelper } from '../../../commonComponents'
import { useDispatch, useSelector } from 'react-redux'
import { selfDriverData, documentGet } from '../../../api/store/action'
import documentstyles from './styles'
import Icons from '../../../utils/icons/icons'
import { getValue } from '../../../utils/localstorage'
import { windowHeight } from '../chat/context'
import { fontSizes, windowWidth } from '../../../theme/appConstant'
import { URL } from '../../../api/config'
import appFonts from '../../../theme/appFonts'
import { useValues } from '../../../utils/context'

type ProfileScreenProps = NativeStackNavigationProp<RootStackParamList>

export function DocumentDetail() {
  const { colors } = useTheme()
  const { goBack } = useNavigation<ProfileScreenProps>()
  const dispatch = useDispatch()
  const { selfDriver } = useSelector(state => state.account)
  const { documentData } = useSelector(state => state.documents)
  const { translateData } = useSelector(state => state.setting)
  const [uploadedDocuments, setUploadedDocuments] = useState<{ [slug: string]: DocumentPickerResponse | null }>({})
  const [showWarning, setShowWarning] = useState<{ [slug: string]: boolean }>({})
  const [documentLoad, setDocumentLoad] = useState(false)
  const [expandedDocuments, setExpandedDocuments] = useState<{ [slug: string]: boolean }>({})
  const { isDark } = useValues()

  const route = useRoute()
  const { NavValue } = route.params || {}

  useEffect(() => {
    dispatch(selfDriverData())
    dispatch(documentGet())
  }, [])

  useEffect(() => {
    if (selfDriver?.documents && documentData?.data?.length) {
      const newUploadedDocuments: { [slug: string]: DocumentPickerResponse | null } = {}
      documentData.data.forEach(doc => {
        const matched = selfDriver.documents.find(
          d => d.document?.id === doc.id || d.document_id === doc.id,
        )
        newUploadedDocuments[doc.slug] = matched
          ? {
            uri: matched.document_image_url || '',
            name: matched.document_no || '',
            type: 'image/jpeg',
            status: matched?.status,
            expired_at: matched?.expired_at,
          }
          : null
      })
      setUploadedDocuments(newUploadedDocuments)
    }
  }, [selfDriver, documentData])


  const handleDocumentPick = async (slug: string) => {
    try {
      const res = await DocumentPicker.pick({
        type: [DocumentPicker.types.images],
      })
      const selectedFile = Array.isArray(res) ? res[0] : res

      setUploadedDocuments(prev => ({
        ...prev,
        [slug]: {
          ...selectedFile,
          status: 'pending',
        },
      }))

      setShowWarning(prev => ({
        ...prev,
        [slug]: false,
      }))
    } catch (err) {
      if (!DocumentPicker.isCancel(err)) {
        console.error('Document pick error', err)
      }
    }
  }

  const toggleDocumentPreview = (slug: string) => {
    setExpandedDocuments(prev => ({
      ...prev,
      [slug]: !prev[slug],
    }))
  }

  const gotoDocument = async () => {
    setDocumentLoad(true)
    const newWarnings: { [slug: string]: boolean } = {}
    const token = await getValue('token')

    documentData?.data?.forEach(doc => {
      if (!uploadedDocuments[doc.slug]) {
        newWarnings[doc.slug] = true
      }
    })

    if (Object.keys(newWarnings).length > 0) {
      setShowWarning(newWarnings)
      setDocumentLoad(false)
    } else {
      setShowWarning({})
      const formData = new FormData()

      Object.entries(uploadedDocuments).forEach(([slug, file], index) => {
        if (file) {
          formData.append(`documents[${index}][slug]`, slug)
          formData.append(`documents[${index}][file]`, {
            uri: file.uri,
            type: file.type,
            name: file.name,
          })
        }
      })

      const missingFields = documentData?.data
        ?.filter(doc => {
          const file = uploadedDocuments[doc.slug]
          return !file?.uri
        })
        ?.map(doc => doc.name)

      if (missingFields?.length > 0) {
        notificationHelper(
          '',
          `${translateData.pleaseUpload}${missingFields.length > 1 ? 's' : ''}:\n\n${missingFields.join(', ')}`,
          'error'
        )
        setDocumentLoad(false)
        return
      }

      const response = await fetch(`${URL}/api/update/document`, {
        method: 'POST',
        body: formData,
        headers: {
          'Content-Type': 'multipart/form-data',
          Accept: 'application/json',
          Authorization: `Bearer ${token}`,
        },
      })

      const rawText = await response.text()
      const responseData = JSON.parse(rawText)


      if (!response.ok) {
        console.error('HTTP error! Status:', response.status)
        notificationHelper('', responseData.message, 'error')
        setDocumentLoad(false)
        return
      }

      setDocumentLoad(false)
      goBack()
      notificationHelper('', translateData.detailsUpdateSuccessfully, 'success')
    }
  }


  const driverDocs = documentData?.data?.filter((doc) => doc.type === 'driver');


  const vehicleDocs = documentData?.data?.filter(doc => doc.type === 'vehicle');

  return (
    <View style={documentstyles.container}>
      <Header title={translateData.documentRegistration} />
      <ScrollView style={styles.main} showsVerticalScrollIndicator={false}>
        <View style={[styles.sub, { backgroundColor: colors.background }]}>
          <View style={styles.spaceHorizantal}>
            {driverDocs?.length > 0 && (
              <>
                <TitleView
                  title={translateData.documentVerify}
                  subTitle={translateData.registerContent}
                />
                <View>
                  {driverDocs?.map(doc => {
                    const picked = uploadedDocuments[doc.slug]
                    const isExpanded = expandedDocuments[doc.slug]


                    return (
                      <View
                        style={{
                          backgroundColor: isDark ? appColors.darkThemeSub : appColors.white,
                          padding: windowHeight(5),
                          borderRadius: windowHeight(5),
                          borderWidth: 1,
                          borderColor: isDark ? appColors.darkBorderBlack : appColors.border,
                          marginBottom: windowHeight(15),
                        }}
                      >

                        <View>
                          <TouchableOpacity
                            onPress={() => toggleDocumentPreview(doc.slug)}
                            style={{
                              flexDirection: 'row',
                              justifyContent: 'space-between',
                              alignItems: 'center',
                              marginBottom: windowHeight(8),
                              paddingHorizontal: windowWidth(2.5),
                              top: windowHeight(3)
                            }}
                          >
                            <Text
                              style={{
                                fontSize: fontSizes.FONT3HALF,
                                color: isDark ? appColors.darkText : appColors.primaryFont,
                                fontFamily: appFonts.medium,
                              }}
                            >
                              {doc.name}
                            </Text>
                            <Icons.LeftArrow
                              style={{
                                transform: [{ rotate: isExpanded ? '90deg' : '-90deg' }],
                              }}
                              color={isDark ? appColors.darkText : appColors.primaryFont}
                            />

                          </TouchableOpacity>

                          {!isExpanded && (
                            <View style={{ bottom: windowHeight(5), marginHorizontal: windowWidth(2.7) }}>
                              {picked?.status === 'approved' && (
                                <Text style={{ color: appColors.price, fontSize: fontSizes.FONT3 }}>
                                  {translateData.verified}
                                </Text>
                              )}
                              {picked?.status === 'pending' && (
                                <Text style={{ color: appColors.completeColor, fontSize: fontSizes.FONT3 }}>
                                  {translateData.pending}
                                </Text>
                              )}
                              {picked?.status === 'rejected' && (
                                <Text style={{ color: appColors.red, fontSize: fontSizes.FONT3 }}>
                                  {translateData.rejected}
                                </Text>
                              )}
                            </View>
                          )}
                        </View>


                        {isExpanded && picked?.uri && (
                          <View>
                            <View
                              style={{
                                borderWidth: windowHeight(1.3),
                                width: '93.9%',
                                height: 100,
                                alignItems: 'center',
                                justifyContent: 'center',
                                borderRadius: windowHeight(3),
                                borderStyle: 'dotted',
                                borderColor: appColors.grayRound,
                                marginTop: windowHeight(5),
                                alignSelf: 'center'
                              }}
                            >
                              <Image source={{ uri: picked.uri }} style={documentstyles.uri} />
                            </View>

                            {picked?.status === 'approved' && (
                              <View
                                style={{
                                  backgroundColor: '#E9F7ED',
                                  marginTop: windowHeight(15),
                                  paddingVertical: windowHeight(8),
                                  paddingHorizontal: windowWidth(4),
                                  borderRadius: windowHeight(4),
                                  alignItems: 'center',
                                  flexDirection: 'row',
                                  justifyContent: 'space-between',
                                  width: '93.9%',
                                  alignSelf: 'center',
                                  marginBottom: windowHeight(2)
                                }}
                              >
                                <Text
                                  style={{
                                    color: appColors.price,
                                    fontSize: fontSizes.FONT3HALF,
                                    fontFamily: appFonts.medium,
                                  }}
                                >
                                  {translateData.verified}
                                </Text>
                                <Icons.Verified />
                              </View>
                            )}

                            {picked?.status === 'pending' && (
                              <View
                                style={{
                                  backgroundColor: appColors.lightYellow,
                                  marginTop: windowHeight(15),
                                  paddingVertical: windowHeight(8),
                                  paddingHorizontal: windowWidth(4),
                                  borderRadius: windowHeight(3),
                                  alignItems: 'center',
                                  flexDirection: 'row',
                                  justifyContent: 'space-between',
                                  marginBottom: windowHeight(2),
                                  width: '93.9%',
                                  alignSelf: 'center',

                                }}
                              >
                                <Text
                                  style={{
                                    color: appColors.completeColor,
                                    fontSize: fontSizes.FONT3HALF,
                                    fontFamily: appFonts.medium,
                                  }}
                                >
                                  {translateData.pending}
                                </Text>
                                <TouchableOpacity onPress={() => handleDocumentPick(doc.slug)}>
                                  <Icons.edit color="#60A5FA" />
                                </TouchableOpacity>
                              </View>
                            )}

                            {picked?.status === 'rejected' && (
                              <View
                                style={{
                                  backgroundColor: appColors.lightRed,
                                  marginTop: windowHeight(15),
                                  paddingVertical: windowHeight(8),
                                  paddingHorizontal: windowWidth(4),
                                  borderRadius: windowHeight(3),
                                  alignItems: 'center',
                                  flexDirection: 'row',
                                  justifyContent: 'space-between',
                                  marginBottom: windowHeight(2),
                                  width: '93.9%',
                                  alignSelf: 'center',
                                }}
                              >
                                <Text
                                  style={{
                                    color: appColors.red,
                                    fontSize: fontSizes.FONT3HALF,
                                    fontFamily: appFonts.medium,
                                  }}
                                >
                                  {translateData.rejected}
                                </Text>
                                <TouchableOpacity onPress={() => handleDocumentPick(doc.slug)}>
                                  <Icons.edit color="#60A5FA" />
                                </TouchableOpacity>
                              </View>
                            )}
                            {picked?.status === 'approved' && picked?.expired_at && (
                              <View
                                style={{
                                  marginTop: windowHeight(10),
                                  flexDirection: 'row',
                                  justifyContent: 'space-between',
                                  paddingHorizontal: windowWidth(3),
                                  marginBottom: picked?.expired_at ? windowHeight(5) : windowHeight(5),

                                }}
                              >
                                <Text style={{ color: isDark ? appColors.white : appColors.primaryFont, fontFamily: appFonts.regular }}>
                                  {translateData.expireon}
                                </Text>
                                <Text style={{ color: isDark ? appColors.white : appColors.primaryFont, fontFamily: appFonts.regular }}>
                                  {new Date(picked?.expired_at).toISOString().split('T')[0]}
                                </Text>
                              </View>
                            )}
                          </View>
                        )}
                        {showWarning[doc.slug] && (
                          <Text style={documentstyles.fieldrequired}>
                            {`${doc.name} ${translateData.fieldrequired}`}
                          </Text>
                        )}
                      </View>

                    )
                  })}
                </View>
              </>
            )}
            <View style={{ borderColor: isDark ? appColors.darkThemeSub : appColors.border, borderWidth: windowHeight(0.5), width: '99%', alignSelf: 'center', marginTop: windowHeight(8) }} />
            {vehicleDocs?.length > 0 && (
              <>
                <TitleView
                  title={translateData.documentVerify}
                  subTitle={translateData.registerContent}
                />
                <View>
                  {vehicleDocs?.map(doc => {
                    const picked = uploadedDocuments[doc.slug]
                    const isExpanded = expandedDocuments[doc.slug]

                    return (
                      <View
                        style={{
                          backgroundColor: appColors.white,
                          padding: windowHeight(5),
                          borderRadius: windowHeight(5),
                          borderWidth: 1,
                          borderColor: appColors.border,
                          marginBottom: windowHeight(15),
                        }}
                      >

                        <View>
                          <TouchableOpacity
                            onPress={() => toggleDocumentPreview(doc.slug)}
                            style={{
                              flexDirection: 'row',
                              justifyContent: 'space-between',
                              alignItems: 'center',
                              marginBottom: windowHeight(8),
                              paddingHorizontal: windowWidth(2.5),
                              top: windowHeight(3)
                            }}
                          >
                            <Text
                              style={{
                                fontSize: fontSizes.FONT3HALF,
                                color: appColors.primaryFont,
                                fontFamily: appFonts.medium,
                              }}
                            >
                              {doc.name}
                            </Text>
                            <Icons.LeftArrow
                              style={{
                                transform: [{ rotate: isExpanded ? '90deg' : '-90deg' }],
                              }}
                            />

                          </TouchableOpacity>

                          {!isExpanded && (
                            <View style={{ bottom: windowHeight(5), marginHorizontal: windowWidth(2.7) }}>
                              {picked?.status === 'approved' && (
                                <Text style={{ color: appColors.price, fontSize: fontSizes.FONT3 }}>
                                  {translateData.verified}
                                </Text>
                              )}
                              {picked?.status === 'pending' && (
                                <Text style={{ color: appColors.completeColor, fontSize: fontSizes.FONT3 }}>
                                  {translateData.pending}
                                </Text>
                              )}
                              {picked?.status === 'rejected' && (
                                <Text style={{ color: appColors.red, fontSize: fontSizes.FONT3 }}>
                                  {translateData.rejected}
                                </Text>
                              )}
                            </View>
                          )}
                        </View>


                        {isExpanded && picked?.uri && (
                          <View>
                            <View
                              style={{
                                borderWidth: windowHeight(1.3),
                                width: '93.9%',
                                height: 100,
                                alignItems: 'center',
                                justifyContent: 'center',
                                borderRadius: windowHeight(3),
                                borderStyle: 'dotted',
                                borderColor: appColors.grayRound,
                                marginTop: windowHeight(5),
                                alignSelf: 'center'
                              }}
                            >
                              <Image source={{ uri: picked.uri }} style={documentstyles.uri} />
                            </View>

                            {picked?.status === 'approved' && (
                              <View
                                style={{
                                  backgroundColor: '#E9F7ED',
                                  marginTop: windowHeight(15),
                                  paddingVertical: windowHeight(8),
                                  paddingHorizontal: windowWidth(4),
                                  borderRadius: windowHeight(4),
                                  alignItems: 'center',
                                  flexDirection: 'row',
                                  justifyContent: 'space-between',
                                  width: '93.9%',
                                  alignSelf: 'center',
                                  marginBottom: windowHeight(2)
                                }}
                              >
                                <Text
                                  style={{
                                    color: appColors.price,
                                    fontSize: fontSizes.FONT3HALF,
                                    fontFamily: appFonts.medium,
                                  }}
                                >
                                  {translateData.verified}
                                </Text>
                                <Icons.Verified />
                              </View>
                            )}

                            {picked?.status === 'pending' && (
                              <View
                                style={{
                                  backgroundColor: appColors.lightYellow,
                                  marginTop: windowHeight(15),
                                  paddingVertical: windowHeight(8),
                                  paddingHorizontal: windowWidth(4),
                                  borderRadius: windowHeight(3),
                                  alignItems: 'center',
                                  flexDirection: 'row',
                                  justifyContent: 'space-between',
                                  marginBottom: windowHeight(2),
                                  width: '93.9%',
                                  alignSelf: 'center',

                                }}
                              >
                                <Text
                                  style={{
                                    color: appColors.completeColor,
                                    fontSize: fontSizes.FONT3HALF,
                                    fontFamily: appFonts.medium,
                                  }}
                                >
                                  {translateData.pending}
                                </Text>
                                <TouchableOpacity onPress={() => handleDocumentPick(doc.slug)}>
                                  <Icons.edit color="#60A5FA" />
                                </TouchableOpacity>
                              </View>
                            )}

                            {picked?.status === 'rejected' && (
                              <View
                                style={{
                                  backgroundColor: appColors.lightRed,
                                  marginTop: windowHeight(15),
                                  paddingVertical: windowHeight(8),
                                  paddingHorizontal: windowWidth(4),
                                  borderRadius: windowHeight(3),
                                  alignItems: 'center',
                                  flexDirection: 'row',
                                  justifyContent: 'space-between',
                                  marginBottom: windowHeight(2),
                                  width: '93.9%',
                                  alignSelf: 'center',


                                }}
                              >
                                <Text
                                  style={{
                                    color: appColors.red,
                                    fontSize: fontSizes.FONT3HALF,
                                    fontFamily: appFonts.medium,
                                  }}
                                >
                                  {translateData.rejected}
                                </Text>
                                <TouchableOpacity onPress={() => handleDocumentPick(doc.slug)}>
                                  <Icons.edit color="#60A5FA" />
                                </TouchableOpacity>
                              </View>
                            )}
                            {picked?.status === 'approved' && picked?.expired_at && (
                              <View
                                style={{
                                  marginTop: windowHeight(10),
                                  flexDirection: 'row',
                                  justifyContent: 'space-between',
                                  paddingHorizontal: windowWidth(3),
                                  marginBottom: picked?.expired_at ? windowHeight(5) : windowHeight(5),

                                }}
                              >
                                <Text style={{ color: appColors.primaryFont, fontFamily: appFonts.regular }}>
                                  {translateData.expireon}
                                </Text>
                                <Text style={{ color: appColors.primaryFont, fontFamily: appFonts.regular }}>
                                  {new Date(picked.expired_at).toISOString().split('T')[0]}
                                </Text>
                              </View>
                            )}
                          </View>
                        )}

                        {showWarning[doc.slug] && (
                          <Text style={documentstyles.fieldrequired}>
                            {`${doc.name} ${translateData.fieldrequired}`}
                          </Text>
                        )}
                      </View>
                    )
                  })}
                </View>
              </>
            )}
          </View>

          <View style={{ flex: 0.1, marginBottom: windowHeight(10) }}>
            <Button
              onPress={gotoDocument}
              title={translateData.update}
              backgroundColor={appColors.primary}
              color={appColors.white}
              loading={documentLoad}
            />
          </View>

        </View>
      </ScrollView>
    </View>
  )
}
