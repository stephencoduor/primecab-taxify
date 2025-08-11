import { Image, View, TouchableOpacity, Text } from 'react-native'
import React, { useState, useEffect } from 'react'
import styles from '../styles'
import Icons from '../../../../utils/icons/icons'
import { launchImageLibrary } from 'react-native-image-picker'
import { setValue, getValue } from '../../../../utils/localstorage'
import { useTheme } from '@react-navigation/native'
import { windowHeight } from '../../../../theme/appConstant'

export function ImageContainer({ data, storeProfile }) {
  const [imageUri, setImageUri] = useState<string | undefined>(undefined)
  const { colors } = useTheme()
  const userName = data?.name || ''
  const firstLetter = userName.charAt(0).toUpperCase()

  useEffect(() => {
    const loadImageUri = async () => {
      try {
        const storedUri = await getValue('profile_image_uri')
        if (storedUri) {
          setImageUri(storedUri)
        } else {
          const img = data?.profile_image_url;
          if (img) {
            setImageUri(img)
          }
        }
      } catch (error) {
        console.error('Failed to load image URI from AsyncStorage:', error)
      }
    }
    loadImageUri()
  }, [])

  const selectImage = () => {
    const options = {
      mediaType: 'photo',
      maxWidth: 300,
      maxHeight: 300,
      quality: 1,
    }

    launchImageLibrary(options, async response => {
      if (response.didCancel) {
      } else if (response.error) {
      } else {
        const selectedImage = response?.assets[0]
        if (selectedImage) {
          storeProfile(selectedImage)
          const source = { uri: selectedImage.uri }
          setImageUri(source.uri)
          try {
            setValue('profile_image_uri', source.uri)
          } catch (error) {
            console.error('Failed to save image URI to AsyncStorage:', error)
          }
        }
      }
    })
  }



  return (
    <View style={{ marginTop: windowHeight(7) }}>

      <View
        style={[
          styles.profileImageView,
          { backgroundColor: colors.card, borderColor: colors.border },
        ]}
      >
        {imageUri ? (
          <Image style={styles.profileImage} source={{ uri: imageUri }} />
        ) : (
          <View style={styles.charImage}>
            <Text style={styles.firstLetter}>{firstLetter}</Text>
          </View>
        )}

        <TouchableOpacity
          activeOpacity={0.7}

          style={[
            styles.editIconContainer,
            { borderColor: colors.border, backgroundColor: colors.card },
          ]}
          onPress={selectImage}
        >
          <Icons.Camera />
        </TouchableOpacity>
      </View>
    </View>
  )
}
