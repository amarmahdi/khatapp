import 'package:khatapp/Screens/SubWidgets/Navbar.dart';
import 'package:khatapp/Screens/SubWidgets/messageList.dart';
import 'package:khatapp/Screens/listOfAccounts.dart';
import 'package:flutter/material.dart';

import 'SubWidgets/messageinput.dart';

class Message extends StatefulWidget {
  const Message({Key key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    String username = accounts[0]['username'];
    var some = ChatMessageList[0].text;
    print(some);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: NavBar(
          tilte: "$username",
          actionIcon: true,
          pic: accounts[0]['pic'],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: ChatMessageList.length,
                itemBuilder: (BuildContext context, index) => MessagesList(
                  message: ChatMessageList[index],
                ),
              ),
            ),
            TextInputArea(),
          ],
        ),
      ),
    );
  }
}

class MessagesList extends StatefulWidget {
  const MessagesList({
    Key key,
    this.message,
  }) : super(key: key);

  final message;

  @override
  _MessagesListState createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  @override
  Widget build(BuildContext context) {
    var wid = MediaQuery.of(context).size.width;
    var avController = (isSenderIdentifier) {
      if (!isSenderIdentifier) {
        return CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage("assets/images/4.jpg"),
        );
      } else {
        return SizedBox(
          width: 1,
        );
      }
    };
    var check = (isSenderIdentifier) {
      if (!isSenderIdentifier) {
        return SizedBox(
          width: 1,
        );
      } else {
        return Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(5))),
        );
      }
    };
    return Container(
      width: wid - 30,
      margin: EdgeInsets.only(top: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: widget.message.isSender
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          avController(widget.message.isSender),
          Container(
            margin: EdgeInsets.only(left: 5, right: 5),
            child: Container(
              width: wid / 1.5,
              decoration: BoxDecoration(
                color:
                    widget.message.isSender ? Colors.green : Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                widget.message.text,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: check(widget.message.isSender),
          )
        ],
      ),
    );
  }
}
