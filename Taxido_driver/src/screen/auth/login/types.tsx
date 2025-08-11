interface LoginViewProps {
  googleLogin?: () => void
  appleLogin?: () => void
  gotoOTP?: () => void
  gotoRegistration?: () => void
  phoneNumber?: string
  setPhoneNumber?: string
  countryCode?: string
  setCountryCode?: string
  demouser?: string
  gotoOTP1?: () => void
  setDemouser?: () => void
  fleetLoading: boolean;
  driverLoading: boolean;
  setFleetLoading: (value: boolean) => void;
  setDriverLoading: (value: boolean) => void;
  smsGateway: string;

}
export default LoginViewProps
