import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Splash extends StatefulWidget {
  const Splash({
    Key key,
  }) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Image.asset("assets/images/3.png"),
              Text(
                "Welcome to your Khatapp",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "This is a place where you enjoy khat with \nyour friends meet new people and have fun digitaly. ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              FittedBox(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/accounts");
                  },
                  child: Row(
                    children: [
                      Text(
                        "Skip",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
