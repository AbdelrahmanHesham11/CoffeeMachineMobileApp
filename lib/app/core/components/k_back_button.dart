import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../assets/assets.dart';

class KBackButton extends StatelessWidget {
  const KBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Get.back(),
      icon: SvgPicture.asset(Assets.assetsSvgsArrowleft),
    );
  }
}
