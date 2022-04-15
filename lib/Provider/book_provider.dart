import 'dart:convert';
import 'dart:developer';

import 'package:book_bazar/Models/book_model.dart';
import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Network/api_calls.dart';

enum Loading { waiting, error, done }

class BookProvider extends ChangeNotifier {
  List<BookModel> bookdata = [];

  bool isLoading = false;
  Loading loading = Loading.done;
  Future getBookFromDataBase() async {
    isLoading = true;
    loading = Loading.waiting;
    log(isLoading.toString());
    try {
      final response = await http.get(Uri.parse("$baseUrl/book/getbooks"),
          headers: {'Content-type': 'application/json'});

      bookdata.clear();
      final jsonResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        for (var item in jsonResponse['data']) {
          BookModel data = BookModel.fromJson(json.encode(item));
          bookdata.add(data);
        }
      } else {
        loading = Loading.error;
      }
    } catch (e) {
      loading = Loading.error;
      notifyListeners();
      return;
    }
    loading = Loading.done;
    isLoading = false;
    notifyListeners();
    // return null;
  }
}
