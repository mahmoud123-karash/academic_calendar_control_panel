import 'package:academic_calendar/generated/l10n.dart';
import 'package:academic_calendar/shared/constants.dart';
import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({super.key, required this.isdark, required this.size});
  final bool isdark;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      color: isdark ? Colors.grey[300] : Colors.white.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              S.of(context).date,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              date,
              style: TextStyle(color: myColor, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
