import { createSlice, PayloadAction } from '@reduxjs/toolkit'
import {
  userLogin,
  userRegistration,
  userVerifyOtp,
  userMailLogin,
  firebaseOTPLogin,
} from '../action/authActions'
import { AuthInterface } from '../../interface/authInterface'

const initialState: AuthInterface = {
  user: {},
  token: '',
  loading: false,
  success: false,
  fcmToken: '',
}

const authSlice = createSlice({
  name: 'auth',
  initialState,
  reducers: {
    updateToken(state, action: PayloadAction<string>) {
      state.fcmToken = action.payload
    },
    updateLoading(state, action: PayloadAction<boolean>) {
      state.loading = action.payload
    },
  },
  extraReducers: builder => {
    //Login Cases
    builder.addCase(userLogin.pending, (state, action) => {
      state.loading = true
    })
    builder.addCase(userLogin.fulfilled, (state, action) => {
      state.loading = false
    })

    //Register Cases
    builder.addCase(userRegistration.pending, (state, action) => {
      state.loading = true
    })
    builder.addCase(userRegistration.fulfilled, (state, action) => {
      state.loading = false
    })

       //firebase otp
    builder.addCase(firebaseOTPLogin.pending, (state, action) => {
      state.loading = true;
    });
    builder.addCase(firebaseOTPLogin.fulfilled, (state, action) => {
      state.loading = false;
      state.user = action.payload.data;
    });

    //verify OTP
    builder.addCase(userVerifyOtp.pending, (state, action) => {
      state.loading = true
    })
    builder.addCase(userVerifyOtp.fulfilled, (state, action) => {
      state.loading = false
    })
    builder.addCase(userVerifyOtp.rejected, (state, action) => {
      state.loading = false
    })

    //LoginWithmail Cases
    builder.addCase(userMailLogin.pending, (state, action) => {
      state.loading = true
    })
    builder.addCase(userMailLogin.fulfilled, (state, action) => {
      state.loading = false
    })
  },
})
export const { updateToken, updateLoading } = authSlice.actions
export default authSlice.reducer
