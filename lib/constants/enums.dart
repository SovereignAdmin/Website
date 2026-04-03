import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

enum DeviceResolution {
  mobile(),
  tablet(),
  desktop(),
  hd2k(),
  hd4k();

  const DeviceResolution();

  factory DeviceResolution.getFrom(BuildContext context) {
    final ResponsiveBreakpointsData breakpoints = ResponsiveBreakpoints.of(
      context,
    );
    if (breakpoints.smallerOrEqualTo(MOBILE)) {
      return DeviceResolution.mobile;
    } else if (breakpoints.smallerOrEqualTo(TABLET)) {
      return DeviceResolution.tablet;
    } else if (breakpoints.smallerOrEqualTo(DESKTOP)) {
      return DeviceResolution.desktop;
    } else if (breakpoints.smallerOrEqualTo('2K')) {
      return DeviceResolution.hd2k;
    } else {
      return DeviceResolution.hd4k;
    }
  }
}

enum SlideDirection {
  right(4),
  up(2);

  final double pixelShift;
  const SlideDirection(this.pixelShift);
}
