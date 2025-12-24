import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhoni_coffee_machine/app/core/constants/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/home_routes.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  RxBool isObscure = true.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  FutureOr<void> signUp() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final phone = phoneController.text.trim();
    final username = usernameController.text.trim();

    if (email.isEmpty) {
      AwesomeDialog(
        context: Get.key.currentContext!,
        dialogType: DialogType.error,
        desc: AppStrings.emailCantBeEmpty,
        autoHide: const Duration(seconds: 3),
      ).show();
      return;
    } else if (password.isEmpty) {
      AwesomeDialog(
        context: Get.key.currentContext!,
        dialogType: DialogType.error,
        desc: AppStrings.passwordCantBeEmpty,
        autoHide: const Duration(seconds: 3),
      ).show();
      return;
    }

    isLoading.value = true;

    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password).then(
            (value) async {
          await FirebaseFirestore.instance.collection('users').doc(value.user!.uid).set(
            {
              'email': email,
              'uid': value.user!.uid,
              'username': username,
              'phone': phone,
            },
          ).then((value) {
            AwesomeDialog(
              context: Get.key.currentContext!,
              desc: AppStrings.signUpSuccess,
              dialogType: DialogType.success,
              autoHide: const Duration(seconds: 3),
            ).show().then((value) => Get.offAllNamed(HomeRoutes.home));
            return value;
          });
        },
      );
    } on FirebaseAuthException catch (e) {
      AwesomeDialog(
        context: Get.key.currentContext!,
        dialogType: DialogType.error,
        desc: e.code,
        autoHide: const Duration(seconds: 3),
      ).show();
    } catch (e) {
      debugPrint(e.toString());
      AwesomeDialog(
        context: Get.key.currentContext!,
        desc: e.toString(),
        dialogType: DialogType.error,
        autoHide: const Duration(seconds: 3),
      ).show();
    } finally {
      isLoading.value = false;
    }
  }
}
