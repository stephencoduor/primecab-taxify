import React, { useState, useRef, useEffect } from "react";
import { Text, TouchableOpacity, View, ScrollView, StyleSheet, Pressable } from "react-native";
import appColors from "../../../theme/appColors";
import { Header } from "../../../commonComponents";
import Svg, { Rect, Line, Text as SvgText } from 'react-native-svg';
import appFonts from "../../../theme/appFonts";
import { windowHeight, fontSizes, windowWidth } from "../../../theme/appConstant";
import { useSelector } from "react-redux";
import Icons from "../../../utils/icons/icons";
import { useValues } from "../../../utils/context";

export function TotalEarnings() {
    const { dashBoardList } = useSelector((state) => state.dashboard);
    const initialEarningsData = dashBoardList?.day?.dayRevenues?.revenues;
    const weekEarningsData = dashBoardList?.week?.weekRevenues?.revenues;
    const monthEarningsData = dashBoardList?.month?.monthRevenues?.revenues;
    const dayLabels = dashBoardList?.day?.dayRevenues?.days;
    const weekLabels = dashBoardList?.week?.weekRevenues?.days;
    const monthLabels = dashBoardList?.month?.monthRevenues?.months;
    const { isDark } = useValues()

    const [selectedPeriod, setSelectedPeriod] = useState('Day');
    const [chartData, setChartData] = useState(initialEarningsData);
    const options = ['Day', 'Week', 'Month'];
    const chartScrollViewRef = useRef(null);

    const updateChartData = (period) => {
        setSelectedPeriod(period);
        switch (period) {
            case 'Day':
                setChartData(initialEarningsData);
                break;
            case 'Week':
                setChartData(weekEarningsData);
                break;
            case 'Month':
                setChartData(monthEarningsData);
                break;
            default:
                setChartData(initialEarningsData);
        }
    };

    const getLabels = () => {
        switch (selectedPeriod) {
            case 'Day':
                return dayLabels;
            case 'Week':
                return weekLabels;
            case 'Month':
                return monthLabels.slice(0, chartData.length);
            default:
                return [];
        }
    };

    const labels = getLabels();
    const chartHeight = 200;
    const chartHorizontalPadding = windowHeight(2);
    const baseBarActualWidth = windowHeight(1.5);
    const baseBarSpacing = windowWidth(8);
    const barActualWidth = baseBarActualWidth;
    const barContainerWidth = baseBarActualWidth + baseBarSpacing;
    const totalChartContentWidth = chartData.length * barContainerWidth + chartHorizontalPadding * 2;
    const maxValue = Math.max(...chartData);
    const yAxisMax = Math.max(30, Math.ceil(maxValue / 5) * 5);
    const fixedYAxisLabels = [yAxisMax, (yAxisMax * 5) / 6, (yAxisMax * 4) / 6, (yAxisMax * 3) / 6, (yAxisMax * 2) / 6, yAxisMax / 6, 0].map(val => Math.round(val));


    const formatValue = (value) => {
        if (value >= 1000) {
            return `${(value / 1000).toFixed(1)}K`;
        }
        return value.toString();
    };

    useEffect(() => {
        if (chartScrollViewRef.current) {
            chartScrollViewRef.current.scrollTo({ x: 0, animated: true });
        }
    }, [chartData]);

    const [selectedBarIndex, setSelectedBarIndex] = useState(null);
    const [tooltipWidth, setTooltipWidth] = useState(0);
    const tooltipMargin = windowHeight(3.5);

    const AvgCard = ({ earnings, rides }) => (
        <View style={{ flexDirection: 'row', justifyContent: 'space-between', marginHorizontal: windowHeight(2.5), marginBottom: windowHeight(2) }}>
            <View
                style={{
                    backgroundColor: isDark ? appColors.darkThemeSub : appColors.white, borderWidth: 1,
                    borderColor: isDark ? appColors.darkBorderBlack : appColors.border,
                    borderRadius: windowHeight(0.8), width: '48%'
                }}>
                <View style={{ flexDirection: 'row', margin: windowHeight(1.5) }}>
                    <View style={{ height: windowHeight(6.5), width: windowHeight(6.5), backgroundColor: '#F1F7FE', alignItems: 'center', justifyContent: 'center', borderRadius: windowHeight(0.8) }}>
                        <Icons.Earnings />
                    </View>
                    <View style={{ height: windowHeight(6.5), justifyContent: 'center', marginHorizontal: windowWidth(3) }}>
                        <Text style={{ fontFamily: appFonts.bold, color: '#47A1E5', fontSize: fontSizes.FONT4HALF }}>{dashBoardList?.ride?.currency_symbol}{earnings}</Text>
                    </View>
                </View>
                <Text style={{
                    paddingBottom: windowHeight(1), marginHorizontal: windowHeight(1.5), fontFamily: appFonts.medium,
                    color: isDark ? appColors.white : appColors.black
                }}>Average Earnings</Text>
            </View>
            <View style={{
                backgroundColor: isDark ? appColors.darkThemeSub : appColors.white,
                borderWidth: 1,
                borderColor: isDark ? appColors.darkBorderBlack : appColors.border,
                borderRadius: windowHeight(0.8), width: '48%'
            }}>
                <View style={{ flexDirection: 'row', margin: windowHeight(1.5) }}>
                    <View style={{ height: windowHeight(6.5), width: windowHeight(6.5), backgroundColor: '#FFF4F1', alignItems: 'center', justifyContent: 'center', borderRadius: windowHeight(0.8) }}>
                        <Icons.Rides />
                    </View>
                    <View style={{ height: windowHeight(6.5), justifyContent: 'center', marginHorizontal: windowWidth(3) }}>
                        <Text style={{ fontFamily: appFonts.bold, color: '#FF8367', fontSize: fontSizes.FONT4HALF }}>{rides} {dashBoardList?.driver_performance?.unit}</Text>
                    </View>
                </View>
                <Text style={{
                    paddingBottom: windowHeight(1), marginHorizontal: windowHeight(1.5), fontFamily: appFonts.medium,
                    color: isDark ? appColors.white : appColors.black
                }}>Average Rides</Text>
            </View>
        </View>
    );

    const RecordCard = ({ date, amount }) => (
        <View style={[localStyles.recordCard, { backgroundColor: isDark ? appColors.darkThemeSub : appColors.white }, { borderColor: isDark ? appColors.darkBorderBlack : appColors.border }]}>
            <Text style={[localStyles.recordCardLabel, { color: isDark ? appColors.darkText : appColors.iconColor }]}>Date</Text>
            {date ? (
                <View style={localStyles.recordCardContent}>
                    <Text style={[localStyles.recordCardDate, { color: isDark ? appColors.white : appColors.black }]}>{date}</Text>
                    <Text style={localStyles.recordCardAmount}>
                        {dashBoardList?.ride?.currency_symbol}
                        {amount}
                    </Text>
                </View>
            ) : (
                <Text style={[localStyles.nodata, { color: isDark ? appColors.white : appColors.black }]}>No data available</Text>
            )}

        </View>
    );

    const renderAvg = () => {
        switch (selectedPeriod) {
            case 'Day':
                return null;

            case 'Week':
                return <AvgCard earnings={dashBoardList?.week?.averages?.average_earnings} rides={dashBoardList?.week?.averages?.average_rides} />;

            case 'Month':
                return <AvgCard earnings={dashBoardList?.month?.averages?.average_earnings} rides={dashBoardList?.month?.averages?.average_rides} />;
            default:
                return null;
        }
    }

    const renderRecord = () => {
        switch (selectedPeriod) {
            case 'Day':
                return <RecordCard date={dashBoardList?.day?.highest_records?.daily?.date} amount={dashBoardList?.day?.highest_records?.daily?.amount} />;

            case 'Week':
                return <RecordCard date={dashBoardList?.week?.highest_records?.weekly?.date} amount={dashBoardList?.week?.highest_records?.weekly?.amount} />;

            case 'Month':
                return <RecordCard date={dashBoardList?.month?.highest_records?.monthly?.date} amount={dashBoardList?.month?.highest_records?.monthly?.amount} />;

            default:
                return null;
        }
    };



    return (
        <View style={{ flex: 1, }}>
            <Header title="Total Earning" />
            <View style={{ backgroundColor: isDark ? appColors.bgDark : appColors.graybackground, flex: 1 }}>

                <View style={localStyles.optionsContainer}>
                    {options.map((option) => (
                        <TouchableOpacity
                            key={option}
                            style={[
                                { backgroundColor: isDark ? appColors.darkThemeSub : appColors.white },
                                localStyles.option,
                                selectedPeriod === option && localStyles.selectedOption
                            ]}
                            onPress={() => {
                                updateChartData(option);
                                renderRecord();
                            }}
                        >
                            <Text
                                style={[
                                    localStyles.optionText,
                                    { color: isDark ? appColors.darkText : appColors.black },
                                    selectedPeriod === option && localStyles.selectedText
                                ]}
                            >
                                {option}
                            </Text>
                        </TouchableOpacity>
                    ))}
                </View>

                <Text style={[localStyles.title, { color: isDark ? appColors.white : appColors.black }]}>Total Earnings</Text>
                <View style={[localStyles.card, { backgroundColor: isDark ? appColors.darkThemeSub : appColors.white }, { borderColor: isDark ? appColors.darkBorderBlack : appColors.border }]}>

                    <View style={[localStyles.chartAndLabelsWrapper,]}>
                        <View style={localStyles.yAxisLabels}>
                            {fixedYAxisLabels.map((value, i) => (
                                <Text key={`y-label-${i}`} style={localStyles.yAxisLabel}>
                                    {value}
                                </Text>
                            ))}
                        </View>

                        <ScrollView
                            horizontal={true}
                            showsHorizontalScrollIndicator={false}
                            ref={chartScrollViewRef}
                            scrollEventThrottle={16}
                            contentContainerStyle={{
                                paddingHorizontal: chartHorizontalPadding,
                                flexDirection: 'column',
                                flexGrow: 1,
                            }}
                        >
                            <Svg
                                width={totalChartContentWidth}
                                height={chartHeight}
                                style={localStyles.svg}
                            >
                                {Array.from({ length: fixedYAxisLabels.length }).map((_, i) => {
                                    const y = (i / (fixedYAxisLabels.length - 1)) * chartHeight;
                                    return (
                                        <Line
                                            key={`grid-line-${i}`}
                                            x1="0"
                                            y1={y}
                                            x2={totalChartContentWidth}
                                            y2={y}
                                            stroke="#E0E0E0"
                                            strokeWidth="0.5"
                                            strokeDasharray="4 4"
                                        />
                                    );
                                })}

                                {chartData.map((value, index) => {
                                    const barHeight = (value / yAxisMax) * chartHeight;
                                    const x = index * barContainerWidth + (barContainerWidth - barActualWidth) / 2;
                                    const y = chartHeight - barHeight;

                                    return (
                                        <Rect
                                            key={`bar-${index}`}
                                            x={x}
                                            y={y}
                                            width={barActualWidth}
                                            height={barHeight}
                                            fill={appColors.primary}
                                            rx={2}
                                        />
                                    );
                                })}
                            </Svg>

                            <View style={[StyleSheet.absoluteFillObject, { flexDirection: 'row', left: chartHorizontalPadding, bottom: 0 }]}>
                                {chartData.map((_, index) => {
                                    return (
                                        <Pressable
                                            key={`touchable-${index}`}
                                            onPress={() => setSelectedBarIndex(index)}
                                            style={{
                                                width: barContainerWidth,
                                                height: chartHeight,
                                                backgroundColor: 'transparent',
                                            }}
                                        />
                                    );
                                })}
                            </View>

                            <View
                                style={{
                                    flexDirection: 'row',
                                    marginTop: windowHeight(10),
                                    width: totalChartContentWidth,
                                    justifyContent: 'flex-start',
                                }}
                            >
                                {labels.map((label, index) => {
                                    return (
                                        <View
                                            key={`label-${index}`}
                                            style={{
                                                width: barContainerWidth,
                                                alignItems: 'center',
                                                justifyContent: 'center',
                                            }}
                                        >
                                            <Text style={localStyles.xAxisLabelText}>
                                                {label}
                                            </Text>
                                        </View>
                                    );
                                })}
                            </View>
                        </ScrollView>
                    </View>

                    {selectedBarIndex !== null && (
                        <View
                            onLayout={(event) => {
                                const { width } = event.nativeEvent.layout;
                                setTooltipWidth(width);
                            }}
                            style={[
                                localStyles.tooltipContainer,
                           
                                {
                                    bottom: (chartData[selectedBarIndex] / yAxisMax) * chartHeight + tooltipMargin,

                                    left: chartHorizontalPadding + selectedBarIndex * barContainerWidth + (barContainerWidth / 2) - (tooltipWidth / 3.9),
                                },
                            ]}
                        >
                            <View style={{ flexDirection: 'row', justifyContent: 'space-between', gap: 8 }}>
                                <Text style={localStyles.tooltipText}>Income: </Text>
                                <Text style={{
                                    color: appColors.primary,
                                    fontSize: fontSizes.FONT3HALF,
                                    fontFamily: appFonts.medium,
                                }}>
                                    {dashBoardList?.ride?.currency_symbol}{formatValue(chartData[selectedBarIndex])}
                                </Text>
                            </View>
                            <View style={localStyles.tooltipArrow} />
                        </View>
                    )}


                </View>
                {renderAvg()}
                <Text style={[localStyles.highestRecordTitle, { color: isDark ? appColors.darkText : appColors.iconColor }]}>
                    Highest Single-day Record
                </Text>
                {renderRecord()}
            </View>
        </View>
    );
}

