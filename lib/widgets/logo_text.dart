import 'package:flutter/material.dart';
import 'package:sovereign_solutions/constants/default_styles.dart';
import 'package:sovereign_solutions/constants/palette.dart' show ColorPalette;
import 'package:sovereign_solutions/constants/strings.dart';

class LogoText extends StatelessWidget {
  const LogoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          CommonStrings.companyNameLogo[0],
          style: TextStyles.hasProhibitionFontbigHeaderAndLogoText,
        ),
        Text(
          CommonStrings.companyNameLogo[1],
          style: TextStyle(
            color: ColorPalette.sovereignRed,
            fontFamily: "Prohibition",
            fontSize: 26,
          ),
        ),
        Text(
          CommonStrings.companyNameLogo[2],
          style: TextStyles.hasProhibitionFontbigHeaderAndLogoText,
        ),
      ],
    );
  }
}
