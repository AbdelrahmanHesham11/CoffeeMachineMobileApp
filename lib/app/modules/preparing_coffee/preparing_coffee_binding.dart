import 'package:get/get.dart';

import 'preparing_coffee_controller.dart';

class PreparingCoffeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreparingCoffeeController>(
      PreparingCoffeeController.new,
    );
  }
}
