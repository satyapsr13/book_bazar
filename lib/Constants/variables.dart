// ignore_for_file: prefer_const_constructors
import 'package:book_bazar/Constants/colors.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<Widget> carouselItems = [
  ExtendedImage.network(
    "https://www.weekendnotes.com/im/001/07/book-bazaar-logo1.jpg",
    fit: BoxFit.cover,
    cache: true,
    // border: Border.all(color: Colors.red, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
  ExtendedImage.network(
    "https://th.bing.com/th/id/R.1d13248151022178c1a2fac4b79c8e32?rik=%2fyBWTzmqzVx8Iw&riu=http%3a%2f%2fgifimage.net%2fwp-content%2fuploads%2f2017%2f09%2fanime-book-gif.gif&ehk=ayjVvvfUpeadZ0oXULXzkthLsWxc5yddVG%2bnSXdiMnU%3d&risl=&pid=ImgRaw&r=0",
    fit: BoxFit.cover,
    cache: true,
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
];
List<Widget> intrests = [
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Chip(
      label: Text(
        'All',
        style: GoogleFonts.sacramento(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      backgroundColor: MyColors.primaryColor, shadowColor: Colors.red,
      // avatar: Icon(Icons.add),
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Chip(
      label: Text('favourates'),
      shadowColor: Colors.red,
      // avatar: Icon(Icons.add),
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Chip(
      label: Text('TextBooks'),
      shadowColor: Colors.red,
      // avatar: Icon(Icons.add),
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Chip(
      label: Text('Comics'),
      shadowColor: Colors.red,
      // avatar: Icon(Icons.add),
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Chip(
      label: Text('Novels'),
      shadowColor: Colors.red,
      // avatar: Icon(Icons.add),
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Chip(
      label: Text('Adventures'),
      shadowColor: Colors.red,
      // avatar: Icon(Icons.add),
    ),
  ),
];
