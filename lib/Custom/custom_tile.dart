import 'package:chatapp_f/Models/ChatModel.dart';
import 'package:chatapp_f/Pages/individual_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTile extends StatefulWidget {
  final ChatModel chat;
  final ChatModel sourcechat;
  const CustomTile(this.chat,this.sourcechat);
  @override
  _CustomTileState createState() => _CustomTileState();
}

class _CustomTileState extends State<CustomTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>IndividualPage(widget.chat,widget.sourcechat)));
              },
                  child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(radius: 35,
                    child: SvgPicture.asset(widget.chat.isGroup?'assets/group.svg':'assets/person.svg',
                    color: Colors.white,
                    height: 35,
                    width: 35,),
                    backgroundColor: Colors.blueGrey,      
                    ),
                    trailing: Text(widget.chat.time),
                    title: Text(widget.chat.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    subtitle: Row(
                      children: [
                        Icon(Icons.done_all_sharp),
                        SizedBox(width:3),
                        Text(widget.chat.currentMessage,
                        style: TextStyle(
                          fontSize: 13,
        
                         ),
                        
                        
                        )
        
                    ],
                    ),
        
        
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:20,left:80),
                    child: Divider(thickness:1),
                  )
                ],
              ),
            );
          }
        }
        

