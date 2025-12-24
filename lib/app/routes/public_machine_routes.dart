import 'package:get/get.dart';

import '../modules/public_machine/public_machine_binding.dart';
import '../modules/public_machine/public_machine_screen.dart';

class PublicMachineRoutes {
  PublicMachineRoutes._();

  static const publicMachine = '/public-machine';
  static final routes = [
    GetPage(
      name: publicMachine,
      page: PublicMachineScreen.new,
      binding: PublicMachineBinding(),
    ),
  ];
}
