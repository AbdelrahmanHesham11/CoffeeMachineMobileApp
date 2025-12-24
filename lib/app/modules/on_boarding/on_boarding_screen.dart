import 'package:dhoni_coffee_machine/app/core/assets/assets.dart';
import 'package:dhoni_coffee_machine/app/core/extensions/responsiveness_extension.dart';
import 'package:dhoni_coffee_machine/app/routes/sign_in_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import 'on_boarding_controller.dart';

class OnBoardingScreen extends GetView<OnBoardingController> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            context.verticalSpace(0.05),
            Image.asset(
              Assets.assetsPngsZyroImage1,
              height: context.height * 0.2,
            ),
            context.verticalSpace(0.03),
            Image.asset(
              Assets.assetsPngsOnBaording1,
              width: context.width,
              fit: BoxFit.fill,
            ),
            context.verticalSpace(0.03),
            Text(
              'creating coffee\nwith your fingers',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
                fontSize: context.px(26),
              ),
            ),
            context.verticalSpace(0.01),
            Text(
              'Magic coffee on order.',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
                fontSize: context.px(16),
                color: AppColors.onSurfaceColorDarker,
              ),
            ),
            context.verticalSpace(0.03),
            Row(
              children: [
                const Spacer(),
                Container(
                  height: context.height * 0.01,
                  width: context.width * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.activeColor,
                  ),
                ),
                context.horizontalSpace(0.02),
                Container(
                  width: context.width * 0.02,
                  padding: EdgeInsets.all(context.width * 0.2),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.activeColor,
                  ),
                ),
                context.horizontalSpace(0.02),
                Container(
                  width: context.width * 0.02,
                  padding: EdgeInsets.all(context.width * 0.2),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.activeColor,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(),
        onPressed: () {
          Get.offAllNamed(SignInRoutes.signIn);
        },
        child: RotatedBox(
          quarterTurns: 2,
          child: SvgPicture.asset(
            Assets.assetsSvgsArrowleft,
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
