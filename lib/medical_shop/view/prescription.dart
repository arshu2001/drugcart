
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Prescription extends StatefulWidget {
  const Prescription({Key? key}) : super(key: key);

  @override
  State<Prescription> createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  final Stream<QuerySnapshot> _prescriptionStream = FirebaseFirestore.instance
      .collection('prescription')
      .orderBy('uploadedAt', descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Prescriptions',
          size: 20,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _prescriptionStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final List<DocumentSnapshot> prescriptions = snapshot.data?.docs ?? [];

          if (prescriptions.isEmpty) {
            return Center(child: Text('No prescriptions available'));
          }

          return ListView.builder(
            itemCount: prescriptions.length,
            itemBuilder: (context, index) {
              final Map<String, dynamic>? prescriptionData =
                  prescriptions[index].data() as Map<String, dynamic>?;

              if (prescriptionData == null ||
                  prescriptionData['imageUrl'] == null ||
                  prescriptionData['userName'] == null) {
                return ListTile(title: Text('Missing data'));
              }

              return Card(
                margin: EdgeInsets.all(10),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.network(
                        prescriptionData['imageUrl'],
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 200,
                            color: Colors.grey[300],
                            child: Icon(Icons.broken_image, size: 50, color: Colors.red),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Uploaded by: ${prescriptionData['userName']}',
                            size: 18,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(height: 8),
                          CustomText(
                            text: 'Uploaded at: ${_formatDate(prescriptionData['uploadedAt'])}',
                            size: 14,
                            weight: FontWeight.normal,
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [


ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  //  Colors.green,
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                ),
                                onPressed: () {
                                  // Implement take order functionality
                                },
                                child: CustomText(
                                  text: 'Take Order',
                                  size: 16,
                                  weight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // primary: Colors.red,
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                ),
                                onPressed: () {
                                  // Implement ignore functionality
                                },
                                child: CustomText(
                                  text: 'Ignore',
                                  size: 16,
                                  weight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  String _formatDate(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
  }
}