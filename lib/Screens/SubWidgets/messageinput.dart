import 'package:flutter/material.dart';

class TextInputArea extends StatelessWidget {
  const TextInputArea({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.greenAccent,
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.mic,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          Expanded(
            child: Container(
              height: 37,
              padding: EdgeInsets.only(
                left: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(children: [
                Icon(Icons.sentiment_satisfied_alt_outlined,
                    color: Colors.black.withOpacity(0.5)),
                SizedBox(
                  width: 3,
                ),
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    cursorHeight: 20,
                    decoration: InputDecoration(
                      hintText: "Text message",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Icon(Icons.attach_file_outlined,
                    color: Colors.black.withOpacity(0.5)),
                SizedBox(
                  width: 3,
                ),
                Icon(Icons.photo_album_outlined,
                    color: Colors.black.withOpacity(0.5)),
                SizedBox(
                  width: 3,
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
