import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dhoni_coffee_machine/app/core/constants/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/home_routes.dart';

class SignInController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController smsCodeController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool isObscure = true.obs;
  RxString verificationId = ''.obs;

  @override
  void onClose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    smsCodeController.dispose();
    super.onClose();
  }

  String formatPhoneNumber(String phoneNumber) {
    phoneNumber = phoneNumber.replaceAll(RegExp(r'\s+'), ''); // Remove spaces
    if (phoneNumber.startsWith('0')) {
      phoneNumber = phoneNumber.substring(1); // Remove leading zero
    }
    if (!phoneNumber.startsWith('+')) {
      phoneNumber = '+20$phoneNumber'; // Add country code for Egypt
    }
    return phoneNumber;
  }

  Future<void> sendVerificationCode() async {
    final phoneNumber = formatPhoneNumber(phoneNumberController.text.trim());

    if (phoneNumber.isEmpty) {
      AwesomeDialog(
        context: Get.key.currentContext!,
        dialogType: DialogType.error,
        desc: AppStrings.phoneCantBeEmpty,
        autoHide: const Duration(seconds: 3),
      ).show();
      return;
    }

    isLoading.value = true;

    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        await saveUserData();
        Get.offAllNamed(HomeRoutes.home);
      },
      verificationFailed: (FirebaseAuthException e) {
        isLoading.value = false;
        AwesomeDialog(
          context: Get.key.currentContext!,
          dialogType: DialogType.error,
          desc: e.message ?? 'Verification failed',
          autoHide: const Duration(seconds: 3),
        ).show();
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId.value = verificationId;
        isLoading.value = false;
        _showSmsCodeDialog();
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  void _showSmsCodeDialog() {
    Get.defaultDialog(
      title: 'Enter SMS Code',
      content: Column(
        children: [
          TextField(
            controller: smsCodeController,
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _signInWithSmsCode();
            },
            child: Text('Verify'),
          ),
        ],
      ),
    );
  }

  Future<void> _signInWithSmsCode() async {
    final smsCode = smsCodeController.text.trim();

    if (smsCode.isEmpty) {
      AwesomeDialog(
        context: Get.key.currentContext!,
        dialogType: DialogType.error,
        desc: AppStrings.smsCodeCantBeEmpty,
        autoHide: const Duration(seconds: 3),
      ).show();
      return;
    }

    isLoading.value = true;

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: smsCode,
      );
      await auth.signInWithCredential(credential);
      await saveUserData();
      Get.back(); // Close the dialog
      Get.offAllNamed(HomeRoutes.home);
    } on FirebaseAuthException catch (e) {
      AwesomeDialog(
        context: Get.key.currentContext!,
        dialogType: DialogType.error,
        desc: e.message ?? 'Sign in failed',
        autoHide: const Duration(seconds: 3),
      ).show();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveUserData() async {
    final user = auth.currentUser;
    if (user != null) {
      final userDoc = FirebaseFirestore.instance.collection('users').doc(user.uid);

      final userData = {
        'uid': user.uid,
        'phone': user.phoneNumber,
        // Add any other default data you want to save
      };

      await userDoc.set(userData, SetOptions(merge: true));
    }
  }
}
