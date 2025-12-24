import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../assets/assets.dart';
import '../constants/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(context.width * 0.01),
        width: context.width * 0.8,
        height: context.height * 0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.surfaceColor,
          boxShadow: const [
            BoxShadow(
              color: AppColors.greyColor,
              blurRadius: 5,
              offset: Offset(0, 5),
              spreadRadius: 5,
            ),
            BoxShadow(
              color: AppColors.greyColor,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SvgPicture.asset(
              Assets.assetsSvgsHome,
            ),
            const Spacer(),
            SvgPicture.asset(
              Assets.assetsSvgsGifts,
            ),
            const Spacer(),
            SvgPicture.asset(
              Assets.assetsSvgsReceipts,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
