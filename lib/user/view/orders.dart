import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/user/model/order_modal.dart';
import 'package:drugcart/user/view/order_details.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserOrders extends StatefulWidget {
  const UserOrders({super.key});

  @override
  State<UserOrders> createState() => _UserOrdersState();
}

class _UserOrdersState extends State<UserOrders> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String userid=FirebaseAuth.instance.currentUser!.uid;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'Orders', size: 18, weight: FontWeight.bold),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: 'All Orders', size: 18, weight: FontWeight.w600),
              SizedBox(height: 16),
              StreamBuilder(
                stream: _firestore.collection('Orders')
                .doc(userid).collection('orderlist')
                    .orderBy('orderDate', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(child: Text('No orders found'));
                  }
                  
                  return ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    separatorBuilder: (context, index) => const Divider(height: 24),
                    itemBuilder: (context, index) {
                      var orderDoc = snapshot.data!.docs[index];
                      var order = orderDoc.data() as Map<String, dynamic>;
                      var items = List<Map<String, dynamic>>.from(order['items'] ?? []);
                      var orderDate = (order['orderDate'] as Timestamp).toDate();
                      
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Order header
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // CustomText(
                                      //   text: 'Order #${orderDoc.id.substring(0, 8)}',
                                      //   size: 16,
                                      //   weight: FontWeight.w600,
                                      // ),
                                      SizedBox(height: 4),
                                      CustomText(
                                        text: orderDate.toString().substring(0, 16),
                                        size: 14,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  // Container(
                                  //   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  //   decoration: BoxDecoration(
                                  //     color: order['status'] == 'pending' 
                                  //         ? Colors.orange.shade100 
                                  //         : Colors.green.shade100,
                                  //     borderRadius: BorderRadius.circular(16),
                                  //   ),
                                  //   child: CustomText(
                                  //     text: order['status']?.toUpperCase() ?? 'PENDING',
                                  //     size: 12,
                                  //     color: order['status'] == 'pending' 
                                  //         ? Colors.orange.shade900 
                                  //         : Colors.green.shade900,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            
                            // Order items
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: items.length,
                              itemBuilder: (context, itemIndex) {
                                var item = items[itemIndex];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          image: DecorationImage(
                                            image: NetworkImage(item['imageUrl'] ?? ''),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: item['medicineName'] ?? '',
                                              size: 16,
                                              weight: FontWeight.w500,
                                            ),
                                            SizedBox(height: 4),
                                            CustomText(
                                              text: '₹${item['medicinePrice']}',
                                              size: 14,
                                              color: Colors.grey.shade700,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            
                            // Order footer
                            // Padding(
                            //   padding: const EdgeInsets.all(12),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       CustomText(
                            //         text: 'Total Amount:',
                            //         size: 16,
                            //         weight: FontWeight.w600,
                            //       ),
                            //       CustomText(
                            //         text: '₹${totalAmount.toStringAsFixed(2)}',
                            //         size: 16,
                            //         weight: FontWeight.w600,
                            //         color: Theme.of(context).primaryColor,
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            
                            // View Details Button
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UserOrderDetails(
                                      orderId: orderDoc.id,
                                      
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                ),
                                child: Center(
                                  child: CustomText(
                                    text: 'View Details',
                                    size: 14,
                                    weight: FontWeight.w600,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}