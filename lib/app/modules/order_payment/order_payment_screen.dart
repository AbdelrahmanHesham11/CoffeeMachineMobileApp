import 'package:dhoni_coffee_machine/app/core/components/k_back_button.dart';
import 'package:dhoni_coffee_machine/app/core/constants/app_colors.dart';
import 'package:dhoni_coffee_machine/app/core/constants/app_strings.dart';
import 'package:dhoni_coffee_machine/app/core/extensions/responsiveness_extension.dart';
import 'package:dhoni_coffee_machine/app/routes/preparing_coffee_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/assets/assets.dart';
import '../../routes/profile_routes.dart';
import 'order_payment_controller.dart';

class OrderPaymentScreen extends GetView<OrderPaymentController> {
  const OrderPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.editYourCoffee,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontSize: context.px(12),
          ),
        ),
        centerTitle: true,
        leading: const KBackButton(),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(ProfileRoutes.profile);
            },
            icon: SvgPicture.asset(
              Assets.assetsSvgsUserName,
              width: context.width * 0.05,
              height: context.height * 0.03,
            ),
          ),
          context.horizontalSpace(0.05),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              AppStrings.selectABarista,
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w500,
                fontSize: context.px(12),
              ),
            ),
            trailing: RotatedBox(
              quarterTurns: 2,
              child: SvgPicture.asset(Assets.assetsSvgsArrowleft),
            ),
          ),
          Expanded(
            child: Container(
              width: context.width,
              decoration: const BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  context.verticalSpace(0.05),
                  Text(
                    AppStrings.orderPayment,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: context.px(18),
                    ),
                  ),
                  context.verticalSpace(0.1),
                  ListTile(
                    leading: Container(
                      width: context.width * 0.1,
                      height: context.height * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.surfaceColor,
                      ),
                    ),
                    title: Text(
                      'Abdelrahman Hesham',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: context.px(10),
                      ),
                    ),
                    subtitle: Text(
                      'Magic Coffee store\nBradford BD1 1PR ',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: context.px(10),
                      ),
                    ),
                    trailing: Image.asset(Assets.assetsPngsLogo),
                  ),
                  context.verticalSpace(0.1),
                  Container(
                    width: context.width * 0.8,
                    height: context.height * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.surfaceColor,
                    ),
                    child: Center(
                      child: RadioListTile(
                        title: Row(
                          children: [
                            Text(
                              AppStrings.onlinePayment,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: context.px(10),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            Image.asset(
                              Assets.assetsPngsVisa,
                              width: context.width * 0.1,
                            ),
                            Image.asset(
                              Assets.assetsPngsMasterCard,
                              width: context.width * 0.1,
                            ),
                          ],
                        ),
                        subtitle: Text(
                          AppStrings.assistBelarus,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: context.px(8),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        value: 1,
                        groupValue: 1,
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Text(
                        AppStrings.amount,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'EGP 19,99',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: context.px(10),
                        ),
                      ),
                    ],
                  ),
                  context.verticalSpace(0.01),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            AppStrings.totalPrice,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: context.px(10),
                              color: AppColors.onSurfaceColorDarker,
                            ),
                          ),
                          Text(
                            'EGP 19,99',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: context.px(14),
                            ),
                          ),
                          context.verticalSpace(0.01),
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.ctaColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () {
                          Get.toNamed(PreparingCoffeeRoutes.preparingCoffee);
                        },
                        icon: SvgPicture.asset(Assets.assetsSvgsPayment),
                        label: Text(
                          AppStrings.payNow,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: context.px(10),
                            color: AppColors.primaryColorDarker,
                          ),
                        ),
                      ),
                    ],
                  ),
                  context.verticalSpace(0.01),
                ],
              ).paddingSymmetric(horizontal: context.width * 0.04),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: context.width * 0.02),
    );
  }
}
