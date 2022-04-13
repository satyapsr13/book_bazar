// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:book_bazar/Constants/colors.dart';
import 'package:book_bazar/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                child: loginWithGoogle(mediaquery),
                onPressed: () async {
                  final user = await GoogleSignInApi.login();
                  try {
                    // Obtain shared preferences.
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setString("name", user!.displayName ?? "");
                    await prefs.setString("email", user.email);
                    await prefs.setString("image", user.photoUrl ?? "");
                    AwesomeDialog(
                      dismissOnTouchOutside: false,
                      context: context, showCloseIcon: false,
                      dialogType: DialogType.QUESTION,
                      animType: AnimType.BOTTOMSLIDE, //awesome_dialog: ^2.1.1
                      title: "Are you ${user.displayName} ?",
                      // desc: 'Dialog description here.............',
                      btnCancelOnPress: () async {
                        await GoogleSignInApi.signout();
                      },
                      btnCancelText: 'No',
                      btnOkText: 'Yes',
                      btnOkColor: Theme.of(context).primaryColor,
                      btnOkOnPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => HomePage())));
                      },
                    ).show();
                  } catch (e) {}
                  // log(user!.toString());

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: ((context) => HomePage(
                  //             // data: data,
                  //             ))));
                }

                // await auth.googleSignIn.signIn();
                ),
          ),
        ),
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }

  Row loginWithGoogle(Size mediaquery) {
    return Row(
      children: [
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.login,
            color: Colors.white,
            size: 15,
          ),
        ),
        Text('Login with',
            style: TextStyle(
              fontSize: mediaquery.width * 0.05,
              color: Colors.white,
            )),
        Text(' Google',
            style: GoogleFonts.sacramento(
              fontSize: mediaquery.width * 0.1,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
        Spacer(),
      ],
    );
  }
}
