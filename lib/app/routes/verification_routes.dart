import 'package:get/get.dart';

import '../modules/verification/verification_binding.dart';
import '../modules/verification/verification_screen.dart';

class VerificationRoutes {
  VerificationRoutes._();

  static final routes = [
    GetPage(
      name: verification,
      page: VerificationScreen.new,
      binding: VerificationBinding(),
    ),
  ];

  static const verification = '/verification';
}
