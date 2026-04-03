import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sovereign_solutions/anims/animation_chain_controller.dart';
import 'package:sovereign_solutions/constants/enums.dart';
import 'package:sovereign_solutions/constants/strings.dart';
import 'package:sovereign_solutions/widgets/page_links.dart';

class SideBar extends StatelessWidget {
  final DeviceResolution deviceResolution;
  final int activeIndex;
  final List<VoidCallback> tabCallbacks;
  final AnimationChainController controller;
  const SideBar({
    super.key,
    required this.deviceResolution,
    required this.activeIndex,
    required this.tabCallbacks,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = switch (deviceResolution) {
      DeviceResolution.mobile || DeviceResolution.tablet => true,
      _ => false,
    };

    return FittedBox(
      fit: BoxFit.fitWidth,
      child: ResponsiveRowColumn(
        columnCrossAxisAlignment: CrossAxisAlignment.start,
        rowMainAxisAlignment: MainAxisAlignment.center,
        rowSpacing: 16,
        layout: isSmallScreen
            ? ResponsiveRowColumnType.ROW
            : ResponsiveRowColumnType.COLUMN,
        children: [
          ResponsiveRowColumnItem(
            child: AnimatedBuilder(
              animation: controller.controller,
              builder: (context, child) {
                final opacity = controller.valueFor<double>(
                  'Sidebar Anim',
                  'Option1',
                  defaultValue: 1.0, // This will prevent null
                );
                return Opacity(
                  opacity: opacity,
                  child: PageLinks(
                    label: CommonStrings.pageButtonLabels[0],
                    activeTab: activeIndex == 0,
                    buttonCallback: tabCallbacks[0],
                  ),
                );
              },
            ),
          ),
          ResponsiveRowColumnItem(
            child: AnimatedBuilder(
              animation: controller.controller,
              builder: (context, child) {
                controller.valueFor<double>(
                  'Sidebar Anim',
                  'Option2',
                  defaultValue: 1.0, // This will prevent null
                );
                return Opacity(
                  opacity: controller.valueFor(
                    "Sidebar Anim",
                    "Option2",
                    defaultValue: 0.0,
                  ),
                  child: PageLinks(
                    label: CommonStrings.pageButtonLabels[1],
                    activeTab: activeIndex == 1,
                    buttonCallback: tabCallbacks[1],
                  ),
                );
              },
            ),
          ),
          ResponsiveRowColumnItem(
            child: AnimatedBuilder(
              animation: controller.controller,
              builder: (context, child) {
                final opacity = controller.valueFor<double>(
                  'Sidebar Anim',
                  'Option3',
                  defaultValue: 1.0, // This will prevent null
                );
                return Opacity(
                  opacity: opacity,
                  child: PageLinks(
                    label: CommonStrings.pageButtonLabels[2],
                    activeTab: activeIndex == 2,
                    buttonCallback: tabCallbacks[2],
                  ),
                );
              },
            ),
          ),
          ResponsiveRowColumnItem(
            child: AnimatedBuilder(
              animation: controller.controller,
              builder: (context, child) {
                final opacity = controller.valueFor<double>(
                  'Sidebar Anim',
                  'Option4',
                  defaultValue: 1.0, // This will prevent null
                );
                return Opacity(
                  opacity: opacity,
                  child: PageLinks(
                    label: CommonStrings.pageButtonLabels[3],
                    activeTab: activeIndex == 3,
                    buttonCallback: tabCallbacks[3],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
