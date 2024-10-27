// ignore_for_file: sort_child_properties_last

import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/medical_shop/model/medicineadd_modal.dart';
import 'package:drugcart/medical_shop/view/product_details.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/custom_textfield.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' ;


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
  final TextEditingController answercontroller = TextEditingController();


  final formkey = GlobalKey<FormState>();
  

  // List<XFile>? pickedImages;
  // List<File> imageFile = [];
  List<File> _images = [];
  List<String> imageurls = [];

  // Future<void> addImage()async{
  //   try {
  //     ImagePicker picked = ImagePicker();
  //     pickedImages = await picked.pickMultiImage();
  //     if(pickedImages != null){
  //       setState(() {
  //         imageFile = pickedImages!.map((image) => File(image.path)).toList();
  //       });
  //     }
  //   } catch (e) {
  //    print("error: $e") ;
  //   }
  // }
  Future<void> _pickImage() async{
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  Future<List<String>> _uploadImages() async{
    List<String> imageUrls = [];
    for (var image in _images) {
      String fileName = DateTime.now().microsecondsSinceEpoch.toString();
      Reference ref = FirebaseStorage.instance.ref().child('medicine_images/$fileName');
      await ref.putFile(image);
      String downloadUrl = await ref.getDownloadURL();
      imageUrls.add(downloadUrl);
    }
    return imageUrls;
  }

  Widget _buildMediaItem(File image) {
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

  Future<void> _saveMedicine() async{
    if(formkey.currentState!.validate()){
      try {
        showDialog(
          context: context,
          barrierDismissible: false,
           builder: (BuildContext context) {
              return Center(child: CircularProgressIndicator(),);
           },
           );
             final user = FirebaseAuth.instance.currentUser;
          if(user == null) {
            throw 'User not authenticated';
          }
          String userId = user.uid;


          List<String> imageUrls = await _uploadImages();

          Medicine newMedicine = Medicine(
            medicinename: medicinenamecontroller.text, 
            medicineprice: pricecontroller.text, 
            description: descriptioncontroller.text, 
            faq: faqcontroller.text, 
            answer: answercontroller.text,
            category: selectedCategory ?? '', 
            imageurls: imageUrls
            );

            DocumentReference mainDocRef = await FirebaseFirestore.instance
            .collection('Medicineadd')
            .add(newMedicine.toMap());
            await mainDocRef.update({'id': mainDocRef.id});

            DocumentReference docref= await FirebaseFirestore.instance
            .collection('Medicineadd')
            .doc(userId)
            .collection('medicineadd_list')
            .add(newMedicine.toMap());

             // Update the Firestore document to include the id field
             await docref.update({'id': docref.id});
             Navigator.pop(context);
             ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Medicine added successfully!')),
        );
      } catch (e) {
        Navigator.of(context).pop();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error adding Medicine: $e')),
        );
      }
    }
  }

  // Future<void> savedata()async{
  //   try {
  //     await FirebaseFirestore.instance.collection("addMedicine").add({
  //       "medicinename" : medicinenamecontroller.text,
  //       "medicineprice" : pricecontroller.text,
  //       "description" : descriptioncontroller.text,
  //       "FAQ" : faqcontroller.text,
  //       "category" : selectedCategory,
  //       "imageurls" : imageurls
  //     });
  //   } catch (e) {
  //     print("error : $e");
  //   }
  // }

//   Future<void> saveImage() async {
//   try {
//     // Only proceed if there are new images to upload
//     if (imageFile.isNotEmpty) {
//       for (var image in imageFile) {
//         // Check if the image has already been uploaded by comparing the list of URLs
//         if (!imageurls.contains(image)) {
//           final ref = firebase_storage.FirebaseStorage.instance
//               .ref()
//               .child("medicineImages")
//               .child("${DateTime.now().microsecondsSinceEpoch.toString()}");

//           await ref.putFile(image);
//           var imageUrl = await ref.getDownloadURL();

//           setState(() {
//             imageurls.add(imageUrl);  // Add new image URL to the list
//           });

//           print("Uploaded image: $imageUrl");
//         } else {
//           print("Image already uploaded, skipping upload.");
//         }
//       }
//     } else {
//       print("No new images to upload.");
//     }
//   } catch (e) {
//     print("Error during image upload: $e");
//   }
// }



  // Future<void> saveImage() async{
  //   try {
  //     for(var image in imageFile){
  //       final ref = firebase_storage.FirebaseStorage.instance
  //       .ref()
  //       .child("medicineImages")
  //       .child("${DateTime.now().microsecondsSinceEpoch.toString()}");

  //       await ref.putFile(image);
  //       var imageUrl = await ref.getDownloadURL();

  //       setState(() {
  //         imageurls.add(imageUrl);
  //       });
  //       print(imageUrl);
  //     }
  //   } catch (e) {
  //     print("error:$e");
  //   }
  // }
  String? selectedCategory;
  final List<String> category = ["Pain Relief", "Skin Care", "Ayurvedic Care"];
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
                      _pickImage();
                    } ,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.height * 0.44,
                      color: Color(0xFF00796B),
                      child: _images.isEmpty ?
                      const Icon(Icons.add_photo_alternate_outlined,
                      size: 100,
                      color: Colors.white,
                      ) : CarouselSlider(
                        items: [
                          ..._images.map((image) => _buildMediaItem(image)).toList(),
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
               Padding(
                padding: const EdgeInsets.only(left: 15,top: 10),
                child: CustomText(
                    text: 'Category',
                    size: 18,
                    weight: FontWeight.normal,
                    color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: DropdownButtonFormField(
                    validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please select a category!";
                        }
                        return null;
                      },
                    items: category.map((String category){
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                        );
                    }).toList(),
                     onChanged: (String? newvalue) {
                      setState(() {
                        selectedCategory = newvalue;
                        print('selected category: $selectedCategory');
                      });
                     },
                     decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Category'
                     ),
                     )
                ),
              ),
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
                    
                    hintText: 'enter the FAQ',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "type the FAQ!";
                      }
                      return null;
                    },
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                      
                    ),
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 10),
                child: CustomText(
                    text: 'Answer',
                    size: 18,
                    weight: FontWeight.normal,
                    color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child:Custom_TextField(
                    controller: answercontroller,
                    maxLines: 5,
                    hintText: 'enter the answer',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "type the answer!";
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
                      onPressed: () async{
                      
                         if (imageurls.isEmpty && _images.isNotEmpty) {
                         
                         await _uploadImages();  
                          await _saveMedicine();
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
