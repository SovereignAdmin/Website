import 'package:flutter/material.dart';
import 'package:sovereign_solutions/anims/animation_chain_controller.dart';
import 'package:sovereign_solutions/constants/strings.dart';
import 'package:sovereign_solutions/widgets/header_bodylist_footers/header_body_list_footer_pair.dart';

class PoliciesBody extends StatefulWidget {
  final AnimationChainController controller;
  const PoliciesBody({super.key, required this.controller});

  @override
  State<PoliciesBody> createState() => _PoliciesBodyState();
}

class _PoliciesBodyState extends State<PoliciesBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        HeaderBodyListFooterPair(
          headersAndFooters1: PaymentPolicyStrings.policyHeaderAndFooter,
          bodyList1: PaymentPolicyStrings.policiesList,
          title1: "Payment Policies",
          headersAndFooters2: DiagnosticPolicyStrings.policyHeaderAndFooter,
          bodyList2: DiagnosticPolicyStrings.policiesList,
          title2: "Diagnostic Policies",
          controller: widget.controller,
        ),
      ],
    );
  }
}
