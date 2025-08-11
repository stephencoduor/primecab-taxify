import { StyleSheet } from "react-native";
import { windowHeight, fontSizes, windowWidth } from "../../../../theme/appConstant";
import appColors from "../../../../theme/appColors";

const styles = StyleSheet.create({
    subView: {
        height: '100%',
    },
    space: {
        marginHorizontal: windowWidth(4),
        marginTop: windowHeight(0.8),
    },
    margin: {
        marginVertical: windowHeight(2),
        marginBottom: windowHeight(1.8),
      },
})
export default styles;