import 'package:design_your_house/const/app_screens.dart';
import 'package:design_your_house/view/screens/home_screen/home_screen.dart';
import 'package:design_your_house/view/screens/my_house_work_screen/my_house_work.dart';
import 'package:design_your_house/view/screens/splash_screen/splash_screen.dart';
import 'package:design_your_house/view/screens/three_d_template_screens/three_d_template_screen.dart';
import 'package:design_your_house/view/screens/two_d_template_screens/two_d_template_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> pages = <GetPage>[
    GetPage(
      name: AppScreen.initialScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
        name: AppScreen.homeScreen,
        page: () => const HouseDesignPlanScreen(),),
    GetPage(
      name: AppScreen.myHouseMaps,
      page: () => const MyHouseMaps(),),
    GetPage(
      name: AppScreen.threeDTemplateScreen,
      page: () =>  ThreeDTemplateScreen(),),
    GetPage(
      name: AppScreen.twoDTemplateScreen,
      page: () => TwoDTemplateScreen(),),

  ];
}
