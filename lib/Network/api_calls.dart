// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'dart:developer';

import 'package:book_bazar/Models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<bool> addBookDatatoDataBase(BookModel bookdata) async {
  Map data = bookdata.toMap();
  final response = await http.post(
      Uri.parse("https://47f5-157-34-65-229.ngrok.io/book/add"),
      body: json.encode(data),
      headers: {'Content-type': 'application/json'});

  var jsonResponse = json.decode(response.body);
  if (response.statusCode == 200) {
    log(jsonResponse.toString());

    return true;
  }
  return false;
}

Future  getBookFromDataBase() async {
  final response = await http.get(
      Uri.parse("https://47f5-157-34-65-229.ngrok.io/book/getbooks"),
      headers: {'Content-type': 'application/json'});

  List<BookModel> bookdata = [];
  final jsonResponse = json.decode(response.body);
  if (response.statusCode == 200) {
    // log(jsonResponse.toString());
    for (var item in jsonResponse['data']) {
      log("----------------------");
      log(item.toString());
      BookModel data = BookModel.fromJson(json.encode(item));
      bookdata.add(data);
    }
  }
  return bookdata;
  // return null;
}
