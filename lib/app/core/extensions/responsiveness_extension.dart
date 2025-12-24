import 'package:flutter/material.dart';

extension ResponsivenessExtension on BuildContext {
  double get kWidth => MediaQuery.sizeOf(this).width;
  double get kHeight => MediaQuery.sizeOf(this).height;

  double get kShortestSide => MediaQuery.sizeOf(this).shortestSide;

  double get kDevicePixelRatio => MediaQuery.devicePixelRatioOf(this);

  bool get kIsMobile => kWidth < 600;
  bool get kIsTablet => kWidth < 1100 && kWidth >= 600;
  bool get kIsDesktop => kWidth >= 1100;

  double px(double fontSize) {
    return maxFontSize(fontSize);
  }

  double maxFontSize(double fontSize) {
    if (kIsMobile) {
      // the width of the figma design is 375px
      return fontSize * (kWidth / 375);
    }
    // TODO add tablet
    else if (kIsTablet) {
      return fontSize * (kWidth / 768);
    }
    // TODO add desktop
    else if (kIsDesktop) {
      return fontSize * (kWidth / 1440);
    }
    // fallback
    else {
      return fontSize;
    }
  }

  SizedBox verticalSpace(double height) {
    return SizedBox(
      height: kHeight * height,
    );
  }

  SizedBox horizontalSpace(double width) {
    return SizedBox(
      width: kWidth * width,
    );
  }
}
