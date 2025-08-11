import {
  USER_LOGIN,
  USER_REGISTRATION,
  VERIFY_OTP,
  USER_LOGIN_MAIL,
  FIREBASE_OTP,
} from '../types/index'
import {
  DriverLoginInterface,
  DriverRegistrationPayload,
  VerifyOtpInterface,
  UserLoginEmailInterface,
  FirebaseOTPInterface,
} from '../../interface/authInterface'
import { authServices } from '../../services/index'
import { createAsyncThunk } from '@reduxjs/toolkit'

export const userLogin = createAsyncThunk(
  USER_LOGIN,
  async (data: DriverLoginInterface) => {
    const response = await authServices.userLogin(data)
    return response?.data
  },
)

export const userVerifyOtp = createAsyncThunk(
  VERIFY_OTP,
  async (data: VerifyOtpInterface) => {
    const response = await authServices.userVerifyOtp(data)

    return response?.data
  },
)

export const userRegistration = createAsyncThunk(
  USER_REGISTRATION,
  async (data: DriverRegistrationPayload) => {
    const response = await authServices.userRegistration(data)
    if (response.status == 200) {
      return response?.data
    } else {
      return response.data
    }
  },
)

export const userMailLogin = createAsyncThunk(
  USER_LOGIN_MAIL,
  async (data: UserLoginEmailInterface) => {
    const response = await authServices.userMailLogin(data)
    return response?.data
  },
)



export const firebaseOTPLogin = createAsyncThunk(
  FIREBASE_OTP,
  async (data: FirebaseOTPInterface) => {
    const response = await authServices.firebaseOTP(data);
    return response?.data;
  }
);
