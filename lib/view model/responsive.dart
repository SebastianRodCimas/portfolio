import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive(
      {super.key,
      required this.desktop,
      required this.largeMobile,
      required this.mobile,
      required this.tablet,
      this.extraLargeScreen});
  final Widget desktop;
  final Widget? largeMobile;
  final Widget mobile;
  final Widget? tablet;
  final Widget? extraLargeScreen;

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= 500;
  }

  static bool isLargeMobile(BuildContext context) {
    return MediaQuery.of(context).size.width > 500 &&
        MediaQuery.of(context).size.width <= 700;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width > 700 &&
        MediaQuery.of(context).size.width < 1080;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1080 &&
        MediaQuery.of(context).size.width <= 1400;
  }

  static bool isExtraLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1400;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width > 1400 && extraLargeScreen != null) {
      return extraLargeScreen!;
    } else if (size.width >= 1080) {
      return desktop;
    } else if (size.width > 700 && size.width < 1080 && tablet != null) {
      return tablet!;
    } else if (size.width > 500 && size.width <= 700 && largeMobile != null) {
      return largeMobile!;
    } else {
      return mobile;
    }
  }
}
