import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sovereign_solutions/anims/animation_chain_controller.dart';
import 'package:sovereign_solutions/anims/sequences.dart';
import 'package:sovereign_solutions/constants/enums.dart';
import 'package:sovereign_solutions/view/page_bodies/about_us_body.dart';
import 'package:sovereign_solutions/view/page_bodies/contact_us_formbody.dart';
import 'package:sovereign_solutions/view/page_bodies/policies_body.dart';
import 'package:sovereign_solutions/view/page_bodies/services_body.dart';
import 'package:sovereign_solutions/widgets/side_bar.dart';

class WebsiteBody extends StatefulWidget {
  const WebsiteBody({super.key, required this.deviceResolution});

  final DeviceResolution deviceResolution;

  @override
  State<WebsiteBody> createState() => _WebsiteBodyState();
}

class _WebsiteBodyState extends State<WebsiteBody>
    with SingleTickerProviderStateMixin {
  int pageIndex = 0;

  _setTab(int buttonIndex) {
    pageIndex = buttonIndex;
    setState(() {});
  }

  late AnimationChainController chain;
  final DateTime initialDateTime = DateTime.now();
  // late AnimationController _controller;
  // late SequenceAnimation _sidebarAnim;
  // late SequenceAnimation? _bodyAnim;

  @override
  void initState() {
    chain = AnimationChainController(vsync: this);

    chain.enqueue(
      "Sidebar Anim",
      tags: {"Option1", "Option2", "Option3", "Option4"},
      builder: (c) => AnimSequences.sideBarFadeIn(c),
    );

    chain.controller.forward();

    // _controller = AnimationController(vsync: this);
    //
    // _sidebarAnim = AnimSequences.sideBarFadeIn(_controller);
    // _bodyAnim = AnimSequences.bodyAnimAboutUs(_controller);
    //
    // _controller.forward();
    // _controller.addStatusListener((status) {
    //   if (status.isCompleted) {
    //     _controller.forward();
    //   }
    // });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = switch (widget.deviceResolution) {
      DeviceResolution.mobile || DeviceResolution.tablet => true,
      _ => false,
    };

    return ResponsiveRowColumn(
      layout: isSmallScreen
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      rowCrossAxisAlignment: CrossAxisAlignment.start,
      columnSpacing: 32,
      rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ResponsiveRowColumnItem(
          rowFlex: 1,
          child: SideBar(
            deviceResolution: widget.deviceResolution,
            activeIndex: pageIndex,
            tabCallbacks: [
              () => _setTab(0),
              () => _setTab(1),
              () => _setTab(2),
              () => _setTab(3),
            ],
            controller: chain,
          ),
        ),
        ResponsiveRowColumnItem(
          rowFlex: 3,
          child: switch (pageIndex) {
            0 => AboutUsBody(isSmallScreen: isSmallScreen, controller: chain),
            1 => ServicesBody(controller: chain),
            2 => ContactUsFormbody(initialDate: initialDateTime),
            3 => PoliciesBody(controller: chain),
            _ => Container(),
          },
        ),
      ],
    );
  }
}
