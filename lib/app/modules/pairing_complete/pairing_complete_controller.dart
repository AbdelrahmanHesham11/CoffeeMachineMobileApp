import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/home_routes.dart';

class PairingCompleteController extends GetxController {
  TextEditingController machineNameController = TextEditingController();
  final String machineType = Get.arguments as String;

  FutureOr<void> addNewHomeMachine() async {
    if (machineNameController.text.isNotEmpty) {
      FirebaseFirestore.instance.collection('machines').add({
        'machineName': machineNameController.text.trim(),
        'uid': FirebaseAuth.instance.currentUser!.uid,
        'machineType': machineType,
      }).then((value) {
        machineNameController.clear();

        Get.offAllNamed(HomeRoutes.home);
      }).catchError(
        (onError) {
          debugPrint(onError.toString());
          return onError;
        },
      );
    }
    return;
  }
}
