export interface AuthInterface { }

export interface DriverLoginInterface {
  email_or_phone?: string
  country_code?: string
  fcm_token: string | null
}

export interface VerifyOtpInterface {
  email_or_phone: string | null
  country_code: string | null
  token: number | null | string
  email: string | null
  fcm_token: string | null
}
export interface UserLoginEmailInterface {
  email?: string
}

export interface DriverRegistrationPayload { }

export interface UserLoginInterface { }


export interface FirebaseOTPInterface {
  phone?:number,
  country_code?: string;
  firebase_token?: string | null,

}
