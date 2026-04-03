import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sovereign_solutions/routes/routes.dart';

void main() {
  Beamer.setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final BeamerDelegate delegate = BeamerDelegate(
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [HomeLocation()],
    ).call,
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: delegate,
      routeInformationParser: BeamerParser(),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          // commented out breakpoints to simplify the problem,
          //
          // Currently we only care about mobile
          // and desktop layouts for laying out our app, but we may want to
          // handle Tablet and 4k screens in the future.
          const Breakpoint(start: 0, end: 500, name: MOBILE),
          const Breakpoint(start: 501, end: 840, name: TABLET),
          const Breakpoint(start: 841, end: 2559, name: DESKTOP),
          const Breakpoint(start: 2560, end: 3839, name: '2K'),
          const Breakpoint(start: 3840, end: double.infinity, name: '4K'),
        ],
      ),

      debugShowCheckedModeBanner: false,
    );
  }
}
