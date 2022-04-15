// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:book_bazar/Models/book_model.dart';
import 'package:book_bazar/Provider/book_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Constants/colors.dart';
import '../Constants/variables.dart';
import '../Network/api_calls.dart';
import '../Widgets/bottom_navbar.dart';
import '../Widgets/drawer.dart';
import '../Widgets/floating_action_button.dart';
import '../Widgets/home_page_book.dart';
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
    Provider.of<BookProvider>(context, listen: false).getBookFromDataBase();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
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
          IconButton(
            onPressed: () => Provider.of<BookProvider>(context, listen: false)
                .getBookFromDataBase(),
            icon: const Icon(
              Icons.refresh_outlined,
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
              SizedBox(height: 20),
              SizedBox(
                height: mediaquery.height * 0.2,
                child: CarouselSlider(
                  items: carouselItems,
                  options: CarouselOptions(
                    viewportFraction: 0.98,
                    enlargeCenterPage: true,
                    autoPlay: true,
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: intrests,
                ),
              ),
              SizedBox(height: 5),
              Consumer<BookProvider>(builder: (context, data, _) {
                return data.loading == Loading.waiting
                    ? Center(child: CircularProgressIndicator())
                    : data.loading == Loading.error
                        ? Column(
                            children: [
                              Text(
                                'error',
                                style: const TextStyle(),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Provider.of<BookProvider>(context,
                                          listen: false)
                                      .getBookFromDataBase();
                                },
                                child: Text(
                                  'Refresh',
                                  style: const TextStyle(),
                                ),
                              )
                            ],
                          )
                        : SizedBox(
                            // height: (mediaquery.height * 2) - 150,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: data.bookdata.length,
                                itemBuilder: (ctx, index) {
                                  return HomePageWidget(
                                    model: data.bookdata[index],
                                  );
                                }),
                          );
              })
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
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
