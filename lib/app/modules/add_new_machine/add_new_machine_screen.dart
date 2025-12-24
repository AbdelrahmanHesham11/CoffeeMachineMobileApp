import 'package:dhoni_coffee_machine/app/core/components/k_back_button.dart';
import 'package:dhoni_coffee_machine/app/core/extensions/responsiveness_extension.dart';
import 'package:dhoni_coffee_machine/app/routes/pairing_complete_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/assets/assets.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import 'add_new_machine_controller.dart';

class AddNewMachineScreen extends GetView<AddNewMachineController> {
  const AddNewMachineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          AppStrings.selectACoffeeMachineOrAddANewOne,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: context.px(14),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            color: AppColors.onSurfaceColor,
          ),
        ),
        centerTitle: true,
        leading: const KBackButton(),
        actions: [
          context.horizontalSpace(0.1),
          SvgPicture.asset(
            Assets.assetsSvgsUserName,
            width: context.width * 0.05,
            height: context.height * 0.03,
            colorFilter: const ColorFilter.mode(
              AppColors.onSurfaceColor,
              BlendMode.srcIn,
            ),
          ),
          context.horizontalSpace(0.05),
        ],
      ),
      body: Container(
        width: context.width,
        height: context.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              Assets.assetsPngsCoffeeTypeBackground,
            ),
          ),
        ),
        child: Column(
          children: [
            context.verticalSpace(0.1),
            Container(
              height: context.height * 0.7,
              decoration: BoxDecoration(
                color: AppColors.greyColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(50),
              ),
              margin: EdgeInsets.symmetric(horizontal: context.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.pleaseScanTheQRCodeOnTheBackOfTheCoffeeMachine,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: context.px(26),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  context.verticalSpace(0.05),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              '1. ${AppStrings.goToTheCoffeeMachineAndSearchForTheQRCode}',
                              style: TextStyle(
                                fontSize: context.px(14),
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            context.verticalSpace(0.05),
                            Text(
                              '2. ${AppStrings.thenGiveAccesstoTheApplicationToOpenTheCameraAndScanTheQRCodeAsShownInTheFigure}',
                              style: TextStyle(
                                fontSize: context.px(14),
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          Assets.assetsPngsQrCode,
                          width: context.width * 0.3,
                          height: context.height * 0.3,
                        ),
                      ),
                    ],
                  ),
                  context.verticalSpace(0.05),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(
                        PairingCompleteRoutes.pairingComplete,
                        arguments: controller.machineType,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      AppStrings.openTheCameraApp,
                      style: TextStyle(
                        fontSize: context.px(16),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              )
                  .paddingSymmetric(horizontal: context.width * 0.05)
                  .paddingOnly(top: context.height * 0.02),
            ),
            // const Spacer(),
            // // const CustomBottomNavBar(),
            // const Spacer(),
          ],
        ),
      ),
    );
  }
}
