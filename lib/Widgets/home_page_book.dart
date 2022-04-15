import 'package:book_bazar/Widgets/book_details.dart';
import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import '../Models/book_model.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key, required this.model}) : super(key: key);

  final BookModel model;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    // var mediaquery;
    return InkWell(
      splashColor: MyColors.primaryColor,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => BookDetailWidget(
                      book: model,
                    ))));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: mediaQuery.height * 0.21,
          decoration: boxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                bookImage(mediaQuery, model.bookImageUrl.toString()),
                bookDetails(mediaQuery, model),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration boxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 2, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(10));
  }

  SizedBox bookDetails(Size mediaQuery, BookModel book) {
    return SizedBox(
      height: mediaQuery.height * 0.3,
      width: mediaQuery.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                width: mediaQuery.width * 0.3,
                child: Text(
                  book.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              Spacer(),
              Icon(Icons.shopping_basket)
            ],
          ),
          SizedBox(height: 10),
          Text(
            book.description,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 10),
          ),
          Spacer(),
          SizedBox(
            width: mediaQuery.width * 0.35,
            child: Row(
              children: [
                Icon(Icons.location_on_outlined),
                Text(
                  book.address,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox bookImage(Size mediaQuery, String bookImageUrl) {
    return SizedBox(
      width: mediaQuery.width * 0.4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.network(
          bookImageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
