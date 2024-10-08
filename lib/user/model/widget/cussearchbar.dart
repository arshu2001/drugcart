// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:drugcart/user/model/widget/constants.dart';
import 'package:flutter/material.dart';

class Cus_Searchbar extends StatelessWidget {
  const Cus_Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kcontentColor,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Colors.grey,
            size: 30,
          ),
          const SizedBox(width: 10),
          const Flexible(
            flex: 4,
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search...", border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}