import 'package:khatapp/Screens/listOfAccounts.dart';
import 'package:flutter/material.dart';
import 'package:khatapp/constants.dart';
import 'package:provider/provider.dart';
import 'SubWidgets/Navbar.dart';
import 'SubWidgets/UserListWidgets.dart';
import './../services/authService.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key key}) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    Account user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: NavBar(
          tilte: "Khat Room",
          actionIcon: false,
        ),
      ),
      floatingActionButton: Container(
        width: width(context) - 150,
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.person_add_outlined),
          backgroundColor: Colors.greenAccent,
          isExtended: true,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.call),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              SideList(),
              Container(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: accounts.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      child: ListButtonWidget(
                        wid: width(context),
                        pic: accounts[index]["pic"],
                        username: user.email,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SideList extends StatelessWidget {
  const SideList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.greenAccent,
      child: Row(
        children: [
          OutlinedButton(
            onPressed: () {},
            child: Text(
              "Recent Messages",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))))),
          ),
          SizedBox(
            width: 20,
          ),
          OutlinedButton(
            onPressed: () {},
            child: Text(
              "Active",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))))),
          ),
        ],
      ),
    );
  }
}
