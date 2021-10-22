import 'dart:developer';
import 'package:flutter/material.dart';
import '../constants.dart';

class LoginOrSignup extends StatefulWidget {
  const LoginOrSignup({Key key}) : super(key: key);

  @override
  _LoginOrSignupState createState() => _LoginOrSignupState();
}

class _LoginOrSignupState extends State<LoginOrSignup> {
  @override
  Widget build(BuildContext context) {
    int numb = 0;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/2.png",
                height: height(context) / 3,
              ),
              Text(
                "KhatApp",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.7)),
              ),
              SizedBox(
                height: 45,
              ),
              Container(
                width: width(context) / 1.25,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/login");
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: width(context) / 1.25,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/signup");
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  print(
                      'i am clicked $numb ${numb == 1 || numb == 0 ? 'time' : 'times'}');
                  numb++;
                },
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        child: Image.asset("assets/images/g3.png"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Login with google",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
