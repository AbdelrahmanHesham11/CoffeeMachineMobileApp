import 'package:get/get.dart';

import '../modules/sign_in/sign_in_binding.dart';
import '../modules/sign_in/sign_in_screen.dart';

class SignInRoutes {
  SignInRoutes._();

  static final routes = [
    GetPage(
      name: signIn,
      page: SignInScreen.new,
      binding: SignInBinding(),
    ),
  ];

  static const signIn = '/sign-in';
}
