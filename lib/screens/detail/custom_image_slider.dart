import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomImageSlider extends StatelessWidget {
  const CustomImageSlider({
    super.key,
    required this.image,
    required this.onChange,
  });
  final Function(int) onChange;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        onPageChanged: onChange,
        itemBuilder: (context, index) {
          return Hero(
            tag: image,
            child: Image.asset(image),
          );
        },
      ),
    );
  }
}
