import "package:dhoni_coffee_machine/app/core/components/k_back_button.dart";
import 'package:dhoni_coffee_machine/app/core/constants/app_strings.dart';
import 'package:dhoni_coffee_machine/app/core/extensions/responsiveness_extension.dart';
import 'package:dhoni_coffee_machine/app/routes/sign_in_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/assets/assets.dart';
import '../../core/constants/app_colors.dart';
import 'sign_up_controller.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const KBackButton(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.signUp,
            style: TextStyle(
              fontSize: context.px(22),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          context.verticalSpace(0.01),
          Text(
            AppStrings.createAnAccountHere,
            style: TextStyle(
              fontSize: context.px(14),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              color: AppColors.onSurfaceColorDarker,
            ),
          ),
          context.verticalSpace(0.05),
          TextFormField(
            controller: controller.usernameController,
            decoration: InputDecoration(
              prefixIcon: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: context.kWidth * 0.01),
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(color: AppColors.onSurfaceColorDarker),
                  ),
                ),
                child: SvgPicture.asset(Assets.assetsSvgsUserName),
              ),
              label: const Text(AppStrings.username)
                  .paddingOnly(left: context.kWidth * 0.02),
            ),
          ),
          context.verticalSpace(0.01),
          TextFormField(
            controller: controller.phoneController,
            decoration: InputDecoration(
              prefixIcon: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: context.kWidth * 0.01),
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(color: AppColors.onSurfaceColorDarker),
                  ),
                ),
                child: SvgPicture.asset(Assets.assetsSvgsPhone),
              ),
              label: const Text(AppStrings.phoneNumber)
                  .paddingOnly(left: context.kWidth * 0.02),
            ),
          ),
          context.verticalSpace(0.01),
          TextFormField(
            controller: controller.emailController,
            decoration: InputDecoration(
              prefixIcon: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: context.kWidth * 0.01),
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(color: AppColors.onSurfaceColorDarker),
                  ),
                ),
                child: SvgPicture.asset(Assets.assetsSvgsEmail),
              ),
              label: const Text(AppStrings.emailAddress)
                  .paddingOnly(left: context.kWidth * 0.02),
            ),
          ),
          context.verticalSpace(0.01),
          Obx(
            () {
              return TextFormField(
                controller: controller.passwordController,
                obscureText: controller.isObscure.value,
                decoration: InputDecoration(
                  prefixIcon: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.kWidth * 0.01),
                    decoration: const BoxDecoration(
                      border: Border(
                        right:
                            BorderSide(color: AppColors.onSurfaceColorDarker),
                      ),
                    ),
                    child: SvgPicture.asset(Assets.assetsSvgsLock),
                  ),
                  label: const Text(AppStrings.password)
                      .paddingOnly(left: context.kWidth * 0.02),
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.isObscure.value = !controller.isObscure.value;
                    },
                    icon: Icon(
                      controller.isObscure.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      size: context.kWidth * 0.05,
                    ),
                  ),
                ),
              );
            },
          ),
          context.verticalSpace(0.03),
          Align(
            alignment: Alignment.center,
            child: Text(
              AppStrings.bySigningUpYouAgreeToOurTermsOfUse,
              style: TextStyle(
                fontSize: context.px(10),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Obx(() {
                return controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : IconButton.filled(
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                        ),
                        onPressed: () {
                          controller.signUp();
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
                      );
              }),
            ),
          ),
          context.verticalSpace(0.03),
          Row(
            children: [
              const Text(AppStrings.alreadyAMember),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.activeColor,
                ),
                onPressed: () {
                  Get.toNamed(SignInRoutes.signIn);
                },
                child: const Text(AppStrings.signIn),
              ),
            ],
          )
        ],
      ).paddingSymmetric(
        horizontal: context.kWidth * 0.1,
        vertical: context.kHeight * 0.1,
      ),
    );
  }
}
