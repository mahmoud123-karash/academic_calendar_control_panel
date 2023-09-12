import 'package:academic_calendar/generated/l10n.dart';
import 'package:academic_calendar/shared/constants.dart';
import 'package:flutter/material.dart';

class EventDescriptionWidget extends StatelessWidget {
  const EventDescriptionWidget({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "  ${S.of(context).eventde}:",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w600, color: myColor),
        ),
        Text(
          description,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
