import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/medical_shop/model/medicine_offer_modal.dart';
import 'package:drugcart/medical_shop/view/home.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MedicalOffer extends StatefulWidget {
  const MedicalOffer({super.key});

  @override
  State<MedicalOffer> createState() => _MedicalOfferState();
}

class _MedicalOfferState extends State<MedicalOffer> {
  final TextEditingController offernamecontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();

  List<File> _images = [];
  List<String> imageurls = [];

  Future<void> _pickofferImage()async{
    final PickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(PickedFile != null) {
      setState(() {
        _images.add(File(PickedFile.path));
      });
    }
  }

  Future<List<String>> _uploadofferImages() async{
    List<String> imageUrls = [];
    for(var image in _images){
      String fileName = DateTime.now().microsecondsSinceEpoch.toString();
      Reference ref = FirebaseStorage.instance.ref().child('medicineoffer_images/$fileName');
      await ref.putFile(image);
      String downloadUrl = await ref.getDownloadURL();
      imageUrls.add(downloadUrl);
    }
    return imageUrls;
  }

  Widget _buildMediaItemOffer(File image) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.file(
        image,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ),
  );
  }

  Future<void> _saveMedicineOffer() async{
    if(formkey.currentState!.validate()){
      try {
        showDialog(
          context: context,
          barrierDismissible: false,
           builder: (BuildContext content){
            return Center(child: CircularProgressIndicator(),);
           }
           );
             final user = FirebaseAuth.instance.currentUser;
             if(user == null) {
              throw 'user not authenticated';
             }
             String userId = user.uid;

             List<String> imageUrls = await _uploadofferImages();

             MedicineOfferModal newMedicineoffermodal = MedicineOfferModal(
              offername: offernamecontroller.text, 
              imageurls: imageurls
              );

              DocumentReference mainDocRef = await FirebaseFirestore.instance
              .collection('Medicineoffer')
              .add(newMedicineoffermodal.toMap());
              await mainDocRef.update({'id': mainDocRef.id});

              DocumentReference docref = await FirebaseFirestore.instance
              .collection('Medicineoffer')
              .doc(userId)
              .collection('medicineoffer_list')
              .add(newMedicineoffermodal.toMap());

              await docref.update({'id': docref.id});
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Medicineoffer added successfully!')),
        );
      } catch (e) {
        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error adding Medicineoffer: $e')),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(
            child: CustomText(
                text: 'Offer',
                size: 24,
                weight: FontWeight.bold,
                color: Colors.black)),
        bottom: PreferredSize(
          child: Container(
            color: Colors.black,
            height: 2.0,
          ),
          preferredSize: Size.fromHeight(.0),
        ),
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 15,top: 20),
                  child: CustomText(
                      text: 'Offer',
                      size: 18,
                      weight: FontWeight.normal,
                      color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,top: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      controller: offernamecontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: kgreyColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: kcontentColor,
                          hintText: 'enter the offer',
                          helperStyle: TextStyle(color: kgreyColor)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: InkWell(
                      onTap: () {
                        _pickofferImage();
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.height * 0.44,
                        color: kprimaryColor,
                        child: _images.isEmpty ?
                        const Icon(
                          Icons.add_photo_alternate_outlined,
                          size: 100,
                          color: Colors.white,
                        ): CarouselSlider(
                          items: [
                            ..._images.map((image) => _buildMediaItemOffer(image)).toList(),
                          ],
                           options: CarouselOptions(
                            height: MediaQuery.of(context).size.height * 0.3,
                            autoPlay: true,
                            enlargeCenterPage: true
                           ))
                      ),
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(top: 240),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green
                        ),
                        onPressed: () async{
                          if(imageurls.isEmpty && _images.isNotEmpty){
                            await _uploadofferImages();
                            await _saveMedicineOffer();
                          }
                      }, child: CustomText(text: 'Submit', size: 24, weight: FontWeight.bold, color: Colors.white)),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}