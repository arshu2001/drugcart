import 'package:drugcart/user/view/cart/check_out.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drugcart/provider/cart_provider.dart';
import 'package:drugcart/user/model/widget/customtext.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // Access the cart provider to get cart items
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      // Checkout button at the bottom
      bottomSheet: CheckOut(),
      appBar: AppBar(
        title: CustomText(text: 'My Cart', size: 20, weight: FontWeight.bold),
        centerTitle: true,
      ),
      body: cartProvider.cartItems.isEmpty
          ? Center(
              child: CustomText(
                text: 'Your cart is empty!',
                size: 18,
                weight: FontWeight.normal,
              ),
            )
          : ListView.builder(
              itemCount: cartProvider.cartItemsCount,
              itemBuilder: (context, index) {
                final cartItem = cartProvider.cartItems[index];

                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade200,
                          ),
                          child: Image.network(cartItem.imageurls[0]),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: screenWidth * 0.50,
                              child: CustomText(
                                text: cartItem.medicinename,textOverflow: TextOverflow.ellipsis,
                                size: 16,
                                weight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            CustomText(
                              text: '₹${cartItem.medicineprice}',
                              size: 14,
                              weight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            cartProvider.removeFromCart(cartItem);
                          },
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
