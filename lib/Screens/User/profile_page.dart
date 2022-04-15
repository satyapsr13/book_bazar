// ignore_for_file: prefer_const_constructors
import 'dart:math';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Constants/colors.dart';
import '../../Widgets/bottom_navbar.dart';
import '../../Widgets/floating_action_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? name;
  String? email;
  String? image;
  void getUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name');
      email = prefs.getString('email');
      image = prefs.getString('image');
    });
  }

  var blendMode = BlendMode.colorDodge;
  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: linearGradient()),
        ),
      ),
      body: name == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  showImage(mediaquery),
                  SizedBox(height: 25),
                  Text(
                    'Name :- ${name}',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 25),
                  Text(
                    'Email :- ${email}',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingAddButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(),
    );
    ;
  }

  int color = 45;
  Center showImage(Size mediaquery) {
    return Center(
      child: Stack(
        children: [
          Transform.rotate(
            angle: -0.2,
            child: SizedBox(
              width: mediaquery.width * 0.85,
              height: mediaquery.height * 0.35,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Color.fromRGBO(
                        Random().nextInt(256), color, Random().nextInt(254), 1),
                    blendMode),
                child: ExtendedImage.network(
                  image ??
                      "https://th.bing.com/th/id/OIP.cUUf67YH-hex_XPKWlnZ1QHaLF?w=125&h=187&c=7&r=0&o=5&dpr=1.65&pid=1.7",
                  fit: BoxFit.cover,
                  cache: true,
                  // border: Border.all(color: Colors.red, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  //cancelToken: cancellationToken,
                ),
              ),
            ),
          ),
          Transform.rotate(
            angle: 0.1,
            child: Draggable(
              onDragUpdate: (_) {
                setState(() {
                  color = (color + Random().nextInt(25600)) % 256;
                });
              },
              onDragCompleted: () {
                setState(() {});
              },
              feedback: SizedBox(
                width: mediaquery.width * 0.85,
                height: mediaquery.height * 0.35,
                child: ExtendedImage.network(
                  image ??
                      "https://th.bing.com/th/id/OIP.cUUf67YH-hex_XPKWlnZ1QHaLF?w=125&h=187&c=7&r=0&o=5&dpr=1.65&pid=1.7",
                  fit: BoxFit.cover,
                  cache: true,
                  // border: Border.all(color: Colors.red, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  //cancelToken: cancellationToken,
                ),
              ),
              child: SizedBox(
                width: mediaquery.width * 0.85,
                height: mediaquery.height * 0.35,
                child: ExtendedImage.network(
                  image ??
                      "https://th.bing.com/th/id/OIP.cUUf67YH-hex_XPKWlnZ1QHaLF?w=125&h=187&c=7&r=0&o=5&dpr=1.65&pid=1.7",
                  fit: BoxFit.cover,
                  cache: true,
                  // border: Border.all(color: Colors.red, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  //cancelToken: cancellationToken,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
