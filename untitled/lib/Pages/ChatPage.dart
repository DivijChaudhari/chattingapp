import 'package:flutter/material.dart';
import 'package:untitled/CustomUI/CustomCard.dart';
import 'package:untitled/Model/ChatModel.dart';
import 'package:untitled/Screens/SelectContact.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key,required this.chatmodels,required this.sourchat}) : super(key: key);
  final List<ChatModel> chatmodels;
  final ChatModel sourchat;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats=[
    ChatModel(
        name: 'name',
        icon: 'person.svg',
        isGroup: false,
        time: '4:00',
        currentMessage: 'message',
    ),
    ChatModel(
        name: 'name 2',
        icon: 'person.svg',
        isGroup: false,
        time: '5:00',
        currentMessage: 'message'),
    ChatModel(
        name: 'group',
        icon: 'group.svg',
        isGroup: true,
        time: '5:09',
        currentMessage: 'message'),
    ChatModel(
        name: 'name 3',
        icon: 'person.svg',
        isGroup: false,
        time: '6:00',
        currentMessage: 'message'),
    ChatModel(
        name: 'group 2',
        icon: 'group.svg',
        isGroup: true,
        time: '7:00',
        currentMessage: 'message')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => SelectContact()));
        },
        child: Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: widget.chatmodels.length,
        itemBuilder: (contex, index) => CustomCard(
          chatModel: widget.chatmodels[index],
          sourchat: widget.sourchat,
        ),
      ),
    );
  }
}