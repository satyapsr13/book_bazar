// ignore_for_file: prefer_const_constructors
import 'package:book_bazar/Screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import '../Screens/User/profile_page.dart';
import '../Screens/UserChats/chat_screen.dart';
import '../Screens/cart_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 18, right: 18),
        child: Container(
          height: 50,
          width: 500,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => HomePage())));
                },
                icon: const Icon(
                  Icons.home,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => UserChatScreen())));
                },
                icon: const Icon(
                  Icons.chat,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: null,
                icon: const Icon(
                  Icons.chair,
                  size: 20,
                  color: Colors.transparent,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => MyCart())));
                },
                icon: const Icon(
                  Icons.bookmark_add_outlined,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => ProfilePage())));
                },
                icon: const Icon(
                  Icons.person,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              gradient: linearGradient(),
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
