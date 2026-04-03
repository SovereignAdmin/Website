import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sovereign_solutions/constants/enums.dart';
import 'package:sovereign_solutions/widgets/logo_text.dart';
import 'package:sovereign_solutions/widgets/page_template.dart';
import 'package:sovereign_solutions/widgets/website_body.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final DeviceResolution resolution = DeviceResolution.getFrom(context);

    return PageTemplate(
      hasFooter: true,
      child: ListView(
        children: [
          SizedBox(
            height: 160,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SvgPicture.asset("assets/base-logo.svg"),
                SizedBox(width: 9.5),
                LogoText(),
              ],
            ),
          ),
          SizedBox(height: 16),
          WebsiteBody(deviceResolution: resolution),
        ],
      ),
    );
  }
}
