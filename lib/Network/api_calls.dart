// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:book_bazar/Models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Screens/Auth/google_api.dart';

String baseUrl =
    "https://6f06-2409-4043-4d93-6896-4527-5852-643e-3df4.ngrok.io";
Future<bool> addBookDatatoDataBase(BookModel bookdata) async {
  Map data = bookdata.toMap();
  final response = await http.post(Uri.parse("$baseUrl/book/add"),
      body: json.encode(data), headers: {'Content-type': 'application/json'});

  var jsonResponse = json.decode(response.body);
  if (response.statusCode == 200) {
    log(jsonResponse.toString());

    return true;
  }
  return false;
}

Future<bool> registerToDataBase(String name, String email, String image,
    String id, BuildContext context) async {
  Map data = {
    "displayName": name,
    "email": email,
    "photoUrl": image,
    "id": id,
  };
  final response = await http.post(Uri.parse("$baseUrl/user/register"),
      body: json.encode(data), headers: {'Content-type': 'application/json'});

  final jsonResponse = json.decode(response.body);
  if (response.statusCode == 200) {
    AwesomeDialog(
      context: context, showCloseIcon: false, dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      dialogType: DialogType.SUCCES,
      animType: AnimType.BOTTOMSLIDE, //awesome_dialog: ^2.1.1
      title: 'Successfully SignUp',
      desc: 'Please Login Now!',
      // btnCancelOnPress: () {},
      btnOkText: 'Ok',
      btnOkColor: Theme.of(context).primaryColor,
      btnOkOnPress: () {
        Navigator.pop(context);
      },
    ).show();
    return true;
  } else {
    AwesomeDialog(
      context: context, showCloseIcon: false, dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      dialogType: DialogType.ERROR,
      animType: AnimType.BOTTOMSLIDE, //awesome_dialog: ^2.1.1
      title: 'Please try again',
      desc: jsonResponse['message'],
      // btnCancelOnPress: () {},
      btnOkText: 'Ok',
      btnOkColor: Theme.of(context).primaryColor,
      btnOkOnPress: () async {
        await GoogleSignInApi.signout();
        Navigator.pop(context);
      },
    ).show();
    return false;
  }

  // return null;
}