const localStyles = StyleSheet.create({
    optionsContainer: {
        flexDirection: 'row',
        justifyContent: 'space-around',
        borderRadius: windowHeight(0.8),
        padding: windowHeight(1),
        marginTop: windowHeight(2)
    },
    option: {
        paddingVertical: windowHeight(1.4),
        paddingHorizontal: windowWidth(9),
        borderRadius: windowHeight(5),
    },
    selectedOption: {
        backgroundColor: appColors.primary,
    },
    optionText: {
        color: appColors.black,
        fontFamily: appFonts.medium,
        fontSize: fontSizes.FONT3HALF,
    },
    selectedText: {
        color: appColors.white,
    },
    title: {
        color: appColors.black,
        fontFamily: appFonts.medium,
        marginHorizontal: windowHeight(2.5),
        fontSize: fontSizes.FONT4HALF,
        marginTop: windowHeight(2),
        marginBottom: windowHeight(1)
    },
    card: {
        backgroundColor: appColors.white,
        borderRadius: windowHeight(0.8),
        marginHorizontal: windowWidth(4),
        paddingVertical: windowHeight(2),
        position: 'relative',
        overflow: 'hidden',
        marginBottom: windowHeight(2),
        height: windowHeight(33),
        marginTop: windowHeight(0.8),
        width: '89.8%',
        alignSelf: 'center',
        borderColor: appColors.border,
        borderWidth: windowHeight(0.15)
    },
    chartAndLabelsWrapper: {
        flexDirection: 'row',
        alignItems: 'flex-end',
    },
    yAxisLabels: {
        justifyContent: 'space-between',
        height: windowHeight(25) + windowHeight(10),
        paddingRight: windowWidth(2),
        alignItems: 'flex-end',
        paddingBottom: windowHeight(8) + windowHeight(0),
        left: windowHeight(2)
    },
    yAxisLabel: {
        fontSize: fontSizes.FONT3HALF,
        color: appColors.iconColor,
        fontFamily: appFonts.regular,
    },
    svg: {

    },
    xAxisLabelText: {
        fontSize: fontSizes.FONT3HALF,
        color: appColors.iconColor,
        fontFamily: appFonts.regular,
        bottom: windowHeight(8.5)
    },
    tooltipContainer: {
        position: 'absolute',
        backgroundColor: appColors.white,
        borderRadius: windowHeight(0.8),
        paddingHorizontal: windowHeight(1.3),
        paddingVertical: windowHeight(1),
        alignItems: 'center',
        justifyContent: 'center',
        elevation: 1.5,
    },
    tooltipText: {
        color: appColors.iconColor,
        fontSize: fontSizes.FONT3HALF,
        fontFamily: appFonts.medium,
    },
    tooltipArrow: {
        position: 'absolute',
        bottom: -5,
        width: 0,
        height: 0,
        backgroundColor: 'transparent',
        borderStyle: 'solid',
        borderLeftWidth: 5,
        borderRightWidth: 5,
        borderTopWidth: 5,
        borderLeftColor: 'transparent',
        borderRightColor: 'transparent',
        borderTopColor: appColors.white,
    },
    highestRecordTitle: {
        color: appColors.iconColor,
        fontFamily: appFonts.medium,
        marginHorizontal: windowWidth(5),
        fontSize: fontSizes.FONT4,
        marginTop: windowHeight(1),
    },
    recordCard: {
        backgroundColor: appColors.white,
        borderWidth: StyleSheet.hairlineWidth,
        width: '90%',
        alignSelf: 'center',
        height: windowHeight(8.4),
        borderRadius: windowHeight(0.7),
        borderColor: appColors.border,
        marginTop: windowHeight(1.5),
        paddingHorizontal: windowWidth(4),
        paddingVertical: windowHeight(1.5),
        justifyContent: 'space-between',
    },
    recordCardLabel: {
        color: appColors.iconColor,
        fontFamily: appFonts.medium,
        fontSize: fontSizes.FONT3HALF,
    },
    recordCardContent: {
        flexDirection: 'row',
        justifyContent: 'space-between',
        alignItems: 'center',
    },
    recordCardDate: {
        color: appColors.black,
        fontFamily: appFonts.medium,
        fontSize: fontSizes.FONT4,
    },
    recordCardAmount: {
        color: '#ECB238',
        fontFamily: appFonts.bold,
        fontSize: fontSizes.FONT4,
    },
    nodata: {
        fontFamily: appFonts.medium,
        color: appColors.primaryFont
    }
});
