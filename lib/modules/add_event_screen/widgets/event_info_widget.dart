import 'package:academic_calendar/cubit/admin_cubit.dart';
import 'package:academic_calendar/generated/l10n.dart';
import 'package:academic_calendar/modules/add_event_screen/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jhijri_picker/jhijri_picker.dart';

class EventInfoWidget extends StatelessWidget {
  const EventInfoWidget(
      {super.key,
      required this.namecontroller,
      required this.datecontroller,
      required this.descontroller,
      required this.size});
  final TextEditingController namecontroller;
  final TextEditingController datecontroller;
  final TextEditingController descontroller;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWidget(
          textInputType: TextInputType.text,
          ontap: () {},
          lines: 1,
          size: size,
          name: S.of(context).eventname,
          icon: Icons.note_alt_outlined,
          controller: namecontroller,
        ),
        const SizedBox(
          height: 20,
        ),
        TextFieldWidget(
          textInputType: TextInputType.none,
          ontap: () async {
            await showGlobalDatePicker(
              context: context,
              pickerType: PickerType.JNormal,
              onChange: (datetime) {
                String formattedDate =
                    DateFormat.yMMMEd().format(datetime.date);
                var day = datetime.jhijri.day.toString();
                var mounth = datetime.jhijri.monthName.toString();
                var year = datetime.jhijri.year.toString();
                String date = '$formattedDate - $day $mounth $year';
                AdminCubit.get(context).dateTime = formattedDate;
                AdminCubit.get(context).jHijridate = '$day $mounth $year';
                AdminCubit.get(context).dateO = "${datetime.date}";
                datecontroller.text = date;
              },
              onOk: (datetime) {
                Navigator.pop(context);
              },
            );
          },
          lines: 1,
          size: size,
          name: S.of(context).eventdate,
          icon: Icons.calendar_month,
          controller: datecontroller,
        ),
        const SizedBox(
          height: 20,
        ),
        TextFieldWidget(
          textInputType: TextInputType.text,
          ontap: () {},
          lines: 3,
          size: size,
          name: S.of(context).eventde,
          icon: Icons.description_outlined,
          controller: descontroller,
        )
      ],
    );
  }
}
