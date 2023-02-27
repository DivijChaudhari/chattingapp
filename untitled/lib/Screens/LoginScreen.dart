import 'package:flutter/material.dart';

import '../CustomUI/ButtonCard.dart';
import '../Model/ChatModel.dart';
import 'Homescreen.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ChatModel sourceChat;
  List<ChatModel> chatmodels = [
    ChatModel(
      name: "Divij",
      isGroup: false,
      currentMessage: "Hi Everyone",
      time: "4:00",
      icon: "person.svg",
      id: 1,
    ),
    ChatModel(
      name: "user1",
      isGroup: false,
      currentMessage: "user1",
      time: "13:00",
      icon: "person.svg",
      id: 2,
    ),

    ChatModel(
      name: "user2",
      isGroup: false,
      currentMessage: "Hi Divij",
      time: "8:00",
      icon: "person.svg",
      id: 3,
    ),

    ChatModel(
      name: "user3",
      isGroup: false,
      currentMessage: "Hi Divij",
      time: "2:00",
      icon: "person.svg",
      id: 4,
    ),

    // ChatModel(
    //   name: "NodeJs Group",
    //   isGroup: true,
    //   currentMessage: "New NodejS Post",
    //   time: "2:00",
    //   icon: "group.svg",
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chatmodels.length,
          itemBuilder: (contex, index) => InkWell(
            onTap: () {
              sourceChat = chatmodels.removeAt(index);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => Homescreen(
                        chatmodels: chatmodels,
                        sourchat: sourceChat,
                      )));
            },
            child: ButtonCard(
              name: chatmodels[index].name,
              icon: Icons.person,
            ),
          )),
    );
  }
}