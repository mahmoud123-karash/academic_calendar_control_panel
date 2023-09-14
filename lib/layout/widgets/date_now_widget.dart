import 'dart:ui';

import 'package:academic_calendar/generated/l10n.dart';
import 'package:academic_calendar/shared/assets.dart';
import 'package:academic_calendar/shared/constants.dart';
import 'package:flutter/material.dart';

class DateNowWidget extends StatelessWidget {
  const DateNowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.Cal2),
          ),
        ),
      ),
      content: SizedBox(
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).datej,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: myColor,
                fontFeatures: const <FontFeature>[FontFeature.enable('aaaa')],
              ),
            ),
            Text(
              datej,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFeatures: <FontFeature>[FontFeature.enable('aaaa')],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              S.of(context).datem,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFeatures: const <FontFeature>[FontFeature.enable('aaaa')],
                color: myColor,
              ),
            ),
            Text(
              dateM,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFeatures: <FontFeature>[FontFeature.enable('aaaa')],
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            S.of(context).okt,
            style: const TextStyle(
              fontFeatures: <FontFeature>[FontFeature.enable('aaaa')],
            ),
          ),
        )
      ],
    );
  }
}
