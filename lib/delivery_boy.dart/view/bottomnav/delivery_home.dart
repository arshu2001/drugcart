import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/material.dart';

class DeliveryHome extends StatefulWidget {
  const DeliveryHome({super.key});

  @override
  State<DeliveryHome> createState() => _DeliveryHomeState();
}

class _DeliveryHomeState extends State<DeliveryHome> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(text: 'Delivery Items', size: 20,weight: FontWeight.bold,),centerTitle: true,
        ),
        body: Column(
          children: [
            StreamBuilder(
              stream: _firestore.collection('AcceptedOrders').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Something went wrong'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No accepted orders found'));
                }
      
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var acceptedOrder = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                      var items = List<Map<String, dynamic>>.from(acceptedOrder['items'] ?? []);
      
                      return Card(
                        margin: EdgeInsets.all(10),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: items.length,
                              itemBuilder: (context, itemIndex) {
                                var item = items[itemIndex];
                                return ListTile(
                                  leading: Image.network(
                                    item['imageUrl'] ?? '',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: 50,
                                        height: 50,
                                        color: Colors.grey[300],
                                        child: Icon(Icons.broken_image, size: 25),
                                      );
                                    },
                                  ),
                                  title: Text(item['medicineName'] ?? ''),
                                  subtitle: Text('₹${item['medicinePrice']}'),
                                );
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: 'Ordered by: ${acceptedOrder['userName']}',
                                    size: 18,
                                    weight: FontWeight.bold,
                                  ),
                                  SizedBox(height: 8),
                                  CustomText(
                                    text: 'Address: ${acceptedOrder['userAddress']}',
                                    size: 14,
                                  ),
                                  CustomText(
                                    text: 'Phone: ${acceptedOrder['userPhone']}',
                                    size: 14,
                                  ),
                                  CustomText(
                                    text: 'Total Amount: ₹${acceptedOrder['totalAmount']}',
                                    size: 16,
                                    weight: FontWeight.bold,
                                  ),
                                  SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                        ),
                                        onPressed: () async {
                                          // Handle order placed action here
                                        },
                                        child: CustomText(
                                          text: 'Take Order',
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
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
