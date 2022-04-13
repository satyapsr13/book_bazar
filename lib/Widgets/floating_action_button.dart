// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import '../Screens/Books/add_books.dart';

class FloatingAddButton extends StatelessWidget {
  const FloatingAddButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color.fromRGBO(147, 97, 255, 1),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => BookSellingFormScreen())));
      },
    );
  }
}
