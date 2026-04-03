import 'package:flutter/material.dart';
import 'package:sovereign_solutions/constants/default_styles.dart';

class SInput extends StatelessWidget {
  final String labelText;
  final bool expandedSize;
  const SInput({super.key, required this.labelText, this.expandedSize = false});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Text(labelText, style: TextStyles.bodyText),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: TextFormField(
            minLines: expandedSize ? 4 : null,
            maxLines: expandedSize ? 8 : null,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
      ],
    );
  }
}
