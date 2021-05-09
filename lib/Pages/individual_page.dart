import 'package:chatapp_f/Custom/message_card.dart';
import 'package:chatapp_f/Custom/reply_card.dart';
import 'package:chatapp_f/Models/ChatModel.dart';
import 'package:chatapp_f/Models/Message.dart';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualPage extends StatefulWidget {
 final ChatModel chat;
 final ChatModel sourcechat;
  const IndividualPage(this.chat,this.sourcechat); 

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show=false;
  FocusNode focusNode=FocusNode();
TextEditingController _controller=TextEditingController();
bool showsendButton=false;
List<Message> messages=[];
IO.Socket socket;


  @override
  void initState() {
  
    super.initState();
    connect();
    focusNode.addListener((){
      if(focusNode.hasFocus)
      {
        show=false;

      }

    });
  }

@override
  void dispose() {
    
    super.dispose();
    disconnect();
    socket.disconnect();
  }
  


void connect(){

  socket=IO.io('http://192.168.1.206:5001',<String,dynamic>{

    "transports":["websocket"],
    "autoConnect":false,
    "forceNew":true 

  });
  socket.connect();

  socket.onConnect((data) {
print("Connected");
socket.on("message", (msg){
if(widget.chat.id==msg["sourceId"]){
setMessage("Destination",msg["message"]);
}
});

  } );
  socket.emit("/signin",widget.sourcechat.id);
}

void sendMessage(String message,int sourceId ,int targetId){

socket.emit("message",{"message":message, "sourceId":sourceId,"targetId":targetId});
setMessage("Source", message);
}

void setMessage(String type,String message){
  Message messageModel=Message(modelMessage: message,modelType: type);

 
     setState(() {
    messages.add(messageModel);
  });
  
 

}

void disconnect(){
  socket.emit("signout",widget.sourcechat.id);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
      
        leadingWidth: 70,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Row(
            children: [
              Icon(Icons.arrow_back,
              size:24),
              CircleAvatar(radius: 20,
                    child: SvgPicture.asset(widget.chat.isGroup?'assets/group.svg':'assets/person.svg',
                    color: Colors.white,
                    height: 35,
                    width: 35,),
                    backgroundColor: Colors.blueGrey,      
                    )

          ],),
        ),
        title: InkWell(
          onTap: () {
            
          },
                  child: Container(
            margin: EdgeInsets.all(3),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.chat.name,
                style: TextStyle(
                  fontSize: 18.5,
                  fontWeight: FontWeight.bold


                 ),
                 ),
                 Text(
                   "last seen 5:00pm",
                   style: TextStyle(
                     fontSize: 13,

                   ),

                 )


            ],),
          ),
        ),
        actions: [
          IconButton(icon:Icon(Icons.videocam),onPressed: (){},),
          IconButton(icon:Icon(Icons.call),onPressed: (){},),
           PopupMenuButton<String>(
             
             onSelected: (value) {
               
             },
             itemBuilder: (BuildContext context){
             
             return[
               PopupMenuItem(
                
                child: Text("View Contact"),
                value:"View Contact",
               
               ),
               PopupMenuItem(
                child: Text("Media,links,and docs"),
                value:"Media,links,and docs",
               
               ),
              PopupMenuItem(
                child: Text("Search"),
                value:"Search",
               
               ),
                PopupMenuItem(
                child: Text("Mute Notifications"),
                value:"Mute Notifications",
               
               ),
                PopupMenuItem(
                child: Text("Wallpaper"),
                value:"Wallpaper",
               
               ),
                PopupMenuItem(
                child: Text("More"),
                value:"More",
               
               ),
             ];


           })



        ],),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child:WillPopScope(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height-140,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      if(messages[index].modelType=="Source"){
                        return MessageCard(messages[index].modelMessage);
                      }
                      else{
                        return ReplyCard(messages[index].modelMessage);
                      }
                    },
                    
                  ),
                ),
                Align(
                 alignment: Alignment.bottomCenter,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     Row(children: [
                       Container(
                        width:MediaQuery.of(context).size.width-60,
                       child: Card(
                         margin: EdgeInsets.only(left:2,right:2,bottom:8),
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(25)
                         ),
                         child: TextFormField(
                           
                           controller: _controller,
                           focusNode: focusNode,
                           textAlignVertical: TextAlignVertical.center,
                           keyboardType: TextInputType.multiline,
                           maxLines: 5,
                           minLines: 1,
                           onChanged: (value){
                             if(value.isNotEmpty)
                             {
                               setState(() {
                                 showsendButton=true;
                               }
                               
                               );
                             }
                             else{
                               setState(() {
                                 showsendButton=false;
                               });
                             }

                           },
                           decoration: InputDecoration(
                             border: InputBorder.none,
                             hintText: "start typing here....",
                             prefixIcon: IconButton(icon: Icon(Icons.emoji_emotions),onPressed: (){
                               focusNode.unfocus();
                               focusNode.canRequestFocus=false;
                               setState(() {
                                 show=!show;
                               });

                             },),
                             contentPadding: EdgeInsets.all(5),
                             suffixIcon: Row(
                               mainAxisSize: MainAxisSize.min,
                               children:
                             [
                               IconButton(icon: Icon(Icons.attach_file),
                               onPressed: (){
                                  focusNode.unfocus();
                               focusNode.canRequestFocus=false;
                                  showModalBottomSheet(backgroundColor: Colors.transparent,context: context, builder: (builder)=>bottomsheet());
                               },
                               ),
                               IconButton(icon: Icon(Icons.camera),
                               onPressed: (){
                                
                               },
                               )
                               
                               
                            ]
                            )


                           ),


                         ),
                       ),

                       ),
                       Padding(
                         padding: const EdgeInsets.only(bottom:8.0 ,right: 5 ,left: 2),
                         child: CircleAvatar(
                           radius: 25,
                           backgroundColor: Color(0xFF128C7E),
                           child: IconButton(icon: Icon(showsendButton? Icons.double_arrow:Icons.mic,
                           color: Colors.white,),
                           onPressed: (){
                             if(showsendButton==true){
                             sendMessage(this._controller.text,widget.sourcechat.id, widget.chat.id);
                             this._controller.clear();
                             }
                           },),
                           
                         ),
                       )

                     ],
                     ),
                    show? emojiSelect():Container()
                   ],
                 ),


                )
              ],
            ),
            onWillPop: (){
              if(show){
                setState(() {
                  show=false;
                }); 
              }
              else{
                Navigator.pop(context);
              }
              return Future.value(false);
            },
          ) ,
        ),


    );
  }

  Widget bottomsheet(){
    return Container(
      
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Column(
            children: [
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconcreation("Document",Icons.file_copy,Colors.indigo),
                SizedBox(width:40),
                iconcreation("Document",Icons.camera,Colors.pink),SizedBox(width:40),
                iconcreation("Document",Icons.insert_photo,Colors.purple)
            ],
            ),
            SizedBox(height:40),
              Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconcreation("Audio",Icons.headset,Colors.orange),
                SizedBox(width:40),
                iconcreation("Location",Icons.location_pin,Colors.green),SizedBox(width:40),
                iconcreation("Contact",Icons.person,Colors.blue)
            ],
            )
    
          ],
          ),
        ),

      ),
    );
  }

  Widget iconcreation( String text,IconData icon,Color color){
    return InkWell(
      onTap: (){},
          child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child:Icon(icon,color: Colors.white,size: 29,)
            
            ),
            SizedBox(height:5),
            Text(text)
        ],),
    );
  }

  Widget emojiSelect(){
    return EmojiPicker(
      rows: 4,
      columns: 7,
      onEmojiSelected: (emoji,category){
      setState(() {
        _controller.text=_controller.text + emoji.emoji;
      });
    });
  }
}