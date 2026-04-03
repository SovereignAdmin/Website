import 'package:flutter/material.dart';
import 'package:sovereign_solutions/constants/palette.dart' show ColorPalette;

class TextStyles {
  static const TextStyle bodyText = TextStyle(
    color: Colors.white,
    fontSize: 16,
  );
  static const TextStyle bodyTextRed = TextStyle(
    color: ColorPalette.sovereignRed,
    fontSize: 16,
  );
  static const TextStyle bodyTextBold = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle bodyHeaderText = TextStyle(
    color: Colors.white,
    fontSize: 24,
  );
  static const TextStyle hasProhibitionFontbigHeaderAndLogoText = TextStyle(
    color: Colors.white,
    fontFamily: "Prohibition",
    fontSize: 42,
  );
  static const TextStyle bigHeaderAndLogoText = TextStyle(
    color: Colors.white,
    fontSize: 42,
  );
}
