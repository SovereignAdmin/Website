import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:sovereign_solutions/view/homepage.dart';
import 'package:sovereign_solutions/view/screen_init.dart';

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(child: ScreenSetup()),
      if (state.uri.pathSegments.contains("Home"))
        BeamPage(type: BeamPageType.noTransition, child: Homepage()),
    ];
    return pages;
  }

  @override
  List<Pattern> get pathPatterns => ['/', 'Home'];
}
