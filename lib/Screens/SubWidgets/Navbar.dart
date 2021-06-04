import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    Key key,
    this.tilte,
    this.actionIcon,
    this.pic,
  }) : super(key: key);

  final tilte;
  final bool actionIcon;
  final pic;

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    var iconIdentifyer = (bool isPageMess) {
      if (isPageMess == true) {
        print(true);
        return Row(
          children: [
            IconButton(icon: Icon(Icons.call), onPressed: () {}),
            IconButton(icon: Icon(Icons.video_call), onPressed: () {})
          ],
        );
      } else {
        print(false);
        return IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        );
      }
    };

    var titleIdentifyer = (bool isPageMess) {
      if (isPageMess == true) {
        return Row(
          children: [
            CircleAvatar(
              maxRadius: 24,
              backgroundImage: AssetImage(widget.pic),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.tilte),
                Text(
                  "Online",
                  style: TextStyle(fontSize: 17),
                )
              ],
            ),
          ],
        );
      } else {
        return Text(
          widget.tilte,
          style: TextStyle(
            fontSize: 30,
          ),
        );
      }
    };

    return AppBar(
      backgroundColor: Colors.greenAccent,
      title: titleIdentifyer(widget.actionIcon),
      automaticallyImplyLeading: widget.actionIcon,
      elevation: 0,
      actions: [
        iconIdentifyer(widget.actionIcon),
      ],
    );
  }
}
