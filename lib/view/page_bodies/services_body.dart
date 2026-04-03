import 'package:flutter/material.dart';
import 'package:sovereign_solutions/anims/animation_chain_controller.dart';
import 'package:sovereign_solutions/constants/strings.dart';
import 'package:sovereign_solutions/widgets/header_bodylist_footers/header_bodylist_footer.dart';

class ServicesBody extends StatefulWidget {
  final AnimationChainController controller;
  const ServicesBody({super.key, required this.controller});

  @override
  State<ServicesBody> createState() => _ServicesBodyState();
}

class _ServicesBodyState extends State<ServicesBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderBodyListFooter(
          title: "Services",
          headersAndFooters: ServicesStrings.servicesHeaderAndFooter,
          bodyList: ServicesStrings.servicesList,
          controller: widget.controller,
        ),
      ],
    );
  }
}
