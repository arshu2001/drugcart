import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final Function (int) onChange;
  final int CurrentSlide;
  const ImageSlider({super.key, required this.CurrentSlide, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        SizedBox( 
          height: 220,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PageView(
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: true,
              onPageChanged:  onChange,
              physics: const ClampingScrollPhysics(),
              children: [
                // here(tag:image)
                Image.asset('images/offer.png',
                fit: BoxFit.cover,
                ),
                Image.asset('images/offer2.png',
                fit: BoxFit.cover,
                )
              ],  
            ),
          ),
        ),
        Positioned.fill(
          bottom: 10,
          child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  List.generate(
              3 , (index) => AnimatedContainer(
                duration: const Duration(
                  milliseconds: 300),
                  width: CurrentSlide == index ?15:8,
                  height: 8,
                  margin: EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CurrentSlide == index? Colors.black:Colors.transparent,
                    border: Border.all(color: Colors.black) 
                  ),
                  ),
                  ),
          ),
        ),
        ),
      ],
    );
  }
}