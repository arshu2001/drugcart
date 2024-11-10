import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/admin/deliverlistprofile.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeliverList extends StatefulWidget {
  const DeliverList({super.key});

  @override
  State<DeliverList> createState() => _DeliverListState();
}

class _DeliverListState extends State<DeliverList> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _deleteDeliveryboy(String deliveryId) async{
    try {
      await FirebaseFirestore.instance.collection('approvedDeliveryBoy').doc(deliveryId).delete();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Medical Shop deleted successfully'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error deleting Medical Shop: $e'),
          backgroundColor: Colors.red,
        ),
      );

    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder(
        stream: _firestore.collection('approvedDeliveryBoy').snapshots(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
            return Center(child: Text('No users found'));
          }
          return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var userData = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                    var deliveryId = snapshot.data!.docs[index].id;
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ListTile(
                        tileColor: kcontentColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(userData['profileImage'] ?? 'no image'),
                          radius: 25,
                        ),
                        title: CustomText(
                          text: userData['name'] ?? 'Unknown User',
                          size: 16,
                          weight: FontWeight.w500,
                        ),
                        subtitle: CustomText(
                          text: userData['email'] ?? 'No email',
                          size: 14,
                          color: Colors.grey,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(onPressed: () {
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
                                   child: Text('Cancel',)),
                                  TextButton(
                                    onPressed: () {
                                    _deleteDeliveryboy(deliveryId);
                                    Navigator.pop(context);
                                  }, child: Text('Delete',
                                  style: TextStyle(color: Colors.red),
                                  )) 
                                ],
                               ),
                               );
                            }, icon: Icon(Icons.delete,color: Colors.red[300],)),
                            IconButton(onPressed: () {
                               Navigator.push(
                                 context,
                                MaterialPageRoute(
                                   builder: (context) => DeliveryListProfile(userId: deliveryId),
                                 ),
                               );
                            }, icon: Icon(Icons.visibility,color: Colors.black,)),
                          ],
                        ),
                        // onTap: () {
                        //  
                        // },
                      ),
                    );
                  },
                );
        }
      ),
    );
  }
}