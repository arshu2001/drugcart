// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/medical_shop/model/medicineadd_modal.dart';
import 'package:drugcart/medical_shop/view/prescription.dart';
import 'package:drugcart/user/view/home/gridview.dart';
import 'package:drugcart/user/view/home/imageslider.dart';
import 'package:drugcart/user/view/product/product_details.dart';
import 'package:drugcart/user/view/user_header.dart';
import 'package:drugcart/user/view/legal_information.dart';
import 'package:drugcart/user/view/notification.dart';
import 'package:drugcart/user/view/orders.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/cushomeappbar.dart';
import 'package:drugcart/user/model/widget/cussearchbar.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String? _userId = FirebaseAuth.instance.currentUser?.uid;
  late Stream<DocumentSnapshot> _favoriteStream;
  late Stream<QuerySnapshot> _medicineStream;
  File ? selectedImage;
  int currentSlider = 0;

  @override
  void initState(){
    super.initState();
    _medicineStream = _firestore.collection('Medicineadd').snapshots();
    _favoriteStream = _firestore.collection('userFavorites').doc(_userId).snapshots();
  }

  Future<void> _toggleFavorite(String medicineId, bool currentStatus)async{
    if(_userId == null) return;
    await _firestore.collection('userFavorites').doc(_userId).set({
      medicineId: !currentStatus,
    },SetOptions(merge: true));
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: kpalecolor,
        // for custom appbar
        appBar: AppBar(
          backgroundColor: kpinkcolor,

      title: CustomText(text: 'Home', size: 24, weight: FontWeight.bold, color: Colors.black),
      actions: [
        IconButton(onPressed: () {
          pickImageFromGallery();
        }, icon: Icon(Icons.camera_alt_rounded)),
        IconButton(
          onPressed: () {
            // Handle the notifications icon button action
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserNotification(),));
          },
          icon: Icon(Icons.notifications),
        ),
        // Add more action buttons if needed
      ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // searchbar
                Cus_Searchbar(),
                SizedBox(height: 20,),
                // imageSlider
                ImageSlider(currentSlide: currentSlider, onChange: (value){
                  setState(() {
                    currentSlider = value;
                  });
                },),
                SizedBox(height: 20,),
                // for shopping items
                StreamBuilder(
                  stream: _medicineStream,
                  builder: (context, medicineSnapshot) {
                    if(medicineSnapshot.connectionState == ConnectionState.waiting){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    else if(medicineSnapshot.hasError){
                      return Text('error: ${medicineSnapshot.error}');
                    }
                    if(!medicineSnapshot.hasData || medicineSnapshot.data!.docs.isEmpty){
                      return Center(
                        child: CustomText(text: 'No items Available', size: 20),
                      );
                    }
                    return StreamBuilder(
                      stream: _favoriteStream,
                      builder: (context, favoriteSnapshot) {
                        Map<String, dynamic> favorites = 
                        favoriteSnapshot.data?.data() as Map<String, dynamic>? ?? {};

                        return GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            // childAspectRatio: 0.80,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            mainAxisExtent: 200,
                            ),
                            itemCount: medicineSnapshot.data!.docs.length,
                             itemBuilder: (context, index) {
                              //  var data = snapshot.data!.docs[index];
                              var medicineDoc = medicineSnapshot.data!.docs[index];
                              var medicine = Medicine.fromMap(medicineDoc.data() as Map<String, dynamic>);
                               
                               bool isFavorites = favorites[medicineDoc.id] == true;
                               
                                        return GestureDetector(
                                          onTap: () {
                                             Navigator.push(context, MaterialPageRoute(builder: (context) => User_ProductDetails(medicine: medicine),));
                                          },
                                          child: Material(
                        borderRadius: BorderRadius.circular(20),
                        elevation: 5,
                        child: Column(
                          children: [
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if(medicine.imageurls.isNotEmpty)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    medicine.imageurls[0],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(text: medicine.medicinename, size: 16, weight: FontWeight.normal, color: Colors.black),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 2),
                                        child: IconButton(
                                           icon: Icon(
                                            isFavorites
                                             ? Icons.favorite
                                             :Icons.favorite_border,
                                             color: isFavorites ? Colors.red : Colors.black,
                                             ),
                                          onPressed: () => _toggleFavorite(medicineDoc.id, isFavorites),),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: CustomText(text: "₹${medicine.medicineprice}", size: 14, weight: FontWeight.normal, color: Color.fromARGB(170, 95, 95, 81)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      CustomText(text: '₹101.20', size: 14, weight: FontWeight.normal, color: Colors.black),
                                      CustomText(text: '(8%)', size: 14, weight: FontWeight.normal, color: Colors.red)
                                    ],
                                  ),
                                ),
                              
                              ],
                            ),
                                  
                                  
                          ],
                        ),
                                          ),
                                        );
                                       
                             },);
                      }
                    );
                  }
                )
              ],
            ),
          ),
          
        ),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  UserHeader(),
                  UserDrawerList()
                ],
              ),
            ),
          ),
         ),
      )
      );
  }
  //   Future pickImageFromCamera() async{
  //   final ImagePicker _picker = ImagePicker();
  //   // final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);
  //   final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
  //   if(photo != null){
  //   setState(() {
  //     selectedImage = File(photo.path);
  //   });
  //   // Upload the image after capturing
  //   // await uploadImagetoFirebase(selectedImage!);
  //   String? imageUrl = await uploadImagetoFirebase(selectedImage!);

  //   if(imageUrl != null){
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => Prescription(imageUrl : imageUrl),));
  //   }
  //   }else{
  //     print('No image selected');
  //   }
  // }

  Future<void> pickImageFromGallery() async {
  final ImagePicker _picker = ImagePicker();
  final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);

  if (photo != null) {
    setState(() {
      selectedImage = File(photo.path);
    });

    try {
      // Upload the image and get the download URL
      String imageUrl = await uploadImagetoFirebase(selectedImage!);

      String? userId = FirebaseAuth.instance.currentUser?.uid;
      if(userId != null){
        DocumentSnapshot userDoc = await _firestore.collection("Users")
        .doc(userId).get();
        String userName = userDoc["name"];


        await FirebaseFirestore.instance
      .collection('prescription').add({
        'imageUrl': imageUrl,
        'userName': userName,
        'uploadedAt': Timestamp.now(),
        'userId': FirebaseAuth.instance.currentUser!.uid
      });
      }

      
      print('Image uploaded and added to Firestore');
      // Navigate to the Prescription page and pass the image URL
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => Prescription(imageUrl: imageUrl),
      //   ),
      // );
    } catch (e) {
      print('Error uploading image: $e');
      // Handle the error (show a message to the user, etc.)
    }
  } else {
    print('No image selected');
  }
}

  
  Future<String> uploadImagetoFirebase(File imageFile)async{
    try {
      // Create a unique filename
      String fileName = p.basename(imageFile.path);
      fileName = '${DateTime.now().microsecondsSinceEpoch}_$fileName';

       // Create a reference to the location you want to upload to in Firebase Storage
       Reference ref = FirebaseStorage.instance.ref()
       .child('gallery_images/$fileName');
      
       // Start the upload task
       UploadTask uploadTask = ref.putFile(imageFile);

       // Show upload progress (optional)
      //  uploadTask.snapshotEvents.listen((TaskSnapshot snapshot){
      //   print('Progress: ${(snapshot.bytesTransferred / snapshot.totalBytes) * 100} %');
      //  });

       // Wait for the upload to complete
       TaskSnapshot taskSnapshot = await uploadTask;

       // Get the download URL
       String downloadUrl = await taskSnapshot.ref.getDownloadURL();

       print("image uploaded successfully. Download URL: $downloadUrl");
       return downloadUrl;
    } catch (e) {
      print("Error uploading image: $e");
      // Throw an exception or return a default value
    throw Exception("Image upload failed");
    }
  }

  Widget UserDrawerList(){
    return Column(
      children: [
        ListTile(
           leading: Icon(Icons.assignment),
                    title: const Text('Orders'),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UserOrders(),));
                    },
        ),
         ListTile(
           leading: Icon(Icons.info_outlined),
                    title: const Text('Legal Information'),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LegalInformation(),));
                    },
        ),
         ListTile(
           leading: Icon(Icons.logout_rounded),
                    title: const Text('LogOut'),
                    onTap: (){
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          title: CustomText(text: 'LogOut', size: 20,weight: FontWeight.w600,color: Colors.black,),
                          content: CustomText(text: 'Are you sure your you want to logout?', size: 16, weight: FontWeight.normal, color: Colors.black),
                actions: [
                  TextButton(onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalLogin(),));
                  }, child: CustomText(text: 'yes', size: 16, weight: FontWeight.w400, color: Colors.black)),
                  TextButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: CustomText(text: 'no', size: 16, weight: FontWeight.w400, color: Colors.black))
                ]
                        );
                      },);
                    },
        ),

        

      ],
    );
    
  }
}