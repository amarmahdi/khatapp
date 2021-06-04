import 'package:khatapp/Screens/SplashScreen.dart';
import 'package:khatapp/Screens/accounts.dart';
import 'package:khatapp/Screens/chatlist.dart';
import 'package:khatapp/Screens/messageScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      backgroundColor: Colors.black,
      fontFamily: "Pakenham",
    ),
    // home: Splash(),
    initialRoute: '/',
    routes: {
      '/': (context) => Splash(),
      '/accounts': (context) => LoginOrSignup(),
      '/chatlist': (context) => ChatList(),
      '/message': (context) => Message(),
    },
  ));
}
