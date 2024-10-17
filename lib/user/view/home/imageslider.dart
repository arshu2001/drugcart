
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageSlider extends StatefulWidget {
  final Function(int) onChange;
  final int currentSlide;
  
  const ImageSlider({Key? key, required this.currentSlide, required this.onChange}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late Stream<QuerySnapshot> _medicineofferStream;

  @override
  void initState() {
    super.initState();
    _medicineofferStream = _firestore.collection('Medicineoffer').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox( 
          height: 220,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: StreamBuilder<QuerySnapshot>(
              stream: _medicineofferStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: CustomText(text: 'No offers available', size: 30));
                }

                List<Widget> allImageWidgets = [];

                for (var doc in snapshot.data!.docs) {
                  var data = doc.data() as Map<String, dynamic>;
                  var imageUrls = data['imageurls'] as List<dynamic>?;
                  
                  if (imageUrls != null && imageUrls.isNotEmpty) {
                    allImageWidgets.addAll(imageUrls.map((url) => 
                      Image.network(
                        url as String,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey,
                            child: const Center(child: Text('Error loading image')),
                          );
                        },
                      )
                    ));
                  }
                }

                if (allImageWidgets.isEmpty) {
                  return Center(child: CustomText(text: 'No images available', size: 30));
                }

return CarouselSlider(
                  items: allImageWidgets,
                  options: CarouselOptions(
                    height: 220,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      widget.onChange(index);
                    },
                  ),
                );
              },
            ),
          ),
        ),
        Positioned.fill(
          bottom: 10,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: StreamBuilder<QuerySnapshot>(
              stream: _medicineofferStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Container();
                int totalImages = snapshot.data!.docs.fold(0, (sum, doc) {
                  var imageUrls = (doc.data() as Map<String, dynamic>)['imageurls'] as List<dynamic>?;
                  return sum + (imageUrls?.length ?? 0);
                });
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    totalImages,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: widget.currentSlide == index ? 15 : 8,
                      height: 8,
                      margin: const EdgeInsets.only(right: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: widget.currentSlide == index ? Colors.black : Colors.transparent,
                        border: Border.all(color: Colors.black),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}