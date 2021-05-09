import 'package:chatapp_f/Custom/contact_card_tile.dart';
import 'package:chatapp_f/Custom/groupselected_avatar.dart';

import 'package:chatapp_f/Models/ChatModel.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
final List<ChatModel> contacts=[
  ChatModel(name: "Abhishek", status: "Dentist Nigaa "),
    ChatModel(name: "Sachin", status: "Nusta Akchuuu"),
    ChatModel(name: "Amey", status: "When you will be chasing pokemons ,Ill be chasing money"),
    ChatModel(name: "Omkar", status: "One Nation ,One Tax"),
    ChatModel(name: "Hemant", status: "Thank god for Fingers"),
    ChatModel(name: "Macho Man", status: "One Earth ,One Srishti"),
    ChatModel(name: "Roshan", status: "Roll no 42"),
    ChatModel(name: "Nutt", status: "Ohaiyooo"),
    ChatModel(name: "Prasanna", status: "blink blink "),


  
  ];
final List<ChatModel> group=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("New Group",style: TextStyle(fontSize: 21,fontWeight:FontWeight.bold),),
            Text("Add participants",style: TextStyle(fontSize: 13))

        ],),
        actions: [
            IconButton(icon:Icon(Icons.search), onPressed: (){}),
           


      ],
      ),
      body: Stack(
              children:[ ListView.builder(
          itemCount: contacts.length+1,
          itemBuilder: (context, index) {
            if(index==0){
              return Container(
                height: group.length>0?90:10,
              );
            }
            
             return InkWell
             (
               onTap: () {
                 if(contacts[index-1].select==false){
                   setState(() {
                     contacts[index-1].select=true;
                     group.add(contacts[index-1]);
                   }
                   );
                 }
                 else if(contacts[index-1].select==true)
                 {setState(() {
                    contacts[index-1].select=false;
                    group.remove(contacts[index-1]);
                 });
                  
                 }
                 
               },
               child: ContactTile(
               contacts[index-1]
               )
               );
          },
          

        ),
      group.length>0?  Column(
          children: [

            Container(
              height:75,
              color: Colors.white,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: contacts.length,
                itemBuilder: (context,index){
                  if(contacts[index].select==true){
                    return InkWell(
                      onTap: () {
                        setState(() {
                          contacts[index].select=false;
                         group.remove(contacts[index]);
                        });
                         
                      },
                      child: AvatarGroup(contact:contacts[index]));
                  }
                  else{
                    return Container();
                  }
                  

              }),

            ),
            Divider(
              thickness:1
            )
          ],


        ):Container()
              ]),
    );
  }
}