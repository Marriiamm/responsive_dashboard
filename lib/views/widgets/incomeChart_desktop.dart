import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../utils/app_styles.dart';

class DesktopChart extends StatefulWidget {
  const DesktopChart({super.key});

  @override
  State<DesktopChart> createState() => _DesktopChartState();
}

class _DesktopChartState extends State<DesktopChart> {
  int activeIndex = -1;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: 1, child: PieChart(getChartData()));
  }

  PieChartData getChartData() {
    return PieChartData(
        pieTouchData: PieTouchData(
          enabled: true,
          touchCallback: (p0, pieTouchResponse) {
            activeIndex =
                pieTouchResponse?.touchedSection?.touchedSectionIndex ?? -1;
            setState(() {});
          },
        ),
        sectionsSpace: 0,
        sections: [
          PieChartSectionData(
              titlePositionPercentageOffset:activeIndex == 0 ?1.5:null ,
              value: 40,
              title: activeIndex == 0 ? "Design service" : "40%",
              titleStyle: AppStyles.styleMedium16(context).copyWith(color:activeIndex == 0?null: Colors.white),
              color: const Color(0xff208BC7),
              radius: activeIndex == 0 ? 50 : 40),
          PieChartSectionData(
              titlePositionPercentageOffset:activeIndex == 1 ?-0.4:null ,
              value: 25,
              title: activeIndex == 1 ? "Design product" : "25%",
              titleStyle: AppStyles.styleMedium16(context).copyWith(color:activeIndex == 1?null: Colors.white),
              color: const Color(0xff4DB7F2),
              radius: activeIndex == 1 ? 50 : 40),
          PieChartSectionData(
              titlePositionPercentageOffset:activeIndex == 2 ?1.4:null ,
              value: 20,
              title: activeIndex == 2 ? "Product royalti" : "20%",
              titleStyle: AppStyles.styleMedium16(context).copyWith(color:activeIndex == 2?null: Colors.white),
              color: const Color(0xff064060),
              radius: activeIndex == 2 ? 50 : 40),
          PieChartSectionData(
            titlePositionPercentageOffset:activeIndex == 3 ?1.4:null ,
              value: 22,
              title: activeIndex == 3 ? "Other" : "22%",
              titleStyle: AppStyles.styleMedium16(context).copyWith(color:activeIndex == 3?null: Colors.white),
              color: const Color(0xffE2DECD),
              radius: activeIndex == 3 ? 50 : 40),
        ]);
  }
}
