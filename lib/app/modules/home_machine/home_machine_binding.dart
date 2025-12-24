import 'package:get/get.dart';

import 'home_machine_controller.dart';

class HomeMachineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeMachineController>(
      HomeMachineController.new,
    );
  }
}
