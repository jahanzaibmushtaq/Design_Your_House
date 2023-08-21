import 'package:design_your_house/const/app_screens.dart';
import 'package:design_your_house/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Design Your House',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue.shade200),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.pages,
      initialRoute: AppScreen.initialScreen,
      // home:   const HouseDesignPlanScreen(),
    );
  }
}
