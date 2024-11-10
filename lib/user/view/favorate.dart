import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/medical_shop/model/medicineadd_modal.dart';
import 'package:drugcart/provider/favorate_provider.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:drugcart/user/view/product/product_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class favoritee extends StatefulWidget {
  const favoritee({super.key});

  @override
  State<favoritee> createState() => _favoriteeState();
}

class _favoriteeState extends State<favoritee> {
  
  @override
  Widget build(BuildContext context) {
    final String? userId = FirebaseAuth.instance.currentUser?.uid;
    // final Provider = FavoriteProvider.of(context);
    // final finalList = Provider.favorite;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final colorscheme=Theme.of(context).colorScheme;
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: CustomText(text: 'Favorite', size: 20,weight: FontWeight.bold,),centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(child:userId == null ?
            Center(child: Text('Please log to view saved medicine'),)
            : StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
              .collection('userFavorites')
              .doc(userId)
              .snapshots(),
              builder: (context, favoritesSnapshot) {
                if(favoritesSnapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }

                if(favoritesSnapshot.hasError){
                  return Center(child: Text('Error: ${favoritesSnapshot.error}'),);
                }

                Map<String, dynamic> favorites = favoritesSnapshot.data?.data() as Map<String, dynamic>? ?? {};
                List<String> favoritemedicineIds = favorites.keys.where((key) => favorites[key] == true).toList();

                if(favoritemedicineIds.isEmpty){
                  return Center(child: CustomText(text: 'No saved Medicine yet', size: 20,color: Colors.black,),);
                }
                return StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Medicineadd')
                  .where(FieldPath.documentId, whereIn: favoritemedicineIds)
                  .snapshots(),
                  builder: (context, medicineSnapshot) {
                    if(medicineSnapshot.connectionState == ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator(),);
                    }

                    if(medicineSnapshot.hasError){
                      return Center(child: Text('Error: ${medicineSnapshot.error}'),);
                    }

                    List<Medicine> savedMedicine = medicineSnapshot.data!.docs
                    .map((doc) => Medicine.fromMap(doc.data() as Map<String, dynamic>))
                    .toList();
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
                            itemCount: savedMedicine.length,
                             itemBuilder: (context, index) {
                               Medicine medicine = savedMedicine[index];
                          
                                        return GestureDetector(
                                          onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => User_ProductDetails(),));
                                          },
                                          child: Material(
                                            color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(20),
                        elevation: 5,
                        child: Column(
                          children: [
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               // Display the image if available 
                                if(medicine.imageurls.isNotEmpty)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    medicine.imageurls[0],
                                    height: 120,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                // Medicine Name
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: CustomText(text: medicine.medicinename, size: 16, weight: FontWeight.normal, color: colorscheme.primary,
                                  maxLine: 1,textOverflow: TextOverflow.ellipsis,),
                                ),
                                // Medicine Price
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
            ))
          ],
        ),
      ),
    );
  }
}