import 'package:flutter/cupertino.dart';

class AdminproductimageSlider extends StatelessWidget {
  final Function(int) onChange;
  final List<String> imagePaths;
  // list of image paths here

   AdminproductimageSlider({super.key, required this.onChange, required this.imagePaths});
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        onPageChanged: onChange,
        itemCount: imagePaths.length, // Set the total number of images
        itemBuilder: (context, index) {
          return Image.network(imagePaths[index],fit: BoxFit.cover,);
        },
      ),
    );
  }
}