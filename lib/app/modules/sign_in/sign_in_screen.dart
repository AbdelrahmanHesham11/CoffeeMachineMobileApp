import 'package:dhoni_coffee_machine/app/core/constants/app_colors.dart';
import 'package:dhoni_coffee_machine/app/core/constants/app_strings.dart';
import 'package:dhoni_coffee_machine/app/core/extensions/responsiveness_extension.dart';
import 'package:dhoni_coffee_machine/app/routes/forgot_password_routes.dart';
import 'package:dhoni_coffee_machine/app/routes/sign_up_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/assets/assets.dart';
import 'sign_in_controller.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.kWidth * 0.1,
          vertical: context.kHeight * 0.1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.signIn,
              style: TextStyle(
                fontSize: context.px(22),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            context.verticalSpace(0.01),
            Text(
              AppStrings.welcomeBack,
              style: TextStyle(
                fontSize: context.px(14),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: AppColors.onSurfaceColorDarker,
              ),
            ),
            context.verticalSpace(0.09),
            TextFormField(
              controller: controller.phoneNumberController,
              decoration: InputDecoration(
                prefixIcon: Container(
                  padding: EdgeInsets.symmetric(horizontal: context.kWidth * 0.01),
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(color: AppColors.onSurfaceColorDarker),
                    ),
                  ),
                  child: SvgPicture.asset(Assets.assetsSvgsPhone),
                ),
                label: Padding(
                  padding: EdgeInsets.only(left: context.kWidth * 0.02),
                  child: const Text(AppStrings.phoneNumber),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            context.verticalSpace(0.01),
            Obx(() {
              return TextFormField(
                controller: controller.passwordController,
                obscureText: controller.isObscure.value,
                decoration: InputDecoration(
                  prefixIcon: Container(
                    padding: EdgeInsets.symmetric(horizontal: context.kWidth * 0.01),
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(color: AppColors.onSurfaceColorDarker),
                      ),
                    ),
                    child: SvgPicture.asset(Assets.assetsSvgsLock),
                  ),
                  label: Padding(
                    padding: EdgeInsets.only(left: context.kWidth * 0.02),
                    child: const Text(AppStrings.password),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.isObscure.value = !controller.isObscure.value;
                    },
                    icon: Icon(
                      controller.isObscure.value ? Icons.visibility_off : Icons.visibility,
                      size: context.kWidth * 0.05,
                    ),
                  ),
                ),
              );
            }),
            context.verticalSpace(0.03),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Get.toNamed(ForgotPasswordRoutes.forgotPassword);
                },
                child: const Text(
                  AppStrings.forgotPassword,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColors.activeColor,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(() {
                return Align(
                  alignment: Alignment.centerRight,
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : IconButton.filled(
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                    ),
                    onPressed: () {
                      controller.sendVerificationCode();
                    },
                    icon: RotatedBox(
                      quarterTurns: 2,
                      child: SvgPicture.asset(
                        Assets.assetsSvgsArrowleft,
                        width: context.kWidth * 0.07,
                        colorFilter: const ColorFilter.mode(
                          AppColors.onSurfaceColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            context.verticalSpace(0.03),
            Row(
              children: [
                const Text(AppStrings.newMember),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.activeColor,
                  ),
                  onPressed: () {
                    Get.toNamed(SignUpRoutes.signUp);
                  },
                  child: const Text(AppStrings.signUp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
