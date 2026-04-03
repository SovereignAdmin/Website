import 'package:flutter/material.dart';
import 'package:sovereign_solutions/anims/animation_chain_controller.dart';
import 'package:sovereign_solutions/anims/sequences.dart';
import 'package:sovereign_solutions/common/string_pairs.dart';
import 'package:sovereign_solutions/constants/default_styles.dart';

class HeaderBodyListFooter extends StatefulWidget {
  final List<String> headersAndFooters;
  final List<StringPair> bodyList;
  final String title;
  final AnimationChainController controller;

  const HeaderBodyListFooter({
    super.key,
    required this.headersAndFooters,
    required this.bodyList,
    required this.title,
    required this.controller,
  });

  @override
  State<HeaderBodyListFooter> createState() => _HeaderBodyListFooterState();
}

class _HeaderBodyListFooterState extends State<HeaderBodyListFooter> {
  @override
  void initState() {
    super.initState();
    widget.controller.enqueue(
      "Body FadeIn",
      tags: {"Title", "Header1", "Header2", "Body", "Footer"},
      builder: (c) => AnimSequences.serviceBody(c),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      shrinkWrap: true,
      children: [
        AnimatedBuilder(
          animation: widget.controller.controller,
          builder: (context, child) {
            final opacity = widget.controller.valueFor<double>(
              'Body FadeIn',
              'Title',
              defaultValue: 1.0, // This will prevent null
            );
            return Opacity(
              opacity: opacity,
              child: Text(
                widget.title,
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
              'Body FadeIn',
              'Title',
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
        AnimatedBuilder(
          animation: widget.controller.controller,
          builder: (context, child) {
            final opacity = widget.controller.valueFor<double>(
              'Body FadeIn',
              'Header1',
              defaultValue: 1.0, // This will prevent null
            );
            return Opacity(
              opacity: opacity,
              child: Text(
                widget.headersAndFooters[0],
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            );
          },
        ),

        SizedBox(height: 16),
        AnimatedBuilder(
          animation: widget.controller.controller,
          builder: (context, child) {
            final opacity = widget.controller.valueFor<double>(
              'Body FadeIn',
              'Header2',
              defaultValue: 1.0, // This will prevent null
            );
            return Opacity(
              opacity: opacity,
              child: Text(
                widget.headersAndFooters[1],
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            );
          },
        ),

        AnimatedBuilder(
          animation: widget.controller.controller,
          builder: (context, child) {
            final opacity = widget.controller.valueFor<double>(
              'Body FadeIn',
              'Body',
              defaultValue: 1.0, // This will prevent null
            );
            return Opacity(
              opacity: opacity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...[
                    for (int i = 0; i < widget.bodyList.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 4,
                        ),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: widget.bodyList[i].headerText,
                                style: TextStyles.bodyTextBold,
                              ),
                              TextSpan(text: " - ", style: TextStyles.bodyText),
                              TextSpan(
                                text: widget.bodyList[i].descriptionText,
                                style: TextStyles.bodyText,
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ],
              ),
            );
          },
        ),

        SizedBox(height: 12),
        AnimatedBuilder(
          animation: widget.controller.controller,
          builder: (context, child) {
            final opacity = widget.controller.valueFor<double>(
              'Body FadeIn',
              'Footer',
              defaultValue: 1.0, // This will prevent null
            );
            return Opacity(
              opacity: opacity,
              child: Text(
                widget.headersAndFooters[2],
                style: TextStyle(color: Colors.white, fontSize: 24),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      ],
    );
  }
}
