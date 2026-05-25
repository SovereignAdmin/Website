import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sovereign_solutions/constants/default_styles.dart';
import 'package:sovereign_solutions/constants/palette.dart';
import 'package:sovereign_solutions/widgets/s_input.dart';

class ContactUsFormbody extends StatefulWidget {
  final DateTime initialDate;
  const ContactUsFormbody({super.key, required this.initialDate});

  @override
  State<ContactUsFormbody> createState() => _ContactUsFormbodyState();
}

class _ContactUsFormbodyState extends State<ContactUsFormbody> {
  // TODO: Make animation sequence once this has been fleshed out for what data we would like to collect from the user.

  final BoardDateTimeTextController dateTimeController =
      BoardDateTimeTextController();
  late final DateTime? maxDateTime;
  late final DateTime? dateTimeString;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateTimeString = DateTime.tryParse(widget.initialDate.toIso8601String());
    maxDateTime = dateTimeString?.add(Duration(days: 365));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ResponsiveRowColumn(
          layout: ResponsiveRowColumnType.ROW,
          rowSpacing: 16,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 3,
              child: SInput(labelText: "First Name"),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 3,
              child: SInput(labelText: "Last Name"),
            ),
          ],
        ),
        SInput(labelText: "Email"),
        SInput(labelText: "Phone Number"),
        SInput(labelText: "Inquiry", expandedSize: true),
        SInput(labelText: "Extra Details", expandedSize: true),
        // SInput(labelText: "Best Times To Contact"),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Preferred Date.",
              style: TextStyles.bodyText,
              textAlign: TextAlign.left,
            ),
            BoardDateTimeInputField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              controller: dateTimeController,
              pickerType: DateTimePickerType.date,
              showPickerType: BoardDateTimeFieldPickerType.standard,
              options: const BoardDateTimeOptions(
                activeColor: ColorPalette.sovereignRed,
                backgroundColor: Colors.black,
                foregroundColor: Colors.black,
                backgroundDecoration: BoxDecoration(color: Colors.black),
                withSecond: false,
                textColor: Colors.white,
                languages: BoardPickerLanguages.en(),
              ),

              textStyle: Theme.of(context).textTheme.bodyMedium,
              onChanged: (date) {
                print('onchanged: $date');
              },
              initialDate: widget.initialDate,
              minimumDate: widget.initialDate,
              maximumDate: maxDateTime,
              onFocusChange: (val, date, text) {
                // print('on focus changed date: $val, $date, $text');
              },
              focusNode: BoardDateTimeInputFocusNode(),
            ),
          ],
        ),
        ElevatedButton(
          style: ButtonStyle(
            padding: WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            backgroundColor: WidgetStatePropertyAll(ColorPalette.sovereignRed),
            minimumSize: WidgetStatePropertyAll(Size(60, 60)),
          ),
          onPressed: () {},
          child: Text(
            "Submit",
            style: TextStyles.bodyHeaderText,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
