// ignore_for_file: prefer_const_constructors
import 'package:book_bazar/Models/book_model.dart';
import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import '../Network/api_calls.dart';
import '../Widgets/bottom_navbar.dart';
import '../Widgets/floating_action_button.dart';
import 'Books/add_books.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/homepage';
  // const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Bazar"),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: linearGradient()),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                  future: getBookFromDataBase(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      var data = snapshot.data;
                      List<BookModel> bookdata = data as List<BookModel>;
                      if (data != null) {
                        return ListView.builder(
                          itemCount: 20,
                          itemBuilder: (ctx, index) => Text(
                            "data[index].title",
                            style: const TextStyle(),
                          ),
                        );
                      }
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Text(
                      'error',
                      style: const TextStyle(),
                    );
                  }),
            ],
          ),
        ),
      ),
      drawer: Drawer(),
      // drawer: MyDrawer2(),
      // floatingActionButton: floatingactionbutton(context),
      // bottomNavigationBar: navbar(context),
      floatingActionButton: FloatingAddButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(),
    );
  }

  FloatingActionButton floatingactionbutton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Color.fromRGBO(114, 102, 255, 1),
      onPressed: () {},
      //params
    );
  }
}
