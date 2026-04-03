import 'package:flutter/material.dart';
import 'package:sovereign_solutions/constants/enums.dart';
import 'package:sovereign_solutions/widgets/contact_us_footer.dart';

class PageTemplate extends StatelessWidget {
  final Widget child;
  final bool hasFooter;
  const PageTemplate({super.key, required this.child, this.hasFooter = false});

  @override
  Widget build(BuildContext context) {
    final DeviceResolution resolution = DeviceResolution.getFrom(context);
    final bool isSmallScreen = switch (resolution) {
      DeviceResolution.mobile || DeviceResolution.tablet => true,
      _ => false,
    };
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 300, maxWidth: double.infinity),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 25, 25, 25),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: child,
        ),
        persistentFooterDecoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
        ),
        persistentFooterButtons: hasFooter
            ? [ContactUsFooter(isSmallScreen: isSmallScreen)]
            : null,
      ),
    );
  }
}
