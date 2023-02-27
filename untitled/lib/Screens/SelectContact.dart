import 'package:flutter/material.dart';
import 'package:untitled/CustomUI/ButtonCard.dart';
import 'package:untitled/CustomUI/ContactCard.dart';
import 'package:untitled/Model/ChatModel.dart';
import 'package:untitled/Screens/CreateGroup.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts=[
      ChatModel(name: "Divij Chaudhari", status: "status"),
      ChatModel(name: "user 1", status: "status"),
      ChatModel(name: "user 2", status: "status"),
      ChatModel(name: "user 3", status: "status"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Contact"),
            Text("265 Contacts",style: TextStyle(
              fontSize: 13,
            ),)
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 26,)),
          PopupMenuButton<String>(
              onSelected:(value){
                print(value);
              } ,
              itemBuilder: (BuildContext context){
                return[
                  PopupMenuItem(child: Text("Invite a Friend"),value: "Invite a Friend",),
                  PopupMenuItem(child: Text("Contacts"),value: "Contacts",),
                  PopupMenuItem(child: Text("Refresh"),value: "Refresh",),
                  PopupMenuItem(child: Text("Help"),value: "Help",),
                ];
              })
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length+2,
          itemBuilder: (context,index){
          if(index==0){
            return InkWell(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (builder)=>CreateGroup()));},
                child: ButtonCard(name: "New Group",icon: Icons.group,));
          }
          else if(index==1){
            return ButtonCard(name: "New Contact",icon: Icons.person_add,);
          }
          return ContactCard(contact: contacts[index-2],);
          },)
    );
  }
}
