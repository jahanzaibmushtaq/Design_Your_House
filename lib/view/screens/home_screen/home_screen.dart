import 'package:design_your_house/const/app_images.dart';
import 'package:design_your_house/const/app_screens.dart';
import 'package:design_your_house/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HouseDesignPlanScreen extends StatelessWidget {
  const HouseDesignPlanScreen({Key? key}) : super(key: key);

  void _navigateToScreen(BuildContext context, String screenName) {
    Navigator.pushNamed(context, screenName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Image.asset(
                AppImages.appName,
                height: 40,
                width: 220,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 38),
              child: Builder( // Use a Builder widget to create a new context with a Scaffold
                builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); // Open the custom drawer here
                  },
                icon: Image.asset(
                  'assets/images/drawer_icon_home.png',
                  height: 24,
                  width: 24,
                ),
              ),
            ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 250),
                GestureDetector(
                  onTap: () {
                    _navigateToScreen(context, AppScreen.twoDTemplateScreen);
                  },
                  child: Image.asset(
                    'assets/images/2d_home.png',
                    width: 260,
                    height: 100,
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    _navigateToScreen(context, AppScreen.threeDTemplateScreen);
                  },
                  child: Image.asset(
                    'assets/images/3d_home.png',
                    width: 260,
                    height: 100,
                  ),
                ),
                // SizedBox(height: 8),
                // GestureDetector(
                //   onTap: () {
                //     _navigateToScreen(context, AppScreen.myHouseMaps);
                //   },
                //   child: Image.asset(
                //     'assets/images/my_house_home.png',
                //     width: 230,
                //     height: 100,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
