// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class MyCart extends StatelessWidget {
  MyCart({Key? key}) : super(key: key);
  static const routeName = '/MyCart';
  int itemLenght = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: const Text('My Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: itemLenght == 0
            ? CircularProgressIndicator()
            : Center(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.44),
                    Text(
                      'No Item In your cart',
                      style: const TextStyle(fontSize: 25),
                    ),
                    Icon(
                      Icons.shop_2_outlined,
                      size: 40,
                    ),
                  ],
                ),
              ),
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }
}
