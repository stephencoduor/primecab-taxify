import React, { useCallback, useMemo, useRef, useState } from 'react';
import { Text, StyleSheet, Button } from 'react-native';
import { GestureHandlerRootView } from 'react-native-gesture-handler';
import BottomSheet, {BottomSheetView,BottomSheetBackdrop} from '@gorhom/bottom-sheet';
import appColors from '../theme/appColors';
import { useSelector } from 'react-redux';

const BottomSheet1 = () => {
  const bottomSheetRef = useRef<BottomSheet>(null);
  const [isBottomSheetOpen, setIsBottomSheetOpen] = useState(false);
  const { translateData } = useSelector((state) => state.setting);
  const snapPoints = useMemo(() => ['40%', '80%'], []);

  const handleSheetChanges = useCallback((index: number) => {
    setIsBottomSheetOpen(index !== -1); 
  }, []);

  const openSheet = () => {
    bottomSheetRef.current?.expand();
  };

  const renderBackdrop = useCallback(
    (props: any) => (
      <BottomSheetBackdrop
        {...props}
        pressBehavior="close" 
        appearsOnIndex={0}
        disappearsOnIndex={-1}
      />
    ),
    []
  );

  return (
    <GestureHandlerRootView style={styles.container}>
      <Button title={translateData.openBottomSheet} onPress={openSheet} />
      <BottomSheet
        ref={bottomSheetRef}
        index={-1}
        snapPoints={snapPoints}
        onChange={handleSheetChanges}
        backdropComponent={renderBackdrop}
        enablePanDownToClose={true} 
         handleIndicatorStyle={{ backgroundColor: appColors.primary,width:'13%' }}
      >
        <BottomSheetView style={styles.contentContainer}>
          <Text style={styles.sheetText}>Hello from Bottom Sheet!</Text>
        </BottomSheetView>
      </BottomSheet>
    </GestureHandlerRootView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'white',
    justifyContent: 'center',
  },
  contentContainer: {
    flex: 1,
    padding: 36,
    alignItems: 'center',
  },
  sheetText: {
    fontSize: 18,
  },
});

export default BottomSheet1;
