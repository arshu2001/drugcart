import 'package:drugcart/provider/cart_provider.dart';
import 'package:drugcart/user/home/gridview.dart';
import 'package:drugcart/user/product/product_imgslider.dart';
import 'package:drugcart/user/user_buy.dart';
import 'package:drugcart/widget/constants.dart';
import 'package:drugcart/widget/cushomeappbar.dart';
import 'package:drugcart/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class User_ProductDetails extends StatefulWidget {
  const User_ProductDetails({super.key});

  @override
  State<User_ProductDetails> createState() => _User_ProductDetailsState();
}

class _User_ProductDetailsState extends State<User_ProductDetails> {
  int currentImage = 0;
  @override
  Widget build(BuildContext context) {
    final Provider = CartProvider.of(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back)),
          title: Center(child: CustomText(text: 'Product Details', size: 20,weight: FontWeight.bold,)),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            ProductImgSlider(onChange: (index){
              setState(() {
                currentImage = index;
              });
            },),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  List.generate(
                3 , (index) => AnimatedContainer(
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
              child: CustomText(text: 'Zincovit Strip of 15 Tablets (Green) ', size: 20,weight: FontWeight.w600,color: Colors.black,),
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
                    child: CustomText(text: '₹110.00', size: 16,weight: FontWeight.w300,color: Colors.grey,decoration: TextDecoration.lineThrough,),
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
              child: CustomText(text: '₹101.00', size: 20,weight: FontWeight.w400,color: Colors.black,),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Provider.toggleFavorite(ProductCard());
                    const SnackBar(content: Text('Successfully added'),
                    duration: Duration(seconds: 1),
                    );
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
              child: CustomText(text: 'Zincovit tablets can help in treating andpreventing vitamin and mineraldeficiencies. It also helps in protectingthe body from damage, helping improveimmunity, metabolism and other bodyfunctions',
               size: 16,weight: FontWeight.normal,color: kgreyColor,),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 10),
              child: CustomText(text: 'FAQ', size: 20,weight: FontWeight.w600,color: Colors.black,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 10),
              child: CustomText(text: 'Q: How many Zincovit tables Should i take daily?', size: 20,weight: FontWeight.w600,color: Colors.black,),
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