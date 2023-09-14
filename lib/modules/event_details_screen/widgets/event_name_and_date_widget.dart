import 'dart:ui';

import 'package:academic_calendar/generated/l10n.dart';
import 'package:academic_calendar/models/event_model.dart';
import 'package:academic_calendar/shared/constants.dart';
import 'package:flutter/material.dart';

class EventNameAndDateWidget extends StatelessWidget {
  const EventNameAndDateWidget({super.key, required this.event});
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          "${S.of(context).eventname}:",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: myColor,
            fontFeatures: const <FontFeature>[FontFeature.enable('aaaa')],
          ),
        ),
        Text(
          event.title!,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFeatures: <FontFeature>[FontFeature.enable('aaaa')],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "${S.of(context).eventdate}:",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: myColor,
            fontFeatures: const <FontFeature>[FontFeature.enable('aaaa')],
          ),
        ),
        Text(
          '${event.dateM}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFeatures: <FontFeature>[FontFeature.enable('aaaa')],
          ),
        ),
        Text(
          '${event.dateJ}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFeatures: <FontFeature>[FontFeature.enable('aaaa')],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "${S.of(context).eventde}:",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: myColor,
            fontFeatures: const <FontFeature>[FontFeature.enable('aaaa')],
          ),
        ),
        Text(
          event.description!,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFeatures: <FontFeature>[FontFeature.enable('aaaa')],
          ),
        ),
      ],
    );
  }
}
