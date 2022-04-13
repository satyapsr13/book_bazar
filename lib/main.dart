// ignore_for_file: prefer_const_constructors
//https://picsum.photos/200/300   //  ⌘ ñ
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screens/Auth/login_screen.dart';
import 'Screens/home_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}
// command to generate keyproperties.jks
// keytool -genkey -v -keystore ~/mykey.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias androiddebugkey


 class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'homepage',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      //routes: {  targetscreen.routeName:(ctx)=>const targetscreen(),},
    );
  }
}
// Alias name: androiddebugkey
// Creation date: 12-Apr-2022
// Entry type: PrivateKeyEntry
// Certificate chain length: 1
// Certificate[1]:
// Owner: CN=satya prakash, OU=semikolan, O=semikolan, L=bhopal, ST=madhyapradesh, C=91
// Issuer: CN=satya prakash, OU=semikolan, O=semikolan, L=bhopal, ST=madhyapradesh, C=91
// Serial number: 7fa8567f81c0f5b2
// Valid from: Tue Apr 12 17:55:05 IST 2022 until: Sat Aug 28 17:55:05 IST 2049
// Certificate fingerprints:
//          SHA1: CC:66:34:A5:36:C1:1C:C4:36:79:BD:0B:56:14:AE:D6:9B:D3:7D:4A
//          SHA256: 7E:D7:8D:D6:6E:C8:8D:7D:9B:04:08:6F:E6:58:E4:9C:CE:ED:EF:7B:DF:13:16:D3:EF:69:F6:7A:64:81:C3:DB
// Signature algorithm name: SHA256withRSA
// Subject Public Key Algorithm: 2048-bit RSA key