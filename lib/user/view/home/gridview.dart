// import 'package:drugcart/provider/favorate_provider.dart';
// import 'package:drugcart/user/view/product/product_details.dart';
// import 'package:drugcart/user/model/widget/constants.dart';
// import 'package:drugcart/user/model/widget/customtext.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:provider/provider.dart';

// class ProductCard extends StatelessWidget {
//   // final product;
//    int? quantity;
//   ProductCard({super.key, this.quantity});
  
//   // late double _rating;

//   // final double _initialRating = 2.0;
//   // final bool _isVertical = false;
//   // IconData? _selectedIcon;
//   @override
//   Widget build(BuildContext context) {
//     // final Provider = FavoriteProvider.of(context);

//     return GestureDetector(
//       onTap: () {
//         // Navigator.push(context, MaterialPageRoute(builder: (context) => User_ProductDetails(),));
//       },
//       child: Stack(
//         children: [
//           GestureDetector(
//             onTap: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => User_ProductDetails(),));
//             },
//             child: Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: kcontentColor,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     height: 5,   
//                   ),
//                   Center(
//                     child: Hero(
//                       tag: ProductCard,
//                       child: Image.asset('images/zincovit.png',
//                       width: MediaQuery.of(context).size.width * 0.4,
//                       height: MediaQuery.of(context).size.height * 0.2,
//                       fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Padding(padding: const EdgeInsets.only(left: 10),
//                   child: CustomText(text: 'Zincovit Stripof Tablet(Green)',
//                    size: 16,
//                    weight: FontWeight.w400,
//                    color: Colors.black,
//                    ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10),
//                     child: RatingBar.builder(
//                       // initialRating: _initialRating,
//                       minRating: 1,
//                       // direction: _isVertical ? Axis.vertical : Axis.horizontal,
//                       direction: Axis.horizontal,
//                       unratedColor: Colors.amber,
//                       itemCount: 5,
//                       itemSize: 20.0,
//                       itemBuilder: (context, index) => const Icon(
//                       //  _selectedIcon ??
//                         Icons.star,
//                         color: Colors.amber,
//                       ),
//                       onRatingUpdate: (rating) {
                        
//                       },
//                       updateOnDrag: true,
//                       ),
//                   ),
//                   Padding(padding: EdgeInsets.only(left: 10),
//                     child: Wrap(
//                       children: [
//                         CustomText(text: 'MRP', size: 16,weight: FontWeight.w300,color: Colors.grey,),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 20),
//                           child: CustomText(text: '₹110.00', size: 16,weight: FontWeight.w300,color: Colors.grey,decoration: TextDecoration.lineThrough,),
//                         )  
//                       ],
//                     ),
//                   ),
//                   Padding(padding: EdgeInsets.only(left: 10),
//                   child: CustomText(text: '₹101.00', size: 16,weight: FontWeight.w300,color: Colors.black,),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           // favorite
//           Positioned(child: Align(
//             alignment: Alignment.topRight,
//             child: Container(
//               height: MediaQuery.of(context).size.height * 0.045,
//               width: MediaQuery.of(context).size.width * 0.085,
//               decoration: const BoxDecoration(
//                 color: kpinkcolor,
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(20),
//                   bottomLeft: Radius.circular(10)
//                 )
//               ),
//               child: GestureDetector(
//                 onTap: () {
//                   // Provider.toggleFavorite(ProductCard());
//                 },
//                 child:  const Icon(
//                   // Provider.isExist(ProductCard())?
//                   Icons.favorite
//                   // Icons.favorite_border
//                   ,color: Colors.white,size: 22,),
//               ),
//             ),
//           ))
//         ],
//       ),
//     );
//   }
// }