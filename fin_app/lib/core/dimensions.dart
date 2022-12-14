import 'package:flutter/cupertino.dart';

class AppDimensions {
  static const kAppBarHeight = Size.fromHeight(60);
}

class AppPaddings {
  static const kCommonSurroundingPadding = EdgeInsets.all(25);
  static const kCommonHorizontalPadding = EdgeInsets.symmetric(horizontal: 25);
  static const kCommonVerticalPadding = EdgeInsets.symmetric(vertical: 25);
  static dynamicPadding({double H = 0, double V = 0}) =>
      EdgeInsets.symmetric(horizontal: H, vertical: V);
}

class AppFontWeights {
  static const light = FontWeight.w300;
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semiBold = FontWeight.w600;
  static const bold = FontWeight.w700;
}

class AppFontSize {
  static const small = 14.0;
  static const verySmall = 12.0;
  static const medium = 16.0;
  static const large = 18.0;
  static const veryLarge = 20.0;
  static const title = 30.0;
  static const bigTitle = 35.0;
  static const splash = 60.0;
}

class AppSizeBox {
  static Widget dynamicBox({double H = 0, double W = 0}) =>
      SizedBox(height: H, width: W);
  static Widget h10() => const SizedBox(height: 10);
  static Widget h5() => const SizedBox(height: 5);
  static Widget h20() => const SizedBox(height: 20);
  static Widget h50() => const SizedBox(height: 50);
  static Widget h100() => const SizedBox(height: 100);
  static Widget w5() => const SizedBox(width: 5);
  static Widget w10() => const SizedBox(width: 10);
  static Widget w20() => const SizedBox(width: 20);
  static Widget w50() => const SizedBox(width: 50);
  static Widget w100() => const SizedBox(width: 100);
}
