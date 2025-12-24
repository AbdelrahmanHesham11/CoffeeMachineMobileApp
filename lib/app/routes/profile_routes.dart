import 'package:get/get.dart';

import '../modules/profile/profile_binding.dart';
import '../modules/profile/profile_screen.dart';

class ProfileRoutes {
  ProfileRoutes._();

  static const profile = '/profile';
  static final routes = [
    GetPage(
      name: profile,
      page: ProfileScreen.new,
      binding: ProfileBinding(),
    ),
  ];
}
