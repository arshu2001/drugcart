
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserOrderDetails extends StatefulWidget {
  final String orderId;
  const UserOrderDetails({super.key, required this.orderId});

  @override
  State<UserOrderDetails> createState() => _UserOrderDetailsState();
}

class _UserOrderDetailsState extends State<UserOrderDetails> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Map<String, dynamic>? orderData;
  bool isLoading = true;
  List<Map<String, dynamic>> orderItems = [];
  
  @override
  void initState() {
    super.initState();
    fetchOrderDetails();
  }

  Future<void> fetchOrderDetails() async {
    try {
      final userId = _auth.currentUser!.uid;
      final doc = await _firestore
          .collection('Orders')
          .doc(userId)
          .collection('orderlist')
          .doc(widget.orderId)
          .get();

      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        setState(() {
          orderData = data;
          orderItems = List<Map<String, dynamic>>.from(data['items'] ?? []);
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching order details: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  int getCurrentStep(String status) {
    switch (status.toLowerCase()) {
      case 'order packing':
        return 1;
      case 'out for delivery':
        return 2;
      case 'delivered':
        return 3;
      case 'processing':
        return 1;
      case 'completed':
        return 3;
      case 'rejected':
        return 0;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: CustomText(text: 'Order Details', size: 18, weight: FontWeight.bold),
          centerTitle: true,
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (orderData == null) {
      return Scaffold(
        appBar: AppBar(
          title: CustomText(text: 'Order Details', size: 18, weight: FontWeight.bold),
          centerTitle: true,
        ),
        body: const Center(child: Text('Order not found')),
      );
    }


final currentStep = getCurrentStep(orderData!['status'] ?? 'pending');
    final orderDate = (orderData!['orderDate'] as Timestamp).toDate();
    final formattedDate = DateFormat('MMMM d, y').format(orderDate);
    
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'Order Details', size: 18, weight: FontWeight.bold),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              
              // Order Details Card
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 360,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Colors.black)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          _buildInfoRow('Status', orderData!['status']?.toUpperCase() ?? 'PENDING'),
                          const SizedBox(height: 10),
                          _buildInfoRow('Date', formattedDate),
                          const SizedBox(height: 10),
                          _buildInfoRow('Name', orderData!['userName'] ?? 'N/A'),
                          const SizedBox(height: 10),
                          _buildInfoRow('Phone', orderData!['userPhone'] ?? 'N/A'),
                          const SizedBox(height: 10),
                          _buildInfoRow('Address', orderData!['userAddress'] ?? 'N/A'),
                          const SizedBox(height: 10),
                          // _buildInfoRow('Payment', orderData!['paymentMethod'] ?? 'N/A'),
                          const SizedBox(height: 10),
                          _buildInfoRow('Total Amount', '₹${orderData!['totalAmount']}'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              
              // Order Items List
              const SizedBox(height: 20),
              CustomText(
                text: 'Ordered Items',
                size: 18,
                weight: FontWeight.bold,
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: orderItems.length,
                itemBuilder: (context, index) {
                  final item = orderItems[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
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
                            child: const Icon(Icons.broken_image),
                          );
                        },
                      ),
                      title: Text(item['medicineName'] ?? ''),
                      trailing: Text('₹${item['medicinePrice']}'),
                    ),
                  );
                },
              ),
              
              // Order Tracking
              const SizedBox(height: 20),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,


width: MediaQuery.of(context).size.width * 0.89,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kprimaryColor
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildTrackingStep(
                          icon: Icons.check_circle,
                          label: 'Order Confirmed',
                          color: currentStep >= 0 ? Colors.green : Colors.grey,
                        ),
                        _buildTrackingStep(
                          icon: currentStep >= 1 ? Icons.check_circle : Icons.circle,
                          label: 'Order Packing',
                          color: currentStep >= 1 ? Colors.green : Colors.grey,
                        ),
                        _buildTrackingStep(
                          icon: currentStep >= 2 ? Icons.check_circle : Icons.circle,
                          label: 'Out for Delivery',
                          color: currentStep >= 2 ? Colors.green : Colors.grey,
                        ),
                        _buildTrackingStep(
                          icon: currentStep >= 3 ? Icons.check_circle : Icons.circle,
                          label: 'Order Delivered',
                          color: currentStep >= 3 ? Colors.green : Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: CustomText(
              text: label,
              size: 16,
              maxLine: 1,
              color: const Color.fromARGB(179, 19, 10, 10),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: CustomText(
                text: value,
                size: 16,
                color: const Color.fromARGB(255, 5, 3, 3),
                maxLine: 3,
                textOverflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrackingStep({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon, color: color, size: 32),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}