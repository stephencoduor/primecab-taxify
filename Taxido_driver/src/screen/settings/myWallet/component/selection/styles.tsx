import { StyleSheet } from 'react-native'
import appFonts from '../../../../../theme/appFonts'
import { windowHeight, windowWidth } from '../../../../../theme/appConstant'
import appColors from '../../../../../theme/appColors';


const styles = StyleSheet.create({
  selection: {
    height: windowHeight(6),
    marginHorizontal: windowWidth(4),
    borderRadius: windowHeight(1),
    marginTop: windowHeight(1.5),
    top: windowHeight(0.5)
  },
  container: {
    flexDirection: 'row',
    alignSelf: 'center',
  },
  tab: {
    flex: 1,
    paddingVertical: windowHeight(2),
    alignItems: 'center',
    justifyContent: 'center',
  },
  leftTab: {
    borderTopLeftRadius: windowHeight(1),
    borderBottomLeftRadius: windowHeight(1),
    borderTopRightRadius: windowHeight(1),
    borderBottomRightRadius: windowHeight(1),
  },
  rightTab: {
    borderTopRightRadius: windowHeight(1),
    borderBottomRightRadius: windowHeight(1),
    borderTopLeftRadius: windowHeight(1),
    borderBottomLeftRadius: windowHeight(1),
  },
  activeTab: {
    backgroundColor: appColors.primary,
  },
  inactiveTab: {
    backgroundColor: appColors.white,

  },
  activeText: {
    color: appColors.white,
    fontFamily: appFonts.medium,
  },
  inactiveText: {
    color: appColors.iconColor,
    fontFamily: appFonts.medium,
  },
});
export default styles
