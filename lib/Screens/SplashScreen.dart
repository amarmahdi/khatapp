import 'package:flutter/material.dart';

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
      body: Container(
        child: Column(
          children: [
            Spacer(
              flex: 3,
            ),
            Image.asset("assets/images/3.png"),
            Spacer(),
            Text(
              "Welcome to your Khatapp",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(
              flex: 3,
            ),
            Text(
              "This is a place where you enjoy khat with \nyour friends meet new people and have fun digitaly. ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            Spacer(
              flex: 3,
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
    );
  }
}
