// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_single_cascade_in_expression_statements, unused_local_variable, library_prefixes, avoid_print

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:book_bazar/Constants/colors.dart';
import 'package:book_bazar/Models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../Network/api_calls.dart';

class BookSellingFormScreen extends StatefulWidget {
  const BookSellingFormScreen({Key? key}) : super(key: key);

  @override
  State<BookSellingFormScreen> createState() => _BookSellingFormScreenState();
}

class _BookSellingFormScreenState extends State<BookSellingFormScreen> {
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final authorController = TextEditingController();
  final addressController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final productLocationController = TextEditingController();
  String? bookImageLink;
  final _formKey = GlobalKey<FormState>();
  bool isloading = false;
  Uint8List? imageBytes;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: isloading ? Text('Loading...') : Text('Fill your details'),
      ),
      body: isloading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Title', style: textstyle(context)),
                      titletextwidget(mediaQuery),
                      const Sizedbox(),
                      Text('Subtitle', style: textstyle(context)),
                      subtitletextwidget(mediaQuery),
                      const Sizedbox(),
                      Text('Author', style: textstyle(context)),
                      authortextwidget(mediaQuery),
                      const Sizedbox(),
                      Text('Description', style: textstyle(context)),
                      descriptiontextwidget(mediaQuery),
                      const Sizedbox(),
                      Text('Address', style: textstyle(context)),
                      addresswidget(mediaQuery),
                      const Sizedbox(),
                      price(context, mediaQuery),
                      const Sizedbox(),
                      Text('Upload Image', style: textstyle(context)),
                      const Sizedbox(),
                      GestureDetector(
                        onTap: pickImage,
                        child: Center(
                          child: Container(
                            // height: 120,
                            height: mediaQuery.height * 0.3,
                            child: imageBytes != null
                                ? showImage()
                                : const Icon(Icons.add_a_photo_outlined),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: imageBytes != null,
                        child: Row(
                          children: [
                            const Spacer(
                              flex: 2,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  imageBytes = null;
                                });
                              },
                              icon: Icon(
                                Icons.cancel_outlined,
                                color: Colors.red,
                                size: 35,
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.done,
                                color: Colors.green,
                                size: 35,
                              ),
                            ),
                            const Spacer(
                              flex: 2,
                            ),
                          ],
                        ),
                      ),
                      const Sizedbox(),
                      submit(mediaQuery, context),
                      SizedBox(height: mediaQuery.height * 0.2),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Future<dynamic> openBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      // context and builder are
      // required properties in this widget
      context: context,
      builder: (BuildContext context) {
        // we set up a container inside which
        // we create center column and display text
        return Container(
          // height: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Upload Image',
                ),
                Container(
                  height: 200,
                  width: 200,
                  child: imageBytes != null
                      ? showImage()
                      : const Icon(Icons.add_a_photo_outlined),
                ),
                ElevatedButton(
                  onPressed: () {
                    pickImage();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Pick Image',
                    style: const TextStyle(),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void pickImage() async {
    //image_picker: ^0.8.4+11
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    log('message');
    setState(() {
      imageBytes = File(image!.path).readAsBytesSync();
    });
  }

  Widget showImage() {
    return imageBytes != null ? Image.memory(imageBytes!) : Container();
  }

  AwesomeDialog WelComePageRedirectDialogue(BuildContext context) {
    return AwesomeDialog(
      context: context, showCloseIcon: true,
      dialogType: DialogType.INFO_REVERSED,
      animType: AnimType.BOTTOMSLIDE, //awesome_dialog: ^2.1.1
      title: 'Not Login?',
      btnOkText: 'Login',
      btnOkColor: Theme.of(context).primaryColor,
      btnOkOnPress: () {},
    );
  }

  TextFormField authortextwidget(Size mediaQuery) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter author name';
        }
        return null;
      },
      controller: authorController,
      decoration: inputDecorations("author", mediaQuery),
    );
  }

  TextFormField subtitletextwidget(Size mediaQuery) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter Subtitle';
        }
        return null;
      },
      controller: subtitleController,
      decoration: inputDecorations("subtitle", mediaQuery),
    );
  }

  TextFormField titletextwidget(Size mediaQuery) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter title';
        }
        return null;
      },
      controller: titleController,
      decoration: inputDecorations("Title", mediaQuery),
    );
  }

  TextFormField descriptiontextwidget(Size mediaQuery) {
    return TextFormField(
      controller: descriptionController,
      decoration: inputDecorations("Description", mediaQuery),
      maxLines: 3,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter description';
        }
        return null;
      },
    );
  }

  TextFormField addresswidget(Size mediaQuery) {
    return TextFormField(
      controller: addressController,
      decoration: inputDecorations("address", mediaQuery),
      maxLines: 3,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter address';
        }
        return null;
      },
    );
  }

  Center submit(Size mediaQuery, BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: mediaQuery.width * 0.35,
            height: 40,
            decoration: BoxDecoration(
              color: MyColors.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextButton(
                child: const Text('Submit',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                style: buttonStyle(context),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      isloading = true;
                    });

                    AwesomeDialog(
                      context: context, dialogType: DialogType.QUESTION,
                      animType: AnimType.BOTTOMSLIDE,
                      title: 'All book  details are correct ?',
                      // desc: 'Dialog description here.............',
                      btnCancelOnPress: () {
                        setState(() {
                          isloading = false;
                        });
                      },
                      btnOkOnPress: () async {
                        // setState(() {
                        //   isloading = false;
                        // });
                        BookModel bookdata = BookModel(
                            id: DateTime.now().toString(),
                            title: titleController.text,
                            subtitle: subtitleController.text,
                            author: authorController.text,
                            description: descriptionController.text,
                            price: priceController.text,
                            address: addressController.text,
                            bookImageUrl: "https://picsum.photos/200/300");

                        try {
                          bool res = await addBookDatatoDataBase(bookdata);
                          if (res) {
                            setState(() {
                              isloading = false;
                            });
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.SUCCES,
                              animType: AnimType.TOPSLIDE,
                              title: 'Book Added Successfully',
                              // desc: 'Dialog description here.............',
                              // btnCancelOnPress: () {},
                              btnOkText: "OK",
                              btnOkOnPress: () {
                                Navigator.pop(context);
                              },
                            )..show();
                          } else {
                            // errorDailogue(context);
                          }
                        } catch (e) {
                          setState(() {
                            isloading = false;
                          });
                          errorDailogue(context, e.toString());
                        }
                      },
                    )..show();
                  }
                }),
          ),
          SizedBox(height: mediaQuery.height * 0.05),
        ],
      ),
    );
  }

  AwesomeDialog errorDailogue(BuildContext context, String s) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.TOPSLIDE,
      title: 'Please try again $s ',
      // desc: 'Dialog description here.............',
      // btnCancelOnPress: () {},
      btnOkText: "OK",
      btnOkOnPress: () {},
    )..show();
  }

  AwesomeDialog successDialogue(BuildContext context) {
    return AwesomeDialog(
      context: context,
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      dialogType: DialogType.SUCCES,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Success',
      // desc: 'Dialog description here.............',
      // btnCancelOnPress: () {},
      btnOkOnPress: () {
        Navigator.pop(context);
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    )..show();
  }

  Column price(BuildContext context, Size mediaQuery) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Price', style: textstyle(context)),
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              child: TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                  RegExp numeric = RegExp(r"(\w+)");
                  if (value!.isEmpty) {
                    return 'Please enter price';
                  }
                  const pattern = r'[0-9]';
                  final regExp = RegExp(pattern);

                  if (!regExp.hasMatch(value)) {
                    return "Price should be number only";
                  }

                  return null;
                },
                controller: priceController,
                decoration: inputDecorations("Price", mediaQuery),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pincode',
              style: textstyle(context),
            ),
            Container(
              width: mediaQuery.width * 0.95,
              child: TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 6,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Pincode';
                  }
                  if (value.toString().length != 6) {
                    return 'Please enter valid Pincode';
                  }
                  return null;
                },
                controller: productLocationController,
                decoration: inputDecorations("Product Location", mediaQuery),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget submitButton() {
    return InkWell(
      onTap: () async {
        // if (_imageFile != null && _globalkey.currentState.validate()) {
        //   AddBlogModel addBlogModel =
        //       AddBlogModel(body: _body.text, title: _title.text);
        //   var response = await networkHandler.post1(
        //       "/blogpost/Add", addBlogModel.toJson());
        //   print(response.body);

        //   if (response.statusCode == 200 || response.statusCode == 201) {
        //     String id = json.decode(response.body)["data"];
        //     var imageResponse = await networkHandler.patchImage(
        //         "/blogpost/add/coverImage/$id", _imageFile.path);
        //     print(imageResponse.statusCode);
        //     if (imageResponse.statusCode == 200 ||
        //         imageResponse.statusCode == 201) {
        //       Navigator.pushAndRemoveUntil(
        //           context,
        //           MaterialPageRoute(builder: (context) => HomePage()),
        //           (route) => false);
        //     }
        // }
        // }
      },
      child: Center(
        child: Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.teal),
          child: Center(
              child: Text(
            "Add Blog",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }

  ButtonStyle buttonStyle(BuildContext context) {
    return ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(8)),
        // foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        foregroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).errorColor,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(
                  width: 3,
                  color: MyColors.primaryColor,
                ))));
  }

  InputDecoration inputDecorations(String d, Size mediaquery) {
    return InputDecoration(
        hintText: d,
        hintStyle: TextStyle(fontSize: mediaquery.width * 0.04),
        border: outlineBorder(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.4), width: 1),
        ),
        focusedBorder: focusedBorder());
  }

  OutlineInputBorder focusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(color: MyColors.primaryColor, width: 2),
    );
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: MyColors.primaryColor));
  }

  TextStyle textstyle(BuildContext context) {
    return GoogleFonts.aclonica(
        // fontSize: MediaQuery.of(context).size.width * 0.045,
        // fontWeight: FontWeight.bold
        );
  }
}

class Sizedbox extends StatelessWidget {
  const Sizedbox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 30,
    );
  }
}
