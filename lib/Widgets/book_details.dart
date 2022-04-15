// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'dart:developer';
import 'dart:math';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import 'package:book_bazar/Models/book_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/colors.dart';
import '../Screens/UserChats/seller_chat_screen.dart';

class BookDetailWidget extends StatefulWidget {
  // const BookDetailWidget({Key? key}) : super(key: key);
  BookModel book;
  BookDetailWidget({
    Key? key,
    required this.book,
  }) : super(key: key);
  @override
  State<BookDetailWidget> createState() => _BookDetailWidgetState();
}

class _BookDetailWidgetState extends State<BookDetailWidget> {
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Detail'),
        backgroundColor: MyColors.primaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.document_scanner),
            tooltip: 'read PDF',
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bookImage(mediaquery, widget.book.bookImageUrl),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "₹ ${widget.book.price}",
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.book.title,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              heading('Subtitle', mediaquery),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: mediaquery.width * 0.8,
                child: Text(
                  widget.book.subtitle,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              heading('Author', mediaquery),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: mediaquery.width * 0.8,
                child: Text(
                  widget.book.author,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              heading('Description', mediaquery),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: mediaquery.width * 0.8,
                child: Text(
                  widget.book.description,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              heading('Address', mediaquery),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: mediaquery.width * 0.8,
                child: Text(
                  widget.book.address,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 25),
              heading('Seller Profile', mediaquery),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor: Color.fromRGBO(
                                  Random().nextInt(256),
                                  Random().nextInt(256),
                                  Random().nextInt(256),
                                  1),
                              radius: 25,
                              child: Text(
                                'A',
                                style: const TextStyle(fontSize: 30),
                              ),
                            ),
                            Text(
                              '  Ankur Gupta',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Add to cart',
                        style: const TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.badge,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => SellerChatPage())));
                },
                child: Container(
                  color: MyColors.primaryColor,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Chat',
                          style: const TextStyle(fontSize: 20),
                        ),
                        // Icon(Icons.chat),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.chat,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }

  Text heading(String title, Size mediaquery) {
    return Text(
      title,
      style: GoogleFonts.aclonica(
        fontSize: 15,
      ),
    );
  }

  Center bookImage(Size mediaquery, String book) {
    return Center(
      child: SizedBox(
        width: mediaquery.width * 0.9,
        height: mediaquery.height * 0.3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: ExtendedImage.network(
            book, fit: BoxFit.cover,

            // border: Border.all(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            //cancelToken: cancellationToken,
          ),
        ),
      ),
    );
  }
}
