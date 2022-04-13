// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
 import 'package:book_bazar/Screens/User/profile_page.dart';
import 'package:book_bazar/Widgets/floating_action_button.dart';
import 'package:flutter/material.dart';

import '../../Constants/colors.dart';
import '../home_screen.dart';

class UserChatScreen extends StatelessWidget {
  const UserChatScreen({Key? key}) : super(key: key);
   @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.primaryColor,
          title: const Text(
            'Chats',
          ),
          // ignore: prefer_const_constructors
          bottom: TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.white,
            // ignore: prefer_const_literals_to_create_immutables
            tabs: [
              const Tab(
                text: 'All',
              ),
              const Tab(
                text: 'Selling',
              ),
              const Tab(
                text: 'Buying',
              ),
            ],
          ),
        ),
        // backgroundColor: Colors.black87,
        body: TabBarView(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.44),
                  Text(
                    'No Chats',
                    style: const TextStyle(fontSize: 25),
                  ),
                  Icon(
                    Icons.chat_outlined,
                    size: 40,
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.44),
                  Text(
                    'No Chats',
                    style: const TextStyle(fontSize: 25),
                  ),
                  Icon(
                    Icons.chat_outlined,
                    size: 40,
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.44),
                  Text(
                    'No Chats',
                    style: const TextStyle(fontSize: 25),
                  ),
                  Icon(
                    Icons.chat_outlined,
                    size: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingAddButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
