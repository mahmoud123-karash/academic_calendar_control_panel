// ignore_for_file: file_names

import 'package:academic_calendar/generated/l10n.dart';
import 'package:academic_calendar/modules/add_event_screen/add_event_screen.dart';
import 'package:academic_calendar/shared/components.dart';
import 'package:academic_calendar/shared/constants.dart';
import 'package:flutter/material.dart';

class ListTileControlWidget extends StatelessWidget {
  const ListTileControlWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).control,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text(
                S.of(context).message,
                style: TextStyle(color: myColor),
              ),
            ],
          ),
          const Spacer(),
          MaterialButton(
            color: Colors.grey[300],
            onPressed: () {
              navigatorTo(context, const AddEventScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                S.of(context).mon,
                style: TextStyle(color: myColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
