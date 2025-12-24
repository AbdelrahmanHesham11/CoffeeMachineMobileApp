import 'package:get/get.dart';

import '../modules/sign_up/sign_up_binding.dart';
import '../modules/sign_up/sign_up_screen.dart';

class SignUpRoutes {
  SignUpRoutes._();

  static final routes = [
    GetPage(
      name: signUp,
      page: SignUpScreen.new,
      binding: SignUpBinding(),
    ),
  ];

  static const signUp = '/sign-up';
}
