import 'package:academic_calendar/generated/l10n.dart';
import 'package:academic_calendar/shared/constants.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget(
      {super.key,
      required this.size,
      required this.isdark,
      required this.layoutkey});
  final Size size;
  final bool isdark;
  final GlobalKey<ScaffoldState> layoutkey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: size.width,
      color: isdark ? Colors.grey[200] : myColor,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              if (!layoutkey.currentState!.isDrawerOpen) {
                layoutkey.currentState!.openDrawer();
              }
            },
            icon: const Icon(Icons.menu),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            S.of(context).title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              date,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
