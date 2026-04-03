import 'package:flutter/material.dart';
import 'package:sovereign_solutions/constants/palette.dart';

class PageLinks extends StatelessWidget {
  final String label;
  final bool activeTab;
  final VoidCallback buttonCallback;

  const PageLinks({
    super.key,
    required this.label,
    this.activeTab = false,
    required this.buttonCallback,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {},
      child: GestureDetector(
        onTap: buttonCallback,
        child: AnimatedDefaultTextStyle(
          duration: Duration(milliseconds: 500),
          style: TextStyle(
            color: switch (activeTab) {
              true => ColorPalette.sovereignRed,
              false => Colors.white,
            },
            fontSize: 24,
          ),
          child: Text(label),
        ),
      ),
    );
  }
}
