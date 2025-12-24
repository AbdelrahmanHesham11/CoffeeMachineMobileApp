import 'package:dhoni_coffee_machine/app/core/components/k_back_button.dart';
import 'package:dhoni_coffee_machine/app/core/constants/app_strings.dart';
import 'package:dhoni_coffee_machine/app/core/extensions/responsiveness_extension.dart';
import 'package:dhoni_coffee_machine/app/routes/home_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/assets/assets.dart';
import '../../core/constants/app_colors.dart';
import 'verification_controller.dart';

class VerificationScreen extends GetView<VerificationController> {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const KBackButton(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.verification,
            style: TextStyle(
              fontSize: context.px(20),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          context.verticalSpace(0.01),
          Text(
            AppStrings.enterYourOTPCodeWeSentYou,
            style: TextStyle(
              fontSize: context.px(12),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              color: AppColors.onSurfaceColorDarker,
            ),
          ),
          context.verticalSpace(0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              4,
              (index) => Container(
                width: context.kWidth * 0.12,
                height: context.kWidth * 0.13,
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                // TODO: ADD child ie. textformfield
              ),
            ),
          ),
          context.verticalSpace(0.03),
          Align(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: AppStrings.resendIn,
                    style: TextStyle(
                      fontSize: context.px(12),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: AppColors.onSurfaceColorDarker,
                    ),
                  ),
                  TextSpan(
                    text: ' 00:30',
                    style: TextStyle(
                      fontSize: context.px(12),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: AppColors.onSurfaceColorDarker,
                    ),
                  ),
                ],
              ),
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
                  Get.toNamed(HomeRoutes.home);
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
          )
        ],
      ).paddingSymmetric(
        horizontal: context.kWidth * 0.1,
        vertical: context.kHeight * 0.1,
      ),
    );
  }
}
