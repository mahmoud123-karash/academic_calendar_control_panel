import 'package:flutter/material.dart';
import 'package:jhijri_picker/jhijri_picker.dart';

class DatePackerWidget extends StatelessWidget {
  const DatePackerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return JGlobalDatePicker(
      widgetType: WidgetType.JContainer,
      pickerType: PickerType.JHijri,
      buttons: const SizedBox(),
      primaryColor: Colors.blue,
      calendarTextColor: Colors.white,
      backgroundColor: Colors.black,
      borderRadius: const Radius.circular(10),
      headerTitle: const Center(
        child: Text("التقويم الهجري"),
      ),
      startDate: JDateModel(dateTime: DateTime.parse("1984-12-24")),
      selectedDate: JDateModel(dateTime: DateTime.now()),
      endDate: JDateModel(dateTime: DateTime.parse("2030-09-20")),
      pickerMode: DatePickerMode.day,
      pickerTheme: Theme.of(context),
      textDirection: TextDirection.rtl,
      onChange: (val) {
        debugPrint(val.toString());
      },
    );
  }
}
