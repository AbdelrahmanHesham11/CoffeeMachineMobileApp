import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';

import '../constants/app_strings.dart';

Future<void> updatedSuccessfully() {
  return AwesomeDialog(
    context: Get.key.currentContext!,
    dialogType: DialogType.success,
    desc: AppStrings.updatedSuccessfully,
    autoHide: const Duration(seconds: 3),
  ).show();
}
