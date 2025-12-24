import 'package:get/get.dart';

import '../modules/preparing_coffee/preparing_coffee_binding.dart';
import '../modules/preparing_coffee/preparing_coffee_screen.dart';

class PreparingCoffeeRoutes {
  PreparingCoffeeRoutes._();

  static const preparingCoffee = '/preparing-coffee';
  static final routes = [
    GetPage(
      name: preparingCoffee,
      page: PreparingCoffeeScreen.new,
      binding: PreparingCoffeeBinding(),
    ),
  ];
}
