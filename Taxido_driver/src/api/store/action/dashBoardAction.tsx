import { DASHBOARD } from '../types'
import { dashBoardService } from '../../services/index'
import { createAsyncThunk } from '@reduxjs/toolkit';


export const dashBoardData = createAsyncThunk(
    DASHBOARD,
    async ({ unit, zoneId }: { unit: number, zoneId: number }) => {
        const response = await dashBoardService.dashBoardData({ unit, zoneId });
        return response?.data;
    },
);

