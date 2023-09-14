import 'dart:ui';

import 'package:academic_calendar/generated/l10n.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      required this.size,
      required this.name,
      required this.icon,
      required this.controller,
      required this.lines,
      required this.ontap,
      required this.textInputType});
  final Size size;
  final String name;
  final IconData icon;
  final TextEditingController controller;
  final int lines;
  final VoidCallback ontap;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: TextFormField(
        keyboardType: textInputType,
        onTap: ontap,
        validator: (value) {
          if (value!.isEmpty) {
            return S.of(context).validate;
          }
          return null;
        },
        maxLines: lines,
        controller: controller,
        decoration: InputDecoration(
          labelText: name,
          labelStyle: const TextStyle(
            fontSize: 18,
            fontFeatures: <FontFeature>[FontFeature.enable('aaaa')],
          ),
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
