import 'package:chatapp_f/Models/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AvatarGroup extends StatelessWidget {
 final ChatModel contact;
  AvatarGroup({this.contact});
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(vertical:2,horizontal:8),
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        Stack(
                      children: [CircleAvatar(
      radius: 23,
      child: SvgPicture.asset("assets/person.svg",
      height:30 ,
      width: 30,
      color: Colors.white,
      
      
       ),
       backgroundColor: Colors.blueGrey[200],
      ),
      
      Positioned(
            right: 0,
            bottom: 0,
              child: CircleAvatar(
            radius: 10,
            child: Icon(Icons.clear,color: Colors.white,size: 13,),
            backgroundColor: Colors.grey,

        ),
      )

      ]),
      SizedBox(height:2),
        Text(contact.name,style: TextStyle(fontSize: 12),)
        
      ],),
    );
  }
}