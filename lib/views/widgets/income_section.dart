import 'package:flutter/material.dart';
import 'package:responsive_dash_board/utils/size_config.dart';
import 'package:responsive_dash_board/views/widgets/customcontainer_background.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../models/income_model.dart';
import '../../utils/app_styles.dart';
import 'incomeChart_desktop.dart';

class IncomeSection extends StatelessWidget {
  const IncomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomContainer(
        child: Column(
      children: [
        IncomeHeader(),
        IncomeSectionBody(),
      ],
    ));
  }
}

class IncomeSectionBody extends StatelessWidget {
  const IncomeSectionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    double width = MediaQuery.sizeOf(context).width;
    return width >= SizeConfig.desktop && width < 1620
        ? const Expanded(flex: 2, child: Padding(
          padding: EdgeInsets.all(16.0),
          child: DesktopChart(),
        ))
        : const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 2, child: IncomeChart()),
              Expanded(flex: 5, child: IncomeDetails()),
            ],
          );
  }
}

class IncomeHeader extends StatelessWidget {
  const IncomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          "Income",
          style: AppStyles.styleSemiBold20(context),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                width: 1,
                color: const Color(0XFFF1F1F1),
              )),
          child: Row(
            children: [
              Text(
                "Monthly",
                style: AppStyles.styleMedium16(context),
              ),
              const SizedBox(
                width: 18,
              ),
              const Icon(
                Icons.arrow_drop_down_rounded,
                color: Color(0XFF064061),
              )
            ],
          ),
        )
      ],
    );
  }
}

class IncomeChart extends StatefulWidget {
  const IncomeChart({super.key});

  @override
  State<IncomeChart> createState() => _IncomeChartState();
}

class _IncomeChartState extends State<IncomeChart> {
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
              value: 40,
              color: const Color(0xff208BC7),
              showTitle: false,
              radius: activeIndex == 0 ? 50 : 40),
          PieChartSectionData(
              value: 25,
              color: const Color(0xff4DB7F2),
              showTitle: false,
              radius: activeIndex == 1 ? 50 : 40),
          PieChartSectionData(
              value: 20,
              color: const Color(0xff064060),
              showTitle: false,
              radius: activeIndex == 2 ? 50 : 40),
          PieChartSectionData(
              value: 22,
              color: const Color(0xffE2DECD),
              showTitle: false,
              radius: activeIndex == 3 ? 50 : 40),
        ]);
  }
}

class IncomeDetails extends StatelessWidget {
  const IncomeDetails({super.key});

  static const List items = [
    IncomeModel(
        color: Color(0xff208BC7), title: "Design service", ratio: "40%"),
    IncomeModel(
        color: Color(0xff4DB7F2), title: "Design product", ratio: "25%"),
    IncomeModel(
        color: Color(0xff064060), title: "Product royalti", ratio: "20%"),
    IncomeModel(color: Color(0xffE2DECD), title: "Other", ratio: "22%"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((e) => IncomeItemDetails(incomeModel: e)).toList(),
    );
  }
}

class IncomeItemDetails extends StatelessWidget {
  const IncomeItemDetails({super.key, required this.incomeModel});

  final IncomeModel incomeModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 12,
        height: 12,
        decoration: ShapeDecoration(
            shape: const OvalBorder(),
            color: incomeModel.color //Color(0xff208BC7),
            ),
      ),
      title: Text(
        incomeModel.title,
        style: AppStyles.styleRegular16(context),
      ),
      trailing: Text(
        incomeModel.ratio,
        //"40%",
        style: AppStyles.styleMedium16(context),
      ),
    );
  }
}
