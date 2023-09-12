// ignore_for_file: file_names

import 'package:academic_calendar/models/event_model.dart';
import 'package:academic_calendar/shared/constants.dart';
import 'package:flutter/material.dart';

class ItemNameAndDateWidget extends StatelessWidget {
  const ItemNameAndDateWidget(
      {super.key, required this.size, required this.event});
  final Size size;
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          event.title!,
          style: TextStyle(
            color: myColor,
            fontSize: size.width > 700 ? 25 : 20,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '${event.dateM}',
          style: TextStyle(
              fontSize: size.width > 700 ? 18 : 15,
              fontWeight: FontWeight.w600),
        ),
        Text(
          '${event.dateJ}',
          style: TextStyle(
              fontSize: size.width > 700 ? 18 : 15,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
