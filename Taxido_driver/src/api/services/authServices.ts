import {
  login,
  register,
  verifyOtp,
  mailLogin,
  FirebaseAuth,
} from '../endpoints/authEndPoints'
import {
  DriverLoginInterface,
  DriverRegistrationPayload,
  VerifyOtpInterface,
  UserLoginEmailInterface,
  FirebaseOTPInterface,
} from '../interface/authInterface'
import { GET_API, POST_API } from '../methods'

export const userLogin = async (data: DriverLoginInterface) => {
  return POST_API(data, login)
    .then(res => {
      return res
    })
    .catch(e => {
      return e?.response
    })
}

export const userVerifyOtp = async (data: VerifyOtpInterface) => {
  return POST_API(data, verifyOtp)
    .then(res => {
      return res
    })
    .catch(e => {
      return e?.response
    })
}

export const userRegistration = async (data: DriverRegistrationPayload) => {
  return POST_API(data, register)
    .then(res => {
      return res
    })
    .catch(e => {
      return e?.response
    })
}

export const userMailLogin = async (data: UserLoginEmailInterface) => {
  return POST_API(data, mailLogin)
    .then(res => {
      return res
    })
    .catch(e => {
      return e?.response
    })
}


export const firebaseOTP = async (data: FirebaseOTPInterface) => {
  return POST_API(data, FirebaseAuth)
    .then((res) => {
      return res;
    })
    .catch((e) => {
      return e?.response;
    });
};


const authServices = {
  userLogin,
  userRegistration,
  userVerifyOtp,
  userMailLogin,
  firebaseOTP,
}

export default authServices
