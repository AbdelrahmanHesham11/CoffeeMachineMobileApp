import 'package:get/get.dart';

import 'public_machine_controller.dart';

class PublicMachineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PublicMachineController>(
      PublicMachineController.new,
    );
  }
}
