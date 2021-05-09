import 'package:chatapp_f/Custom/contact_card_tile.dart';
import 'package:chatapp_f/Custom/new_group_contact_card_tile.dart';
import 'package:chatapp_f/Models/ChatModel.dart';
import 'package:chatapp_f/Screens/create_group.screen.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select contact",style: TextStyle(fontSize: 21,fontWeight:FontWeight.bold),),
            Text("256 contacts",style: TextStyle(fontSize: 13))

        ],),
        actions: [
            IconButton(icon:Icon(Icons.search), onPressed: (){}),
           PopupMenuButton<String>(
             
             onSelected: (value) {
               
             },
             itemBuilder: (BuildContext context){
             
             return[
               PopupMenuItem(
                
                child: Text("Invite a Friend"),
                value:"Invite a Friend",
               
               ),
               PopupMenuItem(
                child: Text("Refresh"),
                value:"Refresh",
               
               ),
              PopupMenuItem(
                child: Text(" Contact"),
                value:"Contact",
               
               ),
                PopupMenuItem(
                child: Text(" Help"),
                value:"Help",
               
               )
             ];


           })
          




      ],
      ),
      body: ListView.builder(
        itemCount: contacts.length+2,
        itemBuilder: (context, index) {
          if(index==0){
           return  InkWell
           (onTap: () {
             Navigator.push(context,MaterialPageRoute(builder: (context){
               return CreateGroup();
             }));
           },
             child: NewGroupCard(name:"New Group",icon:Icons.group)
             
             );
          }
          else if(index==1){
            return InkWell(
              onTap: (){},
              child: NewGroupCard(name:"New Contact",
             icon: Icons.person_add
              )
              );
          }
           return InkWell(
             onTap: () {
               
             },
             child: ContactTile(
               contacts[index-2]
               )
               );
        },
        

      ),
    );
  }
}