import 'dart:ui';

import 'package:academic_calendar/shared/constants.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.text, required this.onprssed});
  final String text;
  final VoidCallback onprssed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      color: Colors.grey[300],
      onPressed: onprssed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: TextStyle(
            color: myColor,
            fontSize: 20,
            fontFeatures: const <FontFeature>[FontFeature.enable('aaaa')],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
