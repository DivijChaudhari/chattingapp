import 'package:flutter/material.dart';
import 'package:untitled/CustomUI/AvtarCard.dart';
import 'package:untitled/CustomUI/ButtonCard.dart';
import 'package:untitled/CustomUI/ContactCard.dart';
import 'package:untitled/Model/ChatModel.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts=[
    ChatModel(name: "Divij Chaudhari", status: "status"),
    ChatModel(name: "user 1", status: "status"),
    ChatModel(name: "user 2", status: "status"),
    ChatModel(name: "user 3", status: "status"),
  ];
  List<ChatModel> groups=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("New Group"),
              Text("Add Participants",style: TextStyle(
                fontSize: 13,
              ),)
            ],
          ),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 26,)),
          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: contacts.length+1,
              itemBuilder: (context,index){
                if(index==0){
                  return Container(
                    height: groups.length>0 ? 90:10,
                  );
                }
                return InkWell(
                    onTap: (){
                      if(contacts[index-1].select==false){
                        setState(() {
                           contacts[index-1].select=true;
                           groups.add(contacts[index-1]);
                        });
                      }
                      else{
                        setState(() {
                          contacts[index-1].select=false;
                          groups.remove(contacts[index-1]);
                        });
                      }
                    },
                    child: ContactCard(contact: contacts[index-1],));
              },),
            groups.length>0 ?
            Column(
              children: [
                Container(
                  height: 75,
                  color: Colors.white,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: contacts.length,
                    itemBuilder: (context,index) {
                      if(contacts[index].select==true){
                        return InkWell(
                            onTap: (){
                              setState(() {
                                contacts[index].select=false;
                                groups.remove(contacts[index-1]);
                              });
                            },
                            child: AvtarCard(contact: contacts[index]));
                      }
                      else{
                        return Container();
                      }
                    }
                  ),
                ),
                Divider(
                  thickness: 1,
                )
              ],
            ): Container(),
          ],
        )
    );
  }
}
