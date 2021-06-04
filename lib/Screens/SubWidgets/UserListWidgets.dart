import 'package:flutter/material.dart';

class ListButtonWidget extends StatelessWidget {
  const ListButtonWidget({
    Key key,
    @required this.wid,
    this.pic,
    this.username,
  }) : super(key: key);

  final String username;
  final String pic;
  final double wid;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, "/message");
      },
      child: UserListBuilder(
        wid: wid,
        pic: pic,
        username: username,
      ),
    );
  }
}

class UserListBuilder extends StatelessWidget {
  const UserListBuilder({
    Key key,
    @required this.wid,
    this.username,
    this.pic,
  }) : super(key: key);

  final double wid;
  final username;
  final String pic;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          children: [
            CircleAvatar(
              maxRadius: 24,
              backgroundImage: AssetImage(pic),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 5, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "something something something something something",
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Text("Last seen"),
                  Text("01:30"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
