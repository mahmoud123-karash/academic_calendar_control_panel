import 'dart:ui';

import 'package:academic_calendar/generated/l10n.dart';
import 'package:academic_calendar/shared/constants.dart';
import 'package:flutter/material.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key, required this.onpressed});
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: myColor,
      minWidth: double.infinity,
      onPressed: onpressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          S.of(context).login,
          style: const TextStyle(
            textBaseline: TextBaseline.alphabetic,
            fontSize: 15,
            color: Colors.white,
            fontFeatures: <FontFeature>[FontFeature.enable('aaaa')],
          ),
        ),
      ),
    );
  }
}
