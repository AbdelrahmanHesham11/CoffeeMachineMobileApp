import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:convert';

// Import Bluetooth related packages
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import '../../core/assets/assets.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/extensions/responsiveness_extension.dart';
import '../../core/components/k_back_button.dart';
import '../../routes/profile_routes.dart';
import '../../routes/home_routes.dart';

import 'preparing_coffee_controller.dart';

class PreparingCoffeeScreen extends GetView<PreparingCoffeeController> {
  PreparingCoffeeScreen({Key? key}) : super(key: key);

  // Define Bluetooth instance
  final FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;

  // Function to establish Bluetooth connection
  void _connectToDevice(BluetoothDevice device) async {
    controller.connection = await BluetoothConnection.toAddress(device.address);
    controller.updateConnectionStatus();
  }

  // Function to send data over Bluetooth
  void _sendData(String data) {
    if (controller.connectionStatus.value) {
      if (controller.connection != null) {
        controller.connection!.output.add(utf8.encode(data + "\r\n"));
        controller.connection!.output.allSent;
      }
    } else {
      print('Not connected to any device');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.prearingYourCoffee,
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            context.verticalSpace(0.03),
            Image.asset(
              Assets.assetsPngsCoffeeImage,
            ),
            context.verticalSpace(0.15),
            Text(
              AppStrings.onceYourOrderIsDoneANotificationWillBeSentToYou,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: context.px(20),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColorDarker,
              ),
              onPressed: () {
                _bluetooth.getBondedDevices().then((devices) {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return ListView.builder(
                        itemCount: devices.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(devices[index].name ?? ''),
                            onTap: () {
                              _connectToDevice(devices[index]);
                              Navigator.pop(context);
                            },
                          );
                        },
                      );
                    },
                  );
                });
              },
              child: Obx(() => Text(
                controller.connectionStatus.value ? 'Connected' : 'Connect to Device',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: context.px(14),
                  color: AppColors.surfaceColor,
                ),
              )),
            ),
            context.verticalSpace(0.03),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColorDarker,
              ),
              onPressed: () {
                _sendData("0"); // Send value 0 over Bluetooth
              },
              child: Text(
                'Stop Brewing ',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: context.px(14),
                  color: AppColors.surfaceColor,
                ),
              ),
            ),
            context.verticalSpace(0.03),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColorDarker,
              ),
              onPressed: () {
                _sendData("1"); // Send value 1 over Bluetooth
              },
              child: Text(
                'Start Brewing ',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: context.px(14),
                  color: AppColors.surfaceColor,
                ),
              ),
            ),
            context.verticalSpace(0.03),
          ],
        ),
      ).paddingSymmetric(horizontal: context.kWidth * 0.05),
    );
  }
}
