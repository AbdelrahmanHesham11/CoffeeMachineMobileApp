import 'dart:async';

import 'package:dhoni_coffee_machine/app/routes/home_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/core/bindings/application_bindings.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var currentUser = FirebaseAuth.instance.currentUser;
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ApplicationBindings(),
      initialRoute: currentUser == null ? AppPages.initial : HomeRoutes.home,
      getPages: AppPages.routes,
    ),
  );
}
