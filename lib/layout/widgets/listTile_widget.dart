// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget(
      {super.key, required this.ontap, required this.text, required this.icon});
  final VoidCallback ontap;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      title: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
      leading: Icon(
        icon,
      ),
    );
  }
}
