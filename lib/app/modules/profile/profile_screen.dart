import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dhoni_coffee_machine/app/core/components/k_back_button.dart';
import 'package:dhoni_coffee_machine/app/core/constants/app_colors.dart';
import 'package:dhoni_coffee_machine/app/core/constants/app_strings.dart';
import 'package:dhoni_coffee_machine/app/core/extensions/responsiveness_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/assets/assets.dart';
import 'profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(AppStrings.profile),
          centerTitle: true,
          leading: const KBackButton(),
        ),
        body: GetBuilder<ProfileController>(builder: (controller) {
      return Column(
        children: [
      ListTile(
      leading: CircleAvatar(
      backgroundColor: AppColors.greyColor,
        child: SvgPicture.asset(
          Assets.assetsSvgsUserName,
        ),
      ),
    title: Text(
    'Name',
    style: TextStyle(
    fontFamily: 'Poppins',
    fontSize: context.px(8),
    fontWeight: FontWeight.w500,
    color: AppColors.onSurfaceColorDarker,
    ),
    ),
    subtitle: Text(
    controller.userData['username'] ?? '',
    style: TextStyle(
    fontFamily: 'Poppins',
    fontSize: context.px(12),
    fontWeight: FontWeight.w600,
    ),
    ),
    trailing: GestureDetector(
    onTap: () {
    Get.defaultDialog(
    title: AppStrings.username,
    content: Column(
    children: [
    TextField(
    controller: controller.usernameController,
    ),
    context.verticalSpace(0.03),
    ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(18),
    ),
    ),
    onPressed: () async {
    await controller.updateUserData();
    Get.back();
    },
    child: Text(
    AppStrings.update,
    style: TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: context.px(10),
    color: AppColors.onSurfaceColor,
    ),
    ),
    ),
    ],
    ).paddingAll(20),
    );
    },
    child: SvgPicture.asset(Assets.assetsSvgsEdit),
    ),
    ),
    context.verticalSpace(0.03),
    ListTile(
    leading: CircleAvatar(
    backgroundColor: AppColors.greyColor,
    child: SvgPicture.asset(
    Assets.assetsSvgsPhone,
    ),
    ),
    title: Text(
    'Phone Number',
    style: TextStyle(
    fontFamily: 'Poppins',
    fontSize: context.px(8),
    fontWeight: FontWeight.w500,
    color: AppColors.onSurfaceColorDarker,
    ),
    ),
    subtitle: Text(
    controller.userData['phone'] ?? '',
    style: TextStyle(
    fontFamily: 'Poppins',
    fontSize: context.px(12),
    fontWeight: FontWeight.w600,
    ),
    ),
    trailing: GestureDetector(
    onTap: () {
    Get.defaultDialog(
    title: AppStrings.phoneNumber,
    content: Column(
    children: [
    TextField(
    controller: controller.phoneController,
    ),
    context.verticalSpace(0.03),
    ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(18),
    ),
    ),
    onPressed: () async {
    await controller.updateUserData();
    Get.back();
    },
    child: Text(
    AppStrings.update,
    style: TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: context.px(10),
    color: AppColors.onSurfaceColor,
    ),
    ),
    ),
    ],
    ).paddingAll(20),
    );
    },
    child: SvgPicture.asset(Assets.assetsSvgsEdit),
    ),
    ),
    context.verticalSpace(0.03),
    ListTile(
    leading: CircleAvatar(
    backgroundColor: AppColors.greyColor,
    child: SvgPicture.asset(
    Assets.assetsSvgsEmail,
    ),
    ),
    title: Text(
    'Email',
    style: TextStyle(
    fontFamily: 'Poppins',
    fontSize: context.px(8),
    fontWeight: FontWeight.w500,
    color: AppColors.onSurfaceColorDarker,
    ),
    ),
    subtitle: Text(
    controller.userData['email'] ?? '',
    style: TextStyle(
    fontFamily: 'Poppins',
    fontSize: context.px(12),
    fontWeight: FontWeight.w600,
    ),
    ),
    trailing: GestureDetector(
    onTap: () {
    Get.defaultDialog(
    title: AppStrings.emailAddress,
    content: Column(
    children: [
    TextField(
    controller: controller.emailController,
    ),
    context.verticalSpace(0.03),
    ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(18),
    ),
    ),
    onPressed: () async {
    await controller.updateUserData();
    Get.back();
    },
    child: Text(
    AppStrings.update,
    style: TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: context.px(10),
    color: AppColors.onSurfaceColor,
    ),
    ),
    ),
    ],
    ).paddingAll(20),
    );
    },
    child: SvgPicture.asset(Assets.assetsSvgsEdit),
    ),
    ),
    context.verticalSpace(0.03),
    ListTile(
    leading: CircleAvatar(
    backgroundColor: AppColors.greyColor,
    child: SvgPicture.asset(
    Assets.assetsSvgsLocation,
    ),
    ),
    title: Text(
          'machines paired with',
          style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: context.px(8),
          fontWeight: FontWeight.w500,
          color: AppColors.onSurfaceColorDarker,
          ),
          ),
          subtitle: Text(
          'Public: arab academy for science and technology Smart village \npersonal: zamalek',
          style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: context.px(12),
          fontWeight: FontWeight.w600,
          ),
          ),
          trailing: SvgPicture.asset(Assets.assetsSvgsEdit),
          ),
          const Spacer(),
          ElevatedButton(
          style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.ctaColor,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          ),
          ),
          onPressed: () {
          AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          body: const Center(
          child: Text(AppStrings.areYouSureYouWantToSignOut),
          ),
          title: AppStrings.signOut,
          btnCancelOnPress: () {},
          btnOkOnPress: () {
          controller.signOut();
          },
          ).show();
          },
          child: Text(
          AppStrings.signOut,
          style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: context.px(10),
          color: AppColors.primaryColorDarker,
          ),
          ),
          ),
          context.verticalSpace(0.03),
          ],
          );
        }).paddingSymmetric(
          horizontal: context.width * 0.05,
          vertical: context.height * 0.02,
        ),
    );
  }
}
