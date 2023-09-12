import 'package:flutter/material.dart';

class ImageContainerWidget extends StatelessWidget {
  const ImageContainerWidget(
      {super.key, required this.image, required this.size});

  final ImageProvider<Object> image;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width > 700 ? 500 : 300,
      height: size.width > 700 ? 400 : 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // border: Border.all(width: 1, color: myColor),
        image: DecorationImage(image: image, fit: BoxFit.contain),
      ),
    );
  }
}
