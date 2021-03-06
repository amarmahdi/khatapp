import 'package:flutter/services.dart';
import 'package:khatapp/Screens/LoginScreen.dart';
import 'package:khatapp/Screens/SignupScreen.dart';
import 'package:khatapp/Screens/SplashScreen.dart';
import 'package:khatapp/Screens/accounts.dart';
import 'package:khatapp/Screens/chatlist.dart';
import 'package:khatapp/Screens/messageScreen.dart';
import 'package:flutter/material.dart';
import 'package:khatapp/services/authService.dart';
import 'package:khatapp/services/shared_preferences.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([]);
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: Colors.black,
          fontFamily: "Pakenham",
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Check(),
          '/accounts': (context) => LoginOrSignup(),
          '/chatlist': (context) => ChatList(),
          '/message': (context) => Message(),
          '/login': (context) => LoginScreen(),
          '/signup': (context) => SignupScreen()
        },
      ),
    );
  }
}

class Check extends StatefulWidget {
  const Check({Key key}) : super(key: key);

  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
  @override
  Widget build(BuildContext context) {
    Account user = Provider.of<UserProvider>(context).user;
    return user.userId != null ? ChatList() : Splash();
  }
}
