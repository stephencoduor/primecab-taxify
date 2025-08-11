import * as React from "react"
import { SVGProps } from "react"
import Svg, { Path } from "react-native-svg"

const SvgComponent = (props: SVGProps<SVGSVGElement>) => (
  <Svg
    xmlns="http://www.w3.org/2000/svg"
    width={20}
    height={20}
    fill="none"
    {...props}
  >
    <Path
      fill="#199675"
      d="M14.999 4.997a1.37 1.37 0 0 1-1.209-.741l-.6-1.209c-.383-.758-1.383-1.383-2.233-1.383H9.05c-.858 0-1.858.625-2.242 1.383l-.6 1.209c-.233.45-.7.741-1.208.741a3.128 3.128 0 0 0-3.125 3.325l.433 6.884c.1 1.716 1.025 3.125 3.325 3.125h8.734c2.3 0 3.216-1.409 3.325-3.125l.433-6.884a3.128 3.128 0 0 0-3.125-3.325ZM8.749 6.04h2.5a.63.63 0 0 1 .625.625.63.63 0 0 1-.625.625h-2.5a.63.63 0 0 1-.625-.625.63.63 0 0 1 .625-.625Zm1.25 9.058a2.818 2.818 0 0 1-2.817-2.816A2.813 2.813 0 0 1 10 9.464a2.813 2.813 0 0 1 2.816 2.817A2.819 2.819 0 0 1 10 15.097Z"
    />
  </Svg>
)
export default SvgComponent