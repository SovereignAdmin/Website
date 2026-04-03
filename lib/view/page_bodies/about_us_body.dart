import 'package:flutter/material.dart';
import 'package:sovereign_solutions/anims/animation_chain_controller.dart';
import 'package:sovereign_solutions/anims/sequences.dart';
import 'package:sovereign_solutions/constants/default_styles.dart';
import 'package:sovereign_solutions/constants/strings.dart';

class AboutUsBody extends StatefulWidget {
  final bool isSmallScreen;
  final AnimationChainController controller;
  final String? footerImage;
  const AboutUsBody({
    super.key,
    required this.isSmallScreen,
    required this.controller,
    this.footerImage,
  });

  @override
  State<AboutUsBody> createState() => _AboutUsBodyState();
}

class _AboutUsBodyState extends State<AboutUsBody> {
  @override
  void initState() {
    super.initState();
    widget.controller.enqueue(
      "Body Anim",
      tags: {"Header", "Body"},
      builder: (c) => AnimSequences.bodyAnimAboutUs(c),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 8),
      shrinkWrap: true,
      children: [
        AnimatedBuilder(
          animation: widget.controller.controller,
          builder: (context, child) {
            final opacity = widget.controller.valueFor<double>(
              'Body Anim',
              'Header',
              defaultValue: 1.0, // This will prevent null
            );
            return Opacity(
              opacity: opacity,
              child: Text(
                widget.isSmallScreen
                    ? AboutBodyStrings.aboutHeader[0]
                    : AboutBodyStrings.aboutHeader[1],
                style: TextStyles.bigHeaderAndLogoText,
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: widget.controller.controller,
          builder: (context, child) {
            final opacity = widget.controller.valueFor<double>(
              'Body Anim',
              'Header',
              defaultValue: 1.0, // This will prevent null
            );
            return Opacity(
              opacity: opacity,
              child: Divider(
                color: Colors.white,
                height: 2,
                indent: 16,
                endIndent: 16,
              ),
            );
          },
        ),
        SizedBox(height: 8),
        AnimatedBuilder(
          animation: widget.controller.controller,
          builder: (context, child) {
            final opacity = widget.controller.valueFor<double>(
              'Body Anim',
              'Body',
              defaultValue: 1.0, // This will prevent null
            );
            return Opacity(
              opacity: opacity,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(height: 16),
                itemCount: AboutBodyStrings.aboutInfo.length,
                itemBuilder: (context, index) => Text(
                  AboutBodyStrings.aboutInfo[index],
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            );
          },
        ),

        SizedBox(height: 16),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: widget.isSmallScreen ? 300 : 800,
            minWidth: widget.isSmallScreen ? 300 : 500,
            maxHeight: widget.isSmallScreen ? 300 : 500,
            minHeight: widget.isSmallScreen ? 150 : 300,
          ),
          child: Image.asset(
            ImagePathsStrings.pcInternals1,
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}
