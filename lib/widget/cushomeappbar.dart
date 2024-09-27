import 'package:drugcart/widget/constants.dart';
import 'package:drugcart/widget/customtext.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kpinkcolor,
      leading: IconButton(
        onPressed: () {
          // Handle the leading icon button action
        },
        icon: Icon(Icons.view_headline_outlined),
      ),
      title: CustomText(text: 'Home', size: 24, weight: FontWeight.bold, color: Colors.black),
      actions: [
        IconButton(
          onPressed: () {
            // Handle the notifications icon button action
          },
          icon: Icon(Icons.notifications),
        ),
        // Add more action buttons if needed
      ],
    );
  }
}
