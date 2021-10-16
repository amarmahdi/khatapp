import 'package:flutter/services.dart';
import 'package:khatapp/Screens/LoginScreen.dart';
import 'package:khatapp/Screens/SignupScreen.dart';
import 'package:khatapp/Screens/SplashScreen.dart';
import 'package:khatapp/Screens/accounts.dart';
import 'package:khatapp/Screens/chatlist.dart';
import 'package:khatapp/Screens/messageScreen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      backgroundColor: Colors.black,
      fontFamily: "Pakenham",
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => Splash(),
      '/accounts': (context) => LoginOrSignup(),
      '/chatlist': (context) => ChatList(),
      '/message': (context) => Message(),
      '/login': (context) => LoginScreen(),
      '/register': (context) => SignupScreen()
    },
  ));
  SystemChrome.setEnabledSystemUIOverlays([]);
}
