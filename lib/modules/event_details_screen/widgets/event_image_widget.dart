import 'package:flutter/material.dart';

class EventImageWidget extends StatelessWidget {
  const EventImageWidget({super.key, required this.image, required this.size});
  final String image;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width > 700 ? 500 : 250,
      height: size.width > 700 ? 300 : 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      ),
    );
  }
}
