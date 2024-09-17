import 'package:drugcart/medical_shop/medicineadd.dart';
import 'package:drugcart/model/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MedicalHome extends StatefulWidget {
  const MedicalHome({super.key});

  @override
  State<MedicalHome> createState() => _MedicalHomeState();
}

class _MedicalHomeState extends State<MedicalHome> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 199, 128, 128),
        leading: IconButton(
          onPressed: () {
            // Handle the leading icon button action
          },
          icon: Icon(Icons.view_headline_outlined),
        ),
        title: CustomText(text: 'Home', size: 24, weight: FontWeight.bold, color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {
              // Handle the notifications icon button action
            },
            icon: Icon(Icons.notifications),
          ),
          // Add more action buttons if needed
        ],
        ),
        body: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            mainAxisExtent: 280
            ),
            
         itemBuilder: (context,index){
          return Material(
            borderRadius: BorderRadius.circular(20),
            elevation: 5,
            child: Column(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('images/zincovit.png'),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: CustomText(text: 'Zincovit Stripof Tablet(Green)', size: 16, weight: FontWeight.normal, color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: CustomText(text: 'MRP ₹110.00', size: 14, weight: FontWeight.normal, color: Color.fromARGB(170, 95, 95, 81)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          CustomText(text: '₹101.20', size: 14, weight: FontWeight.normal, color: Colors.black),
                          CustomText(text: '(8%)', size: 14, weight: FontWeight.normal, color: Colors.red)
                        ],
                      ),
                    )
                  ],
                ),


              ],
            ),
          );
         }),
         floatingActionButton: SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.2,
           child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40)
            ),
            backgroundColor: Color.fromARGB(255, 199, 128, 128),
            onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineAdd(),));
           },
           child: Icon(Icons.add,size: 50,color: Colors.white,),
           ),
         ),
      ),
    );
  }
}