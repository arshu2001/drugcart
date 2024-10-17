import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Prescription extends StatefulWidget {
  // final String? imageUrl;
  // const Prescription({Key? key, this.imageUrl}): super(key: key);
  const Prescription({Key? key}): super (key: key);

  @override
  State<Prescription> createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  final Stream<QuerySnapshot> _prescriptionStream = FirebaseFirestore.instance
  .collection('prescription').snapshots();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'Prescription', size: 20,weight: FontWeight.bold,),centerTitle: true,
      ),
      body: Column(
        children: [
         StreamBuilder(
          stream: _prescriptionStream,
           builder: (context, snapShot) {
            if(snapShot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }else if(snapShot.hasError){
              return Center(child: Text('error: ${snapShot.error}'),);
         
            }
         
            final List<DocumentSnapshot> prescriptions = snapShot.data?.docs ?? [];
         
            if(prescriptions.isEmpty){
              return Center(child: Text('No prescription available'),);
            }
             return ListView.builder(
                itemCount: prescriptions.length,
                itemBuilder: (context, index) {
                  // final cartItems = finalList[index];
                  // Safely extract the data from the document
                  final Map<String, dynamic>? prescriptionData = prescriptions[index].data() as Map<String,dynamic>?;
         
                  if(prescriptionData == null || prescriptionData['imageUrl'] == null){
                    return const ListTile(
                      title: Text('Missing data'),
                    );
                  }
                return Stack(
                  children: [
                    Padding(padding: EdgeInsets.all(10),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                      ),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.29,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: kcontentColor
                            ),
                            child: Image.network(
                              prescriptionData['imageUrl'],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.broken_image,
                                  size: 50,
                                  color: Colors.red,
                                );
                              },
                              loadingBuilder: (context, child, loadingProgress) {
                                if(loadingProgress == null) return child;
                                return Center(child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /(loadingProgress.expectedTotalBytes ?? 1)
                                  :null,
                                ),
                                );
                              },
                              ),
                          ),
                          SizedBox(width: 10,),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: 'Zincovit Stripof Tablet(Green)', size: 15,weight: FontWeight.w600,),
                                SizedBox(height: 17.spMin,),
                                Wrap(
                                  spacing: 10,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        maximumSize: Size(100, 50)
                                      ),
                                      onPressed: () {
                                      
                                    }, child: CustomText(text: 'Take Order', size: 9,weight: FontWeight.w600,color: Colors.white,)),
                               Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        maximumSize: Size(100, 50)
                                      ),
                                      onPressed: () {
                                      
                                    }, child: CustomText(text: 'Ignor', size: 18,weight: FontWeight.w600,color: Colors.white,)),
                                    ) 
                                  ],
                                )
                              ],
                            ),
                          )
             
                        ],
                      ),
                    ),
                    ),
                  ],
                );
              },);
           }
         )
        ],
      ),
    );
  }
}