import 'package:flutter/material.dart';
import 'package:sovereign_solutions/anims/animation_chain_controller.dart';
import 'package:sovereign_solutions/anims/sequences.dart';
import 'package:sovereign_solutions/common/string_pairs.dart';
import 'package:sovereign_solutions/constants/default_styles.dart';

class HeaderBodyListFooterPair extends StatefulWidget {
  final String title1;
  final List<String> headersAndFooters1;
  final List<StringPair> bodyList1;
  final String title2;
  final List<String> headersAndFooters2;
  final List<StringPair> bodyList2;
  final AnimationChainController controller;

  const HeaderBodyListFooterPair({
    super.key,
    required this.headersAndFooters1,
    required this.bodyList1,
    required this.title1,
    required this.headersAndFooters2,
    required this.bodyList2,
    required this.title2,

    required this.controller,
  });

  @override
  State<HeaderBodyListFooterPair> createState() =>
      _HeaderBodyListFooterPairState();
}

class _HeaderBodyListFooterPairState extends State<HeaderBodyListFooterPair> {
  @override
  void initState() {
    super.initState();
    widget.controller.enqueue(
      "Body FadeIn",
      tags: {
        "Title1",
        "Header1",
        "Header2",
        "Body1",
        "Footer1",
        "Title2",
        "Header3",
        "Header4",
        "Body2",
        "Footer2",
      },
      builder: (c) => AnimSequences.policiesBody(c),
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
              'Title1',
              defaultValue: 1.0, // This will prevent null
            );
            return Opacity(
              opacity: opacity,
              child: Text(
                widget.title1,
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
              'Title1',
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
                widget.headersAndFooters1[0],
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
                widget.headersAndFooters1[1],
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
              'Body1',
              defaultValue: 1.0, // This will prevent null
            );
            return Opacity(
              opacity: opacity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...[
                    for (int i = 0; i < widget.bodyList1.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 4,
                        ),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: widget.bodyList1[i].headerText,
                                style: TextStyles.bodyTextBold,
                              ),
                              TextSpan(text: " - ", style: TextStyles.bodyText),
                              TextSpan(
                                text: widget.bodyList1[i].descriptionText,
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
              'Footer1',
              defaultValue: 1.0, // This will prevent null
            );
            return Opacity(
              opacity: opacity,
              child: Text(
                widget.headersAndFooters1[2],
                style: TextStyle(color: Colors.white, fontSize: 24),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
        SizedBox(height: 32),
        //////////////////////////////////////////////////////////////////
        AnimatedBuilder(
          animation: widget.controller.controller,
          builder: (context, child) {
            final opacity = widget.controller.valueFor<double>(
              'Body FadeIn',
              'Title2',
              defaultValue: 1.0, // This will prevent null
            );
            return Opacity(
              opacity: opacity,
              child: Text(
                widget.title2,
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
              'Title2',
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
              'Header3',
              defaultValue: 1.0, // This will prevent null
            );
            return Opacity(
              opacity: opacity,
              child: Text(
                widget.headersAndFooters1[0],
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
              'Header4',
              defaultValue: 1.0, // This will prevent null
            );
            return Opacity(
              opacity: opacity,
              child: Text(
                widget.headersAndFooters1[1],
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
              'Body2',
              defaultValue: 1.0, // This will prevent null
            );
            return Opacity(
              opacity: opacity,
              child: Column(
                children: [
                  ...[
                    for (int i = 0; i < widget.bodyList1.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 4,
                        ),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: widget.bodyList1[i].headerText,
                                style: TextStyles.bodyTextBold,
                              ),
                              TextSpan(text: " - ", style: TextStyles.bodyText),
                              TextSpan(
                                text: widget.bodyList1[i].descriptionText,
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
              'Footer2',
              defaultValue: 1.0, // This will prevent null
            );
            return Opacity(
              opacity: opacity,
              child: Text(
                widget.headersAndFooters1[2],
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
