import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/admin/allproduct/all_productview_page.dart';
import 'package:drugcart/medical_shop/model/medicineadd_modal.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllProduct extends StatefulWidget {
  const AllProduct({super.key});

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late Stream<QuerySnapshot> _medicineStream;
  
  @override
  void initState(){
    super.initState();
    _medicineStream = _firestore.collection('Medicineadd').snapshots();
  }

  Future<void> _deleteProduct(String productId) async{
    try {
      await _firestore.collection('Medicineadd').doc(productId).delete();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Product deleted successfully'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error deleting product: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(text: 'All Product', size: 20,weight: FontWeight.w600,),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        ),
        body:  StreamBuilder(
          stream: _medicineStream,
          builder: (context, snapshot) {
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
            return Padding(
              padding: const EdgeInsets.only(top: 20,left: 5,right: 5),
              child: GridView.builder(
                        itemCount: snapshot.data!.docs.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 2,
                          mainAxisExtent: 210
                          ),
                          
                       itemBuilder: (context,index){
                        var data = snapshot.data!.docs[index];
                        var medicine = Medicine.fromMap(data.data() as Map<String, dynamic>);
                        
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AllProductviewPage(medicine: medicine),));
                          },
                          child: Card(
                            // borderRadius: BorderRadius.circular(20),
                            elevation: 5,
                            margin: EdgeInsets.all(1),
                            child: Stack(
                              children:[ Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if(medicine.imageurls.isNotEmpty)
                                  Container(
                                width: screenHeight,
                                height: screenHeight * 0.15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(medicine.imageurls[0])
                                    )
                                ),
                              ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: CustomText(text: medicine.medicinename, size: 16, weight: FontWeight.normal, color: Colors.black
                                    ,maxLine: 1,textOverflow: TextOverflow.ellipsis,),
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
                              Positioned(
                                right: 0,
                                child: IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                  showDialog(
                                    context: context,
                                     builder: (context) => AlertDialog(
                                      title: Text('Delete Product?'),
                                      content: Text('Are you sure you want to delete this product?'),
                                      actions: [
                                        TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(onPressed: () {
                                        _deleteProduct(data.id);
                                        Navigator.pop(context);
                                      }, 
                                      child: Text('Delete', style: TextStyle(
                                        color: Colors.red
                                      ),
                                      ))
                                      ],
                                     )
                                     );
                                },
                                )
                                )
                              ]
                            ),
                          ),
                        );
                       }),
            );
          }
        )
      ),
    );
  }
}