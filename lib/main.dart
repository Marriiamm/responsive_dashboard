import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'views/dashboard_view.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const DashBoardApp()));
}

class DashBoardApp extends StatelessWidget {
  const DashBoardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: const DashboardView(),
    );
  }
}
