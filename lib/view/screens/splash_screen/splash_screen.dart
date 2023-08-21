import 'dart:async';

import 'package:design_your_house/const/app_images.dart';
import 'package:design_your_house/const/app_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Get.toNamed(AppScreen.homeScreen);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.background),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              AppImages.splashIcon,
              height: 310,
              width: 320,
            ),
            const Text(
              'Design Your House',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, color: Colors.white,fontWeight: FontWeight.bold,),
            ),
            const Text(
              'From concept to creation',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
