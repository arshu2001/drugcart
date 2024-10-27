import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
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
      body: 

          StreamBuilder(
            stream: _firestore.collection('Orders').orderBy('orderDate', descending: true).snapshots(),
            builder: (context, snapshot) {
              if(snapshot.hasError){
                return Center(child: Text('Something went wrong'));
              }

              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }

              if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
                return Center(child: Text('No orders found'));
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  
                  var order = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  var items = List<Map<String, dynamic>>.from(order['items'] ?? []);
                  
              
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
                            text: 'Ordered by: ${order['userName']}',
                            size: 18,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(height: 8),
                          CustomText(
                            text: 'Address: ${order['userAddress']}',
                            size: 14,
                          ),
                          CustomText(
                            text: 'Phone: ${order['userPhone']}',
                            size: 14,
                          ),
                          CustomText(
                            text: 'Total Amount: ₹${order['totalAmount']}',
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
                                  await _firestore
                                    .collection('Orders')
                                    .doc(snapshot.data!.docs[index].id)
                                    .update({'status': 'accepted'});
                                },
                                child: CustomText(
                                  text: 'Accept',
                                  size: 16,
                                  weight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                ),
                                onPressed: () async {
                                  await _firestore
                                    .collection('Orders')
                                    .doc(snapshot.data!.docs[index].id)
                                    .update({'status': 'rejected'});
                                },
                                child: CustomText(
                                  text: 'Reject',
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
            }
          )
     
      );
  }
  String _formatDate(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
  }
}