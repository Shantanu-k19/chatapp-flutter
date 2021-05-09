import 'package:chatapp_f/Models/ChatModel.dart';
import 'package:chatapp_f/Pages/chatpage.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  final List<ChatModel> chatmodel;
  final ChatModel sourcechat;
  HomeScreen(this.chatmodel,this.sourcechat);
  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  TabController _controller;
  void initState(){
    super.initState();
    _controller=TabController(length: 3, vsync: this,initialIndex: 0);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon:Icon(Icons.search), onPressed: (){}),
           PopupMenuButton<String>(
             
             onSelected: (value) {
               
             },
             itemBuilder: (BuildContext context){
             
             return[
               PopupMenuItem(
                
                child: Text("New group"),
                value:"New group",
               
               ),
               PopupMenuItem(
                child: Text("Update"),
                value:"Update",
               
               ),
              PopupMenuItem(
                child: Text("Settings"),
                value:"Settings",
               
               )
             ];


           })
          
          
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            controller: _controller,
            tabs: [
              Tab(icon: Icon(Icons.camera_alt),),
              Tab(text: "Chat"),

              Tab(text: "Game",),
             


            ],
          ),



        title: Text("PlayChat"),),

        body: TabBarView(
          controller: _controller,
          children: [
            Text("camera"),
            ChatPage(widget.chatmodel,widget.sourcechat),
            Text("Play")
          ],
        ),
    );
  }
}