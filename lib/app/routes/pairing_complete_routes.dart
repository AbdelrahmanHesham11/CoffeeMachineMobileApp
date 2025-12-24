import 'package:get/get.dart';

import '../modules/pairing_complete/pairing_complete_binding.dart';
import '../modules/pairing_complete/pairing_complete_screen.dart';

class PairingCompleteRoutes {
  PairingCompleteRoutes._();

  static const pairingComplete = '/pairing-complete';
  static final routes = [
    GetPage(
      name: pairingComplete,
      page: PairingCompleteScreen.new,
      binding: PairingCompleteBinding(),
    ),
  ];
}
