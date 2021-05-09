import 'package:chatapp_f/Custom/new_group_contact_card_tile.dart';
import 'package:chatapp_f/Models/ChatModel.dart';
import 'package:chatapp_f/Screens/homescreen.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ChatModel sourceChat;

 List<ChatModel> chatmodel=[
    ChatModel(
      id:1,
      name:"Shan",
      isGroup:false,
      currentMessage: "hey boy",
      time:"19.00",
      icon:"person.svg"

    ),
     ChatModel(
       id:2,
      name:"Abhi",
      isGroup:false,
      currentMessage: "hey nigga",
      time:"9.00",
      icon:"person.svg"

    ),
     ChatModel(
       id:4,
      name:"Amey",
      isGroup:false,
      currentMessage: "who let the dogs out?",
      time:"2.00",
      icon:"person.svg"

    )

,
 ChatModel(
   id:5,
      name:"Omkar",
      isGroup:false,
      currentMessage: "Tunzerrr",
      time:"8.00",
      icon:"person.svg"

    ),


 ChatModel(
      id:6,
      name:"Sachin",
      isGroup:false,
      currentMessage: "Akchuuuu",
      time:"17.00",
      icon:"person.svg"

    ),






  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatmodel.length,
        itemBuilder:(context,index)=>InkWell(
          onTap: (){
            sourceChat=chatmodel.removeAt(index);
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (builder)=>HomeScreen(this.chatmodel,this.sourceChat)));
          },
          child: NewGroupCard(name:chatmodel[index].name, icon:Icons.person)), 
      ),

    );
  }
}