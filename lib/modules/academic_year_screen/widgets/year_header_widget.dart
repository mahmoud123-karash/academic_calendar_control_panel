import 'package:academic_calendar/generated/l10n.dart';
import 'package:academic_calendar/shared/constants.dart';
import 'package:flutter/material.dart';

class YearHeaderWidget extends StatelessWidget {
  const YearHeaderWidget(
      {super.key,
      required this.size,
      required this.isdark,
      required this.yearKey});
  final Size size;
  final bool isdark;
  final GlobalKey<ScaffoldState> yearKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: size.width,
      color: isdark ? myColor : Colors.grey[200],
      child: Row(
        children: [
          if (size.width < 900)
            IconButton(
              onPressed: () {
                if (!yearKey.currentState!.isDrawerOpen) {
                  yearKey.currentState!.openDrawer();
                }
              },
              icon: const Icon(Icons.menu_rounded),
            ),
          const SizedBox(
            width: 20,
          ),
          Text(
            S.of(context).year,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              year,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
