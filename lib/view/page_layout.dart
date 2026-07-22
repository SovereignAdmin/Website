import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sovereign_solutions/anims/animation_chain_controller.dart';
import 'package:sovereign_solutions/anims/sequences.dart';
import 'package:sovereign_solutions/constants/enums.dart';
import 'package:sovereign_solutions/widgets/contact_us_footer.dart';
import 'package:sovereign_solutions/widgets/side_bar.dart';
import 'package:sovereign_solutions/widgets/website_body.dart';

class PageLayout extends StatefulWidget {
  const PageLayout({super.key});

  @override
  State<PageLayout> createState() => _PageLayoutState();
}

class _PageLayoutState extends State<PageLayout>
    with SingleTickerProviderStateMixin {
  late final AnimationChainController chain;
  int pageIndex = 0;
  _setTab(int buttonIndex) {
    pageIndex = buttonIndex;
    setState(() {});
  }

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
    final DeviceResolution resolution = DeviceResolution.getFrom(context);
    final bool isSmallScreen = switch (resolution) {
      DeviceResolution.mobile || DeviceResolution.tablet => true,
      _ => false,
    };
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 25, 25),
      body: FittedBox(fit: BoxFit.fill, child: WebsiteBody()),
      persistentFooterDecoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
      ),
      persistentFooterButtons: [ContactUsFooter(isSmallScreen: isSmallScreen)],
    );
  }
}
