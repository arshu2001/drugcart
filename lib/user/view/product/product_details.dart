import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/medical_shop/model/medicineadd_modal.dart';
import 'package:drugcart/provider/cart_provider.dart';
import 'package:drugcart/user/view/cart/cart.dart';
import 'package:drugcart/user/view/home/gridview.dart';
import 'package:drugcart/user/view/product/product_imgslider.dart';
import 'package:drugcart/user/view/user_buy.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/cushomeappbar.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class User_ProductDetails extends StatefulWidget {
  final Medicine medicine;
  
  const User_ProductDetails({Key? key,  required this.medicine}): super(key: key);

  @override
  State<User_ProductDetails> createState() => _User_ProductDetailsState();
}

class _User_ProductDetailsState extends State<User_ProductDetails> {
  int currentImage = 0;
  @override
  Widget build(BuildContext context) {
    // final Provider = CartProvider.of(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<String> imagePaths = List<String>.from(widget.medicine.imageurls);
    String medicineName = widget.medicine.medicinename;
    String medicinePrice = widget.medicine.medicineprice;
    String description = widget.medicine.description;
    String faq = widget.medicine.faq;
    // String discount = widget.data['discount'] ?? "0"; 
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back)
          ),
          title: CustomText(text: 'Product Details',
           size: 20,
           weight: FontWeight.bold,
           ),
           centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            ProductImgSlider(
              imagePaths: imagePaths,
              onChange: (index){
              setState(() {
                currentImage = index;
              });
            },),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  List.generate(
                 imagePaths.length,
                 (index) => AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 300),
                    width: currentImage == index ?15:8,
                    height: 8,
                    margin: const EdgeInsets.only(right: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentImage == index? Colors.black:Colors.transparent,
                      border: Border.all(color: Colors.black) 
                    ),
                    ),
                    ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: CustomText(text: '$medicineName', size: 20,weight: FontWeight.w600,color: Colors.black,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 10),
              child: RatingBar.builder(
                        // initialRating: _initialRating,
                        minRating: 1,
                        // direction: _isVertical ? Axis.vertical : Axis.horizontal,
                        direction: Axis.horizontal,
                        unratedColor: Colors.amber,
                        itemCount: 5,
                        itemSize: 30.0,
                        itemBuilder: (context, index) => Icon(
                        //  _selectedIcon ??
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          
                        },
                        updateOnDrag: true,
                        ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 10),
              child: Wrap(
                children: [
                  CustomText(text: 'MRP', size: 16,weight: FontWeight.w300,color: Colors.grey,),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: CustomText(text: '₹$medicinePrice', size: 16,weight: FontWeight.w300,color: Colors.grey,decoration: TextDecoration.lineThrough,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: CustomText(text: '8%', size: 18,weight: FontWeight.w400,color: Colors.red,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CustomText(text: 'OFF', size: 18,weight: FontWeight.w400,color: Colors.red,),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 10),
              child: CustomText(text: '₹$medicinePrice', size: 20,weight: FontWeight.w400,color: Colors.black,),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  // onTap: () {
                  //   Provider.toggleFavorite(ProductCard());
                  //   const SnackBar(content: Text('Successfully added'),
                  //   duration: Duration(seconds: 1),
                  //   );
                  // },
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Cart(),));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green
                    ),
                    child: Center(child: CustomText(text: 'Add To Cart', size: 20,weight: FontWeight.w600,color: Colors.white,)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserBuy(),));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red
                    ),
                    child: Center(child: CustomText(text: 'Buy Now', size: 20,weight: FontWeight.w600,color: Colors.white,)),
                  ),
                )
              ],
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 10),
              child: CustomText(text: 'Description', size: 20,weight: FontWeight.w600,color: Colors.black,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CustomText(text: '$description',
               size: 16,weight: FontWeight.normal,color: kgreyColor,),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 10),
              child: CustomText(text: 'FAQ', size: 20,weight: FontWeight.w600,color: Colors.black,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 10),
              child: CustomText(text: 'Q: $faq?', size: 20,weight: FontWeight.w600,color: Colors.black,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CustomText(text: 'A: Take Zincovit tablet as per yourdoctors advice. Do not take more thanthe recommended dose of this supplement as this may lead to an overdose.',
               size: 16,weight: FontWeight.normal,color: kgreyColor,),
            )

          ],
                ),
        ),
      ),
    );
  }
}