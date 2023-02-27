import 'package:flutter/material.dart';
import 'package:untitled/Pages/CameraPage.dart';
import 'package:untitled/Pages/ChatPage.dart';

import '../Model/ChatModel.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key,required this.chatmodels,required this.sourchat}) : super(key: key);
  final List<ChatModel> chatmodels;
  final ChatModel sourchat;

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState(){
    super.initState();
    _controller=TabController( length:4, vsync:this,initialIndex:1);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat App"),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext contesxt) {
              return [
                PopupMenuItem(
                  child: Text("New group"),
                  value: "New group",
                ),
                PopupMenuItem(
                  child: Text("New broadcast"),
                  value: "New broadcast",
                ),
                PopupMenuItem(
                  child: Text("Starred messages"),
                  value: "Starred messages",
                ),
                PopupMenuItem(
                  child: Text("Settings"),
                  value: "Settings",
                ),
              ];
            },
          )
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "CHATS",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          CameraPage(),
          ChatPage(
            chatmodels: widget.chatmodels,
            sourchat: widget.sourchat,
          ),
          // Text("STATUS"),
          // Text("Calls"),
        ],
      ),
    );
  }
}