import 'package:dhoni_coffee_machine/app/core/assets/assets.dart';
import 'package:dhoni_coffee_machine/app/core/components/k_back_button.dart';
import 'package:dhoni_coffee_machine/app/core/constants/app_strings.dart';
import 'package:dhoni_coffee_machine/app/core/extensions/responsiveness_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import '../../routes/verification_routes.dart';
import 'forgot_password_controller.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({super.key});

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
            AppStrings.forgotPassword,
            style: TextStyle(
              fontSize: context.px(20),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          context.verticalSpace(0.01),
          Text(
            AppStrings.enterYourPhoneNumber,
            style: TextStyle(
              fontSize: context.px(12),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              color: AppColors.onSurfaceColorDarker,
            ),
          ),
          context.verticalSpace(0.03),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: context.kWidth * 0.01,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(),
                  ),
                ),
                child: SvgPicture.asset(Assets.assetsSvgsPhone),
              ),
              label: Text(
                AppStrings.phoneNumber,
                style: TextStyle(
                  fontSize: context.px(12),
                ),
              ).paddingOnly(left: context.kWidth * 0.01),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton.filled(
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                onPressed: () {
                  Get.toNamed(VerificationRoutes.verification);
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
            ),
          ),
        ],
      ).paddingSymmetric(
        horizontal: context.kWidth * 0.1,
        vertical: context.kHeight * 0.1,
      ),
    );
  }
}
