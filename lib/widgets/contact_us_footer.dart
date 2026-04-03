import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sovereign_solutions/constants/default_styles.dart';
import 'package:sovereign_solutions/constants/strings.dart';

class ContactUsFooter extends StatelessWidget {
  const ContactUsFooter({super.key, required this.isSmallScreen});
  final bool isSmallScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(ContactStrings.contactUs[0], style: TextStyles.bodyHeaderText),
        SizedBox(height: 8),
        Text(
          ContactStrings.contactUs[1],
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        SizedBox(
          height: isSmallScreen ? 50 : 30,
          child: ResponsiveRowColumn(
            rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
            layout: isSmallScreen
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            children: [
              ResponsiveRowColumnItem(
                child: ResponsiveRowColumn(
                  rowMainAxisAlignment: MainAxisAlignment.center,
                  layout: ResponsiveRowColumnType.ROW,
                  children: [
                    ResponsiveRowColumnItem(
                      child: Text(
                        ContactStrings.contactUsInfo[0].headerText,
                        style: TextStyles.bodyText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: SelectableText(
                        ContactStrings.contactUsInfo[0].descriptionText,
                        style: TextStyles.bodyTextRed,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              ResponsiveRowColumnItem(
                child: ResponsiveRowColumn(
                  rowMainAxisAlignment: MainAxisAlignment.center,
                  layout: ResponsiveRowColumnType.ROW,
                  children: [
                    ResponsiveRowColumnItem(
                      child: Text(
                        ContactStrings.contactUsInfo[1].headerText,
                        style: TextStyles.bodyText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: SelectableText(
                        ContactStrings.contactUsInfo[1].descriptionText,
                        style: TextStyles.bodyTextRed,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Text(
          ContactStrings.contactUs[2],
          style: TextStyles.bodyText,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
