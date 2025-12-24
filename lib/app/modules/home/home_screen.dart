import 'dart:developer';

import 'package:dhoni_coffee_machine/app/core/assets/assets.dart';
import 'package:dhoni_coffee_machine/app/core/constants/app_colors.dart';
import 'package:dhoni_coffee_machine/app/core/constants/app_strings.dart';
import 'package:dhoni_coffee_machine/app/core/extensions/responsiveness_extension.dart';
import 'package:dhoni_coffee_machine/app/routes/add_new_machine_routes.dart';
import 'package:dhoni_coffee_machine/app/routes/home_machine_routes.dart';
import 'package:dhoni_coffee_machine/app/routes/profile_routes.dart';
import 'package:dhoni_coffee_machine/app/routes/public_machine_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.selectACoffeeMachineOrAddANewOne,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: context.px(14),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          leading: Image.asset(Assets.assetsPngsZyroImage1),
          actions: [
            context.horizontalSpace(0.1),
            GestureDetector(
              onTap: () {
                Get.toNamed(ProfileRoutes.profile);
              },
              child: SvgPicture.asset(
                Assets.assetsSvgsUserName,
                width: context.width * 0.05,
                height: context.height * 0.03,
              ),
            ),
            context.horizontalSpace(0.05),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                Assets.assetsPngsZyroImage1,
                width: context.width * 0.15,
              ),
            ),
            context.verticalSpace(0.03),
            Expanded(
              child: GetBuilder<HomeController>(builder: (_) {
                return controller.machines.isEmpty
                    ? const Center(
                        child: Text("No Machines, Please Add New Machine"),
                      )
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemCount: controller.machines.length,
                        itemBuilder: (context, index) {
                          var machine = controller.machines[index];
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  log(machine['machineType']);
                                  log(machine['machineName']);
                                  Get.toNamed(
                                    machine['machineType'] == 'home'
                                        ? HomeMachineRoutes.homeMachine
                                        : PublicMachineRoutes.publicMachine,
                                    arguments: machine['machineName'],
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(context.width * 0.01),
                                  width: context.width * 0.35,
                                  height: context.height * 0.15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.greyColor,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        machine['machineType'] == 'home'
                                            ? Assets.assetsPngsPreviewImage2
                                            : Assets.assetsPngsPreviewImage1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              context.verticalSpace(0.01),
                              Text(
                                machine['machineName'] ?? '',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: context.px(12),
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          );
                        },
                      );
              }),
            ),

            // const CustomBottomNavBar(),
          ],
        ).paddingSymmetric(
          vertical: context.height * 0.01,
          horizontal: context.width * 0.05,
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            Get.defaultDialog(
                title: "Please Select Machine Type",
                titlePadding: const EdgeInsets.all(8),
                cancel: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    "Back",
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
                content: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10)),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(
                              AddNewMachineRoutes.addNewMachine,
                              arguments: 'home',
                            );
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                Assets.assetsPngsPreviewImage2,
                                width: context.width * 0.2,
                                height: context.height * 0.2,
                              ),
                              const Text("Home Machine"),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10)),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(
                              AddNewMachineRoutes.addNewMachine,
                              arguments: 'public',
                            );
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                Assets.assetsPngsPreviewImage1,
                                width: context.width * 0.2,
                                height: context.height * 0.2,
                              ),
                              const Text("Public Machine"),
                            ],
                          ),
                        ),
                      ),
                    ]));
          },
          child: Container(
            height: context.height * 0.05,
            width: context.width * 0.9,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Text(
              AppStrings.addNewHomeMachine,
              style: TextStyle(
                fontSize: context.px(18),
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ));
  }
}
