import 'package:flutter/material.dart';
import 'package:flutter_design_extension/flutter_design_extension.dart';

class CustomBrands extends Brand {
  @override
  ColorTokens getColorTokens(bool isDarkMode) {
    return ColorTokens(
        brand: ColorBrand(
            main: Colors.red,
            dark: Colors.red.shade900,
            secondary: Colors.blueGrey,
            background: Colors.white),
        interaction: ColorInteraction(
            main: Colors.red.shade300,
            hover: Colors.red.shade200,
            pressed: Colors.red.shade400),
        neutral: ColorNeutralLight(),
        messaging: ColorMessagingLight());
  }
}

class AppDemoBrand extends Brand {
  @override
  ColorTokens getColorTokens(bool isDarkMode) {
    return ColorTokens(
        brand: ColorBrand(
            main: Colors.blue,
            dark: Colors.blue.shade900,
            secondary: Colors.blueGrey,
            background: Colors.white),
        interaction: ColorInteraction(
            main: Colors.blue.shade300,
            hover: Colors.blue.shade200,
            pressed: Colors.blue.shade400),
        neutral: ColorNeutralLight(),
        messaging: ColorMessagingLight());
  }
}
