import 'package:dhoni_coffee_machine/app/core/components/k_back_button.dart';
import 'package:dhoni_coffee_machine/app/core/extensions/responsiveness_extension.dart';
import 'package:dhoni_coffee_machine/app/routes/order_payment_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/assets/assets.dart';
import '../../core/components/day_night_time_picker_widget.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../routes/profile_routes.dart';
import 'public_machine_controller.dart';

class PublicMachineScreen extends GetView<PublicMachineController> {
  const PublicMachineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          '${AppStrings.connectedTo} ${controller.machineName} ${AppStrings.coffeeMachine}',
          overflow: TextOverflow.ellipsis,
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
            child: Column(
              children: [
                context.verticalSpace(0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDayNightTimePicker(context: context);
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            Assets.assetsPngsClockImage,
                            width: context.width * 0.4,
                            height: context.height * 0.3,
                          ),
                          context.verticalSpace(0.01),
                          Text(
                            AppStrings.scheduleATimeForACoffee,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: context.px(12),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(OrderPaymentRoutes.orderPayment);
                          },
                          child: Image.asset(
                            Assets.assetsPngsCoffeeImage,
                            width: context.width * 0.4,
                            height: context.height * 0.3,
                          ),
                        ),
                        context.verticalSpace(0.01),
                        Text(
                          AppStrings.prearingYourCoffee,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: context.px(12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                context.verticalSpace(0.01),
                Container(
                  width: context.width * 0.9,
                  height: context.height * 0.45,
                  decoration: const BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: ChatBotWidget(),
                ),
                context.verticalSpace(0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChatBotWidget extends StatefulWidget {
  @override
  _ChatBotWidgetState createState() => _ChatBotWidgetState();
}

class _ChatBotWidgetState extends State<ChatBotWidget> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];

  void _sendMessage(String message) {
    setState(() {
      _messages.add({'user': message});
      _controller.clear();
      _getResponse(message);
    });
  }

  void _getResponse(String message) {
    String response;
    print('Received message: $message'); // Debug print
    switch (message.toLowerCase().trim()) {
      case 'hi':
        response = 'Hi, how are you!';
        break;
      case 'how are you':
        response = 'I am doing well! how about you?';
        break;
      case 'can you suggest a coffee':
      case 'suggest a coffee':
        response = 'We only have one type of drink but it\'s worth it!';
        break;
      case 'what types of coffee do you have':
      case 'types of coffee':
        response = 'We offer a special blend coffee, you will love it!';
        break;
      case 'tell me a joke':
        response = 'Why did the coffee file a police report? It got mugged!';
        break;
      case 'thank you':
      case 'thanks':
        response = 'You\'re welcome!';
        break;
      case 'haha':
        response = 'Glad you liked my joke :)';
        break;
      default:
        response = 'Sorry, I did not understand that.';
        break;
    }

    setState(() {
      _messages.add({'bot': response});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        context.verticalSpace(0.03),
        Container(
          width: context.width * 0.65,
          height: context.height * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.greyColor,
          ),
          child: Center(
            child: Text(
              AppStrings.yourPersonalAIAssistant,
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: context.px(14),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              final message = _messages[index];
              final isUserMessage = message.containsKey('user');
              return ListTile(
                title: Align(
                  alignment: isUserMessage
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: isUserMessage
                          ? Colors.blueAccent
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      isUserMessage ? message['user']! : message['bot']!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
          width: context.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: AppColors.surfaceColor,
          ),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: AppStrings.typeYourMessage,
              border: InputBorder.none,
              suffixIcon: IconButton(
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    _sendMessage(_controller.text);
                  }
                },
                icon: SvgPicture.asset(
                  Assets.assetsSvgsSend,
                ),
              ),
            ),
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                _sendMessage(value);
              }
            },
          ),
        ),
      ],
    );
  }
}
