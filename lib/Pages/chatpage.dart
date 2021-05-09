


import 'package:chatapp_f/Custom/custom_tile.dart';
import 'package:chatapp_f/Models/ChatModel.dart';
import 'package:chatapp_f/Screens/select_contact.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final List<ChatModel>chatmodel;
  final ChatModel sourcechat;
  ChatPage(this.chatmodel,this.sourcechat);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton( 
        onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactCard()));
        },
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: widget.chatmodel.length,
        itemBuilder: (context,index)=>CustomTile(
          widget.chatmodel[index],widget.sourcechat)

          )

    );
  }
}