import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sovereign_solutions/anims/sequences.dart';
import 'package:sovereign_solutions/widgets/logo_text.dart';
import 'package:sovereign_solutions/widgets/page_template.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class ScreenSetup extends StatefulWidget {
  const ScreenSetup({super.key});

  @override
  State<ScreenSetup> createState() => _ScreenSetupState();
}

class _ScreenSetupState extends State<ScreenSetup>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SequenceAnimation _logoInit;

  int pageIndex = 0;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    _logoInit = AnimSequences.logoInit(_controller);

    // Execute!
    _controller.forward();

    _controller.addListener(() {
      if (_controller.isCompleted) {
        Beamer.of(context).beamToNamed("Home");
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) => Align(
                alignment: _logoInit["Logo Alignment"].value,
                child: Opacity(
                  opacity: _logoInit["Logo Fade"].value,
                  child: SvgPicture.asset("assets/base-logo.svg"),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 159.5,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) => Opacity(
                opacity: _logoInit["Logo Text Opacity"].value,
                child: LogoText(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
