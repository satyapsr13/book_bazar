// ignore_for_file: prefer_const_constructors

import 'package:book_bazar/Constants/colors.dart';
import 'package:book_bazar/Provider/user_provider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawer2State createState() => _MyDrawer2State();
}

class _MyDrawer2State extends State<MyDrawer> {
  // bool _isupdate = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserProvider>(context, listen: false).loadUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: MyColors.primaryColor,
            ),
            child: Row(
              children: [
                ExtendedImage.network(
                  Provider.of<UserProvider>(context).image,
                  fit: BoxFit.cover,
                  cache: true,
                  height: 50,
                  width: 50,
                  // border: Border.all(color: Colors.red, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  //cancelToken: cancellationToken,
                ),
                Spacer(
                  flex: 2,
                ),
                Text(
                  Provider.of<UserProvider>(context).email,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Spacer(
                  flex: 6,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Column(
            children: [
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Icon(
                    Icons.book,
                  ),
                  title: Text(
                    'Pdf Viewer',
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                    leading: Icon(
                      Icons.loop,
                    ),
                    title: Text(
                      'Updates',
                    ),
                    trailing: Icon(
                      Icons.arrow_circle_down_outlined,
                      // size: 20,
                    )),
              ),
              InkWell(
                onTap: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text(
                        'Are you sure you want to logout ?',
                      ),
                      // content: Text(
                      //   '     ',
                      // ),
                      actions: <Widget>[
                        TextButton(
                          child: Text(
                            'No',
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: Text(
                            ' Yes',
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  );
                },
                child: ListTile(
                  leading: Icon(
                    Icons.power_settings_new,
                  ),
                  title: Text(
                    'Logout',
                  ),
                ),
              ),
              // ignore: prefer_const_constructors
              InkWell(
                // ignore: prefer_const_constructors
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                  ),
                  title: Text(
                    'Help & Support',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
