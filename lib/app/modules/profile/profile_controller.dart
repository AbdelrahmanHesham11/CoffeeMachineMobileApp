import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhoni_coffee_machine/app/core/components/awesome_dialog_updated_successfully.dart';
import 'package:dhoni_coffee_machine/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  RxMap<String, dynamic> userData = <String, dynamic>{}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final data = await getUserData();
      userData.value = data;
      usernameController.text = data['username'] ?? '';
      phoneController.text = data['phone'] ?? '';
      emailController.text = data['email'] ?? '';
    } catch (e) {
      debugPrint('Error fetching user data: $e');
    }
  }

  Future<Map<String, dynamic>> getUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('User is not logged in');
      }

      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (!doc.exists) {
        throw Exception('User data not found');
      }

      return doc.data()!;
    } catch (e) {
      debugPrint('Error in getUserData: $e');
      rethrow;
    }
  }

  Future<void> updateUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('User is not logged in');
      }

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({
        'username': usernameController.text.trim().isNotEmpty
            ? usernameController.text.trim()
            : userData['username'],
        'phone': phoneController.text.trim().isNotEmpty
            ? phoneController.text.trim()
            : userData['phone'],
        'email': emailController.text.trim().isNotEmpty
            ? emailController.text.trim()
            : userData['email'],
      });

      userData.value = await getUserData();
      await updatedSuccessfully();
    } catch (e) {
      debugPrint('Error updating user data: $e');
    }
  }

  FutureOr<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed(AppPages.initial);
    } catch (e) {
      debugPrint('Error signing out: $e');
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
