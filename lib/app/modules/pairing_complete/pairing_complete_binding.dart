import 'package:get/get.dart';

import 'pairing_complete_controller.dart';

class PairingCompleteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PairingCompleteController>(
      PairingCompleteController.new,
    );
  }
}
