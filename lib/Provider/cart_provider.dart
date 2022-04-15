// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/book_model.dart';

class CartProvider extends ChangeNotifier {
  List<BookModel> cartBooks = [];

  set addBooks(BookModel data) {
    cartBooks.add(data);
  }

  Future loadCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", cartBooks.toString());
    
  }
}
