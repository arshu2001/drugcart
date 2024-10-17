import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  final Function (int) onChange;
  final int CurrentSlide;
   ImageSlider({super.key, required this.CurrentSlide, required this.onChange});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final String? _userId = FirebaseAuth.instance.currentUser?.uid;

  late Stream<QuerySnapshot> _medicineofferStream;

  @override
  void initState(){
    super.initState();
    _medicineofferStream = _firestore.collection('Medicineoffer').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        SizedBox( 
          height: 220,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: StreamBuilder(
              stream: _medicineofferStream,
              builder: (context, medicineofferSnapshot) {
                if(medicineofferSnapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator(),);
                }else if(medicineofferSnapshot.hasError){
                  return Text('error: ${medicineofferSnapshot.error}');
                }
                if(!medicineofferSnapshot.hasData || medicineofferSnapshot.data!.docs.isEmpty){
                  return Center(child: CustomText(text: 'No items Available', size: 30),);
                }
                // List<Widget> imageofferWidgets = medicineofferSnapshot.data!.docs.map((doc){
                //   var imageurls = doc['imageUrls'];
                //   if(imageurls == null || !(imageurls is String)){
                //     return Container(
                //       color: Colors.grey,
                //       child: Center(child: Text('No image available'),),
                //     );
                //   }
                //   return Image.network(imageurls,fit: BoxFit.cover,);
                // }
                // ).toList();
                List<Widget> imageofferWidgets = medicineofferSnapshot.data!.docs.map((doc) {
                  try {
                    var imageUrl = doc['imageUrls'];
                    if (imageUrl == null || !(imageUrl is String)) {
                      return Container(
                        color: Colors.grey,
                        child: Center(child: Text('No image available')),
                      );
                    }
                    return Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    );
                  } catch (e) {
                    return Container(
                      color: Colors.grey,
                      child: Center(child: Text('Error loading image')),
                    );
                  }
                }).toList();
                return PageView(
                  scrollDirection: Axis.horizontal,
                  allowImplicitScrolling: true,
                  onPageChanged:  widget.onChange,
                  physics: const ClampingScrollPhysics(),
                  children: imageofferWidgets,
                  // children: [
                    // here(tag:image)
                    // Image.asset('images/offer.png',
                    // fit: BoxFit.cover,
                    // ),
                    // Image.asset('images/offer2.png',
                    // fit: BoxFit.cover,
                    // )
                    
                  // ],  
                );
              }
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
                  width: widget.CurrentSlide == index ?15:8,
                  height: 8,
                  margin: EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: widget.CurrentSlide == index? Colors.black:Colors.transparent,
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