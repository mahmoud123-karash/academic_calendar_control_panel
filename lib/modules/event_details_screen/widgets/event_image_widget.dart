import 'package:flutter/material.dart';

class EventImageWidget extends StatelessWidget {
  const EventImageWidget({super.key, required this.image, required this.size});
  final String image;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: size.width >= 600 ? 550 : size.width - 80,
          height: size.width > 600 ? 300 : 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
