import 'package:get/get.dart';

import 'add_new_machine_controller.dart';

class AddNewMachineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddNewMachineController>(
      AddNewMachineController.new,
    );
  }
}
