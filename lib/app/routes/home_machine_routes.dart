import 'package:get/get.dart';

import '../modules/home_machine/home_machine_binding.dart';
import '../modules/home_machine/home_machine_screen.dart';

class HomeMachineRoutes {
  HomeMachineRoutes._();

  static const homeMachine = '/home-machine';
  static final routes = [
    GetPage(
      name: homeMachine,
      page: HomeMachineScreen.new,
      binding: HomeMachineBinding(),
    ),
  ];
}
