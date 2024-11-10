import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/medical_shop/model/medicineadd_modal.dart';
import 'package:drugcart/medical_shop/view/headdrawer.dart';
import 'package:drugcart/medical_shop/view/legal.dart';
import 'package:drugcart/medical_shop/view/login.dart';
import 'package:drugcart/medical_shop/view/medical_profile.dart';
import 'package:drugcart/medical_shop/view/medicineadd.dart';
import 'package:drugcart/medical_shop/view/notification.dart';
import 'package:drugcart/medical_shop/view/offer.dart';
import 'package:drugcart/medical_shop/view/orders.dart';
import 'package:drugcart/medical_shop/view/prescription.dart';
import 'package:drugcart/medical_shop/view/product_details.dart';
import 'package:drugcart/medical_shop/view/register.dart';
import 'package:drugcart/medical_shop/view/review.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:drugcart/user/view/Category.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicalHome extends StatefulWidget {
  const MedicalHome({super.key});

  @override
  State<MedicalHome> createState() => _MedicalHomeState();
}

class _MedicalHomeState extends State<MedicalHome> {
  late Stream<QuerySnapshot> _medicineStream;

  @override
  void initState(){
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if(user != null) {
      _medicineStream = FirebaseFirestore.instance
      .collection('Medicineadd')
      .doc(user.uid)
      .collection('medicineadd_list')
      .snapshots();
    }
  }

  Future<void> _deleteMedicalshopaccount() async{
    try {
      User? user =FirebaseAuth.instance.currentUser;
      if(user != null) {
        await FirebaseFirestore.instance.collection('approvedMedical').doc(user.uid).delete();
        await user.delete();

        print('Medical shop account deleted successfully');
      }else {
        print('No Medical Shop is currently signed in');
      }
      
    } catch (e) {
      
      print('Error deleting user account: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF00796B),
        // leading: IconButton(
        //   onPressed: () {
        //     // Handle the leading icon button action
        //   },
        //   icon: Icon(Icons.view_headline_outlined),
        // ),
        title: CustomText(text: 'Home', size: 24, weight: FontWeight.bold, color: Color(0xFF212121)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalNotification(),));
            },
            icon: Icon(Icons.notifications,color: Color(0xFF212121),),
          ),
          // Add more action buttons if needed
        ],
        ),
        backgroundColor: Color(0xFFE3F2FD),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder(
            stream: _medicineStream,
            builder: (context,snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }else if (snapshot.hasError){
                return Text('error: ${snapshot.error}');
              }
              if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
                return Center(
                  child: CustomText(text: 'No items Available', size: 20),
                );
              }
              return GridView.builder(
                itemCount: snapshot.data!.docs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  mainAxisExtent: 200
                  ),
                  
               itemBuilder: (context,index){
                var medicineDoc = snapshot.data!.docs[index];
                var medicine = Medicine.fromMap(medicineDoc.data() as Map<String, dynamic>);
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineDetails(medicine: medicine,),));
                  },
                  child: Card(
                    // borderRadius: BorderRadius.circular(20),
                    
                    elevation: 6,
                    margin: EdgeInsets.all(1),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if(medicine.imageurls.isNotEmpty)
                        Container(width: screenHeight,
                          height: screenHeight * 0.15,
                          decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                            medicine.imageurls[0],
                           
                          ),
                             )
                          ),
                          
                          
                         
                         
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CustomText(text: medicine.medicinename, size: 16, weight: FontWeight.normal, color: Colors.black,maxLine: 1,textOverflow: TextOverflow.ellipsis,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CustomText(text: "₹${medicine.medicineprice}", size: 14, weight: FontWeight.normal, color: Color.fromARGB(170, 95, 95, 81)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              CustomText(text: '₹${medicine.medicineprice}', size: 14, weight: FontWeight.normal, color: Colors.black),
                              // CustomText(text: '(8%)', size: 14, weight: FontWeight.normal, color: Colors.red)
                            ],
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                );
               });
            }
          ),
        ),
         floatingActionButton: SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.2,
           child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40)
            ),
            backgroundColor: Color(0xFF009688),
            onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineAdd(),));
           },
           child: Icon(Icons.add,size: 50,color: Colors.white,),
           ),
         ),
         drawer: Drawer(
          
          child: SingleChildScrollView(
            child: Column(
              children: [
                
                const HeadDrawer(),
                DrawerList()
              ],
            ),
          ),
         ),
      ),
    );
  }
  Widget DrawerList(){
    return Column(
      children: [
        ListTile(
           leading: const Icon(Icons.person),
                    title: const Text('Profile'),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalProfile(),));
                    },
        ),
        ListTile(
           leading: const Icon(Icons.camera),
                    title: const Text('User Prescription'),
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Prescription(),));
                    },
        ),
        ListTile(
           leading: const Icon(Icons.assignment),
                    title: const Text('Orders'),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Orders(),));
                    },
        ),
         ListTile(
           leading: const Icon(Icons.info_outlined),
                    title: const Text('Legal Information'),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalLegal(),));
                    },
        ),
         ListTile(
           leading: const Icon(Icons.local_offer_outlined),
                    title: const Text('Offer'),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalOffer(),));
                    },
        ),
         ListTile(
           leading: const Icon(Icons.rate_review_outlined),
                    title: const Text('Review'),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalReview(),));
                    },
        ),
        ListTile(
           leading: const Icon(Icons.person_off),
                    title: const Text('Account Delete'),
                    onTap: (){
                      showDialog(context: context,
                               builder: (context)=> AlertDialog(
                                backgroundColor: Colors.white,
                                title: Text('Delete Medical Shop?',
                                style: TextStyle(color: Colors.black),
                                ),
                                content: Text('This action cannot be undone.',
                                style: TextStyle(color: const Color.fromARGB(255, 63, 62, 62))),
                                actions:[
                                  TextButton(onPressed: ()=> Navigator.pop(context),
                                   child: CustomText(text: 'Cancel', size: 15.sp)
                                   ),
                                  TextButton(
                                    onPressed: () {
                                    _deleteMedicalshopaccount();
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalLogin(),));
                                  }, child: CustomText(text: 'Delete', size: 15.sp,color: Colors.red,)
                                  ) 
                                ],
                               ),
                               );
                    },
        ),
         ListTile(
           leading: const Icon(Icons.logout_rounded),
                    title: const Text('LogOut'),
                    onTap: (){
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          title: CustomText(text: 'LogOut', size: 20,weight: FontWeight.w600,color: Colors.black,),
                          content: CustomText(text: 'Are you sure your you want to logout?', size: 16, weight: FontWeight.normal, color: Colors.black),
                actions: [
                  TextButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalLogin(),));
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