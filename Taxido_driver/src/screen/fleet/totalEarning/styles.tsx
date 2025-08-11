import { StyleSheet } from "react-native";
import { windowHeight, fontSizes, windowWidth } from "../../../theme/appConstant";
import appColors from "../../../theme/appColors";
import appFonts from '../../../theme/appFonts'



const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    justifyContent: 'center',
    margin: windowHeight(2.5),
  },
  option: {
    paddingVertical: windowHeight(1.3),
    paddingHorizontal: windowHeight(4.5),
    backgroundColor: 'white',
    borderRadius: windowHeight(4),
    marginHorizontal: windowHeight(0.8),
  },
  selectedOption: {
    backgroundColor: appColors.primary,
  },
  optionText: {
    color: appColors.iconColor,
    fontWeight: 'bold',
    fontSize: fontSizes.FONT3HALF,

  },
  selectedText: {
    color: appColors.white,
    fontSize: fontSizes.FONT3HALF,
  },
  card: {
    backgroundColor: appColors.white,
    borderRadius: windowHeight(1),
    padding: windowHeight(2),
    margin: windowHeight(1),
    borderWidth: windowHeight(0.1),
    borderColor: appColors.border,
    width: '90%',
    alignSelf: 'center',
    bottom: windowHeight(1.5),
    height: windowHeight(33)

  },
  title: {
    fontSize: fontSizes.FONT4HALF,
    color: appColors.black,
    marginBottom: windowHeight(2.8),
    fontFamily: appFonts.medium,

    marginHorizontal: windowHeight(2.3),

  },
  chartContainer: {
    flexDirection: 'row',
    alignItems: 'flex-end',
    position: 'relative',
  },
  yAxisLabels: {
    justifyContent: 'space-between',
    height: windowHeight(23.3),
    paddingRight: windowHeight(1),
  },
  yAxisLabel: {
    fontSize: fontSizes.FONT3HALF,
    color: appColors.iconColor,
    fontFamily: appFonts.regular,
    textAlign: 'right',
    height: windowHeight(4.45),
  },
  svg: {
    overflow: 'visible',
  },
  tooltipContainer: {
    position: 'absolute',
    backgroundColor: 'rgba(255, 255, 255, 0.9)',
    paddingVertical: windowHeight(1),
    paddingHorizontal: 10,
    borderRadius: 8,
    alignItems: 'center',
    justifyContent: 'center',
  },
  tooltipText: {
    color: '#2EC4B6',
    fontWeight: 'bold',
    fontSize: 14,
  },
  tooltipArrow: {
    position: 'absolute',
    bottom: -8,
    width: 0,
    height: 0,
    borderLeftWidth: 8,
    borderRightWidth: 8,
    borderTopWidth: 8,
    borderStyle: 'solid',
    backgroundColor: 'transparent',
    borderLeftColor: 'transparent',
    borderRightColor: 'transparent',
    borderTopColor: 'rgba(255, 255, 255, 0.9)', 
  },
  scrollViewContent: {
  },
});

export default styles
