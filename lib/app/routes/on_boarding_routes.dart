import 'package:get/get.dart';

import '../modules/on_boarding/on_boarding_binding.dart';
import '../modules/on_boarding/on_boarding_screen.dart';

class OnBoardingRoutes {
  OnBoardingRoutes._();

  static const onBoarding = '/on-boarding';
  static final routes = [
    GetPage(
      name: onBoarding,
      page: OnBoardingScreen.new,
      binding: OnBoardingBinding(),
    ),
  ];
}
