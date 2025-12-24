import 'package:dhoni_coffee_machine/app/core/components/k_back_button.dart';
import 'package:dhoni_coffee_machine/app/core/constants/app_strings.dart';
import 'package:dhoni_coffee_machine/app/core/extensions/responsiveness_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/assets/assets.dart';
import '../../core/constants/app_colors.dart';
import 'pairing_complete_controller.dart';

class PairingCompleteScreen extends GetView<PairingCompleteController> {
  const PairingCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const KBackButton(),
        actions: [
          context.horizontalSpace(0.1),
          SvgPicture.asset(
            Assets.assetsSvgsUserName,
            width: context.width * 0.05,
            height: context.height * 0.03,
          ),
          context.horizontalSpace(0.05),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            Assets.assetsPngsZyroImage1,
            width: context.width * 0.15,
            height: context.height * 0.15,
          ),
          context.verticalSpace(0.03),
          Text(
            '${AppStrings.pairingCompleteSuccessfully} ${AppStrings.youCanNameTheMachineWhateverYouWant}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: context.px(20),
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          context.verticalSpace(0.05),
          TextFormField(
            controller: controller.machineNameController,
            decoration: InputDecoration(
              hintText: AppStrings.chooseAName,
              filled: true,
              fillColor: AppColors.greyColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
          context.verticalSpace(0.15),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
            ),
            onPressed: () {
              controller.addNewHomeMachine();
            },
            child: Text(
              AppStrings.done,
              style: TextStyle(
                fontSize: context.px(20),
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
          ),
          const Spacer(),
          // const CustomBottomNavBar()
        ],
      ).paddingSymmetric(
        horizontal: context.width * 0.05,
        vertical: context.height * 0.05,
      ),
    );
  }
}
