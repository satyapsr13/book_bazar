import 'package:flutter/material.dart';

class MyColors {
  static const primaryColor = Color.fromRGBO(147, 97, 255, 1);
}

LinearGradient linearGradient() {
  return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        // Colors.red,
        // Colors.blue,
        Color.fromRGBO(147, 97, 255, 1),
        Color.fromRGBO(114, 102, 255, 1),
      ]);
}

// class DrawerIcons {
//   static final List<DrawerItem> drawerItems = <DrawerItem>[
//     DrawerItem(icon: Icon(Icons.people), label: "People"),
//     DrawerItem(icon: Icon(Icons.trending_up), label: "Trending"),
//     DrawerItem(icon: Icon(Icons.tv)),
//     DrawerItem(icon: Icon(Icons.work), label: "Work"),
//     DrawerItem(icon: Icon(Icons.web)),
//     DrawerItem(icon: Icon(Icons.videogame_asset)),
//     DrawerItem(icon: Icon(Icons.book), label: "Book"),
//     DrawerItem(icon: Icon(Icons.call), label: "Telephone")
//   ];
// }
