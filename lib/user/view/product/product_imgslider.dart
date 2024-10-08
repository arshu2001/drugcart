import 'package:flutter/material.dart';

class ProductImgSlider extends StatelessWidget {
  final Function(int) onChange;

  // list of image paths here
  final List<String> imagePaths = [
    'images/zincovit.png',
    'images/offer.png', 
  ];

   ProductImgSlider({super.key, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        onPageChanged: onChange,
        itemCount: imagePaths.length, // Set the total number of images
        itemBuilder: (context, index) {
          return Image.asset(imagePaths[index]);
        },
      ),
    );
  }
}
