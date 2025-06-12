import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import "dart:ui";
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Main(),
  ));
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFFFEBD0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Chat-App",
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF278783),
            letterSpacing: 2.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(4),
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: Color(0xFF278783),
              ),
              onPressed: () {
                print("searching i will add soon..");
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Navi(),
          Expanded(child: ChatList()), // Adding chat list here
        ],
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  final List<Message> messages = [
    Message(name: "Hamza salman", time: "12:23", text: "Hey! Are you free to work later?", unread: 2),
    Message(name: "Ali murtaza", time: "11:43", text: "Hey! Are you free to work later?"),
    Message(name: "Ahmad Miraj", time: "11:24", text: "Hey! Are you free to work later?"),
    Message(name: "Salman", time: "09:23", text: "Hey! Are you free to work later?"),
    Message(name: "Mama", time: "20:32", text: "Hey! Are you free to work later?"),
    Message(name: "Papa", time: "12:23", text: "Hey! Are you free to work later?"),
  ];

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyScrollBehavior(),
      child: SingleChildScrollView(
        child: Column(
          children: messages.map((message) => ChatItem(message: message)).toList(),
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final Message message;

  ChatItem({required this.message});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      title: Text(message.name, style: TextStyle(color:Color.fromARGB(255, 5, 121, 115),fontWeight: FontWeight.bold)),
      subtitle: Text(message.text,style:TextStyle(color:Color(0xFF278783),)),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message.time,style:TextStyle(color:Color(0xFF278783)),),
          if (message.unread != null)
            CircleAvatar(
              radius: 10,
              backgroundColor: Color(0xFF278783),
              child: Text('${message.unread}', style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
        ],
      ),
    );
  }
}

// Message model
class Message {
  final String name;
  final String time;
  final String text;
  final int? unread;

  Message({
    required this.name,
    required this.time,
    required this.text,
    this.unread,
  });
}

class Navi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 95,
        child: ScrollConfiguration(
          behavior: MyScrollBehavior(),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(5, (index) {
                return Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 10 : 5, right: 5),
                  child: NavBox(index: index),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class NavBox extends StatefulWidget {
  final int index;
  NavBox({required this.index});

  @override
  _NavBoxState createState() => _NavBoxState();
}

class _NavBoxState extends State<NavBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              switch (widget.index) {
                case 0:
                  return DetailPage1();
                case 1:
                  return DetailPage2();
                case 2:
                  return DetailPage3();
                case 3:
                  return DetailPage4();
                case 4:
                  return DetailPage5();
                default:
                  return Scaffold(
                    body: Center(child: Text("Page not found")),
                  );
              }
            },
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 120,
            height: 85,
            decoration: BoxDecoration(
              color: Color(0xFF278783),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: getBoxDesign(widget.index)),
          ),
        ],
      ),
    );
  }
}

Widget getBoxDesign(int index) {
  switch (index) {
    case 0:
      return _boxdesign1();
    case 1:
      return _boxdesign2();
    case 2:
      return _boxdesign3();
    case 3:
      return _boxdesign4();
    case 4:
      return _boxdesign5();
    default:
      return Text("Unknown");
  }
}

Widget _boxdesign1() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 10),
      Padding(
        padding: EdgeInsets.only(right: 50),
        child: Icon(Icons.person, color:  Color(0xFFFFEBD0),),
      ),
      Padding(
        padding: EdgeInsets.only(right: 20),
        child: Text("Find People", style: TextStyle(fontSize: 13, color:  Color(0xFFFFEBD0)),),
      ),
    ],
  );
}

Widget _boxdesign2() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 10),
      Padding(
        padding: EdgeInsets.only(right: 50),
        child: Icon(Icons.email, color:  Color(0xFFFFEBD0), size: 35),
      ),
      Padding(
        padding: EdgeInsets.only(right: 20),
        child: Text("Invite Friends", style: TextStyle(fontSize: 13, color: Color(0xFFFFEBD0)),),
      ),
    ],
  );
}

Widget _boxdesign3() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 10),
      Padding(
        padding: EdgeInsets.only(right: 50),
        child: Icon(Icons.people, color:  Color(0xFFFFEBD0), size: 35),
      ),
      Padding(
        padding: EdgeInsets.only(right: 20),
        child: Text("Join Group", style: TextStyle(fontSize: 13, color: Color(0xFFFFEBD0))),
      ),
    ],
  );
}

Widget _boxdesign4() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 10),
      Padding(
        padding: EdgeInsets.only(right: 50),
        child: Icon(Icons.settings, color: Color(0xFFFFEBD0), size: 35),
      ),
      Padding(
        padding: EdgeInsets.only(right: 20),
        child: Text("Settings", style: TextStyle(fontSize: 13, color: Color(0xFFFFEBD0),)),
      ),
    ],
  );
}

Widget _boxdesign5() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 10),
      Padding(
        padding: EdgeInsets.only(right: 50),
        child: Icon(Icons.help, color:  Color(0xFFFFEBD0), size: 35),
      ),
      Padding(
        padding: EdgeInsets.only(right: 20),
        child: Text("Need Help", style: TextStyle(fontSize: 13, color:  Color(0xFFFFEBD0))),
      ),
    ],
  );
}

class DetailPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.transparent, title: Text("Box 1")),
      body: Column(
        children: [
          Text("Box 1 Detail"),
        ],
      ),
    );
  }
}

class DetailPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.transparent, title: Text("Box 2")),
      body: Column(
        children: [
          Text("Box 2 Detail"),
        ],
      ),
    );
  }
}

class DetailPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.transparent, title: Text("Box 3")),
      body: Column(
        children: [
          Text("Box 3 Detail"),
        ],
      ),
    );
  }
}

class DetailPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.transparent, title: Text("Box 4")),
      body: Column(
        children: [
          Text("Box 4 Detail"),
        ],
      ),
    );
  }
}

class DetailPage5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.transparent, title: Text("Box 5")),
      body: Column(
        children: [
          Text("Box 5 Detail"),
        ],
      ),
    );
  }
}

class MyScrollBehavior extends ScrollBehavior {
  @override
  Widget buildScrollbar(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}