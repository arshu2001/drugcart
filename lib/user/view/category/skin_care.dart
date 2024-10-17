import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SkinCare extends StatefulWidget {
  const SkinCare({super.key});

  @override
  State<SkinCare> createState() => _SkinCareState();
}

class _SkinCareState extends State<SkinCare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  StreamBuilder(
        stream: FirebaseFirestore.instance.collection("addMedicine")
        .where("category", isEqualTo: "Skin Care").snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(snapshot.hasError){
            return Text('error : ${snapshot.error}');
          }
          if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
            return Center(
              child: CustomText(text: 'No Item Available!', size: 20),
            );
          }
          return GridView.builder(
                    itemCount: snapshot.data!.docs.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 200
                      ),
                      
                   itemBuilder: (context,index){
                    var data = snapshot.data!.docs[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineDetails(),));
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        elevation: 5,
                        child: Column(
                          children: [
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if(data["imageurls"] != null && data["imageurls"].length > 0)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    data["imageurls"][0],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: CustomText(text: data["medicinename"], size: 16, weight: FontWeight.normal, color: Colors.black),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: CustomText(text: "₹${data["medicineprice"]}", size: 14, weight: FontWeight.normal, color: Color.fromARGB(170, 95, 95, 81)),
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
                   });
        }
      )
    );
  }
}