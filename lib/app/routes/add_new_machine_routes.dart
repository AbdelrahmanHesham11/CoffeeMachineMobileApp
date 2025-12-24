import 'package:get/get.dart';

import '../modules/add_new_machine/add_new_machine_binding.dart';
import '../modules/add_new_machine/add_new_machine_screen.dart';

class AddNewMachineRoutes {
  AddNewMachineRoutes._();

  static const addNewMachine = '/add-new-machine';
  static final routes = [
    GetPage(
      name: addNewMachine,
      page: AddNewMachineScreen.new,
      binding: AddNewMachineBinding(),
    ),
  ];
}
