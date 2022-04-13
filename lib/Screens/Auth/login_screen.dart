// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:book_bazar/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'google_api.dart';
// import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  String t = "";
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: mediaquery.width,
        height: mediaquery.height,
        decoration: BoxDecoration(gradient: linearGradient()),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
                child: Row(
                  children: [
                    Spacer(
                        // flex: 2,
                        ),
                    Icon(
                      Icons.login,
                      color: Colors.white,
                      size: 15,
                    ),
                    Text('   Login with',
                        style: TextStyle(
                          fontSize: mediaquery.width * 0.05,
                          color: Colors.white,
                        )),


                        
                    Text(' Google',
                        style: GoogleFonts.sacramento(
                          fontSize: mediaquery.width * 0.07,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    Spacer(
                        // flex: 1,
                        ),
                  ],
                ),
                onPressed: () async {
                  final user = await GoogleSignInApi.login();
                  log(user!.displayName.toString());
                  setState(() {
                    isLoading = false;
                  });
                }

                // await auth.googleSignIn.signIn();
                ),
          ),
        ),
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }
}
