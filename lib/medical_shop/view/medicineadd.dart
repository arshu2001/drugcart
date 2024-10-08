// ignore_for_file: sort_child_properties_last

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/medical_shop/view/product_details.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/custom_textfield.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class MedicineAdd extends StatefulWidget {
  const MedicineAdd({super.key});

  @override
  State<MedicineAdd> createState() => _MedicineAddState();
}

class _MedicineAddState extends State<MedicineAdd> {
  final TextEditingController medicinenamecontroller = TextEditingController();
  final TextEditingController pricecontroller = TextEditingController();
  final TextEditingController descriptioncontroller = TextEditingController();
  final TextEditingController faqcontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();

  XFile? pick;
  File? image;
  var imageUrl;

  Future<void> addImage()async{
    try {
      ImagePicker picked = ImagePicker();
      pick = await picked.pickImage(source: ImageSource.gallery);
      if(pick != null){
        setState(() {
          image = File(pick!.path);
        });
      }
    } catch (e) {
     print("error: $e") ;
    }
  }

  Future<void> savedata()async{
    try {
      await FirebaseFirestore.instance.collection("addMedicine").add({
        "medicinename" : medicinenamecontroller.text,
        "medicineprice" : pricecontroller.text,
        "description" : descriptioncontroller.text,
        "FAQ" : faqcontroller.text,
        "imageurl" : imageUrl.toString()
      });
    } catch (e) {
      print("error : $e");
    }
  }

  Future<void> saveImage() async{
    if(image != null){
      try {
        final ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child("medicineImage")
        .child(DateTime.now().microsecondsSinceEpoch.toString());
      await ref.putFile(image!);
      var imgurl = await ref.getDownloadURL();
      setState(() {
        imageUrl = imgurl;
      });  
      print(imgurl);
      } catch (e) {
        print(e);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
            text: 'Medicine Add',
            size: 24,
            weight: FontWeight.bold,
            color: Colors.black),centerTitle: true,
        // bottom: PreferredSize(
        //   child: Container(
        //     color: Colors.black,
        //     height: 2.0,
        //   ),
        //   preferredSize: Size.fromHeight(.0),
        // ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: InkWell(
                    onTap:() {
                      addImage();
                    } ,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.height * 0.44,
                      color: Color(0xFF00796B),
                      child: image == null ? const Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 100,
                        color: Colors.white,
                      ):Image.file(image!,fit: BoxFit.cover,)
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 10),
                child: CustomText(
                    text: 'Medicine Name',
                    size: 18,
                    weight: FontWeight.normal,
                    color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Custom_TextField(
                    controller: medicinenamecontroller,
                    hintText: 'enter medicine name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "type medicine name";
                      }
                      return null;
                    },
                  )
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(left: 15,top: 10),
                child: CustomText(
                    text: 'Price',
                    size: 18,
                    weight: FontWeight.normal,
                    color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Custom_TextField(
                    controller: pricecontroller,
                    hintText: 'enter the price',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "type the price!";
                      }
                      return null;
                    },
                  )
                ),
              ),
              //  Padding(
              //   padding: const EdgeInsets.only(left: 15,top: 10),
              //   child: CustomText(
              //       text: 'Offer',
              //       size: 18,
              //       weight: FontWeight.normal,
              //       color: Colors.black),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 15,top: 10),
              //   child: SizedBox(
              //     width: MediaQuery.of(context).size.width * 0.9,
              //     child: TextFormField(
              //       decoration: InputDecoration(
              //           border: OutlineInputBorder(
              //             borderSide: BorderSide(width: 2, color: kgreyColor),
              //             borderRadius: BorderRadius.circular(15),
              //           ),
              //           filled: true,
              //           fillColor: kcontentColor,
              //           hintText: 'enter the offer',
              //           helperStyle: TextStyle(color: kgreyColor)),
              //     ),
              //   ),
              // ),
               Padding(
                padding: const EdgeInsets.only(left: 15,top: 10),
                child: CustomText(
                    text: 'Description',
                    size: 18,
                    weight: FontWeight.normal,
                    color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Custom_TextField(
                    maxLines: 5,
                    controller: descriptioncontroller,
                    hintText: 'type description',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "type the descrption";
                      }
                      return null;
                    },
                  )
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(left: 15,top: 10),
                child: CustomText(
                    text: 'FAQ',
                    size: 18,
                    weight: FontWeight.normal,
                    color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child:Custom_TextField(
                    controller: faqcontroller,
                    maxLines: 5,
                    hintText: 'enter the FAQ',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "type the FAQ!";
                      }
                      return null;
                    },
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.070,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF009688)
                      ),
                      onPressed: () {
                        savedata();
                        saveImage();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineDetails(),));
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
