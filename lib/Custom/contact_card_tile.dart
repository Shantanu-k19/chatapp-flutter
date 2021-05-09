import 'package:chatapp_f/Models/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContactTile extends StatelessWidget {
  final ChatModel contact;
  ContactTile(this.contact);
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading:Container(
          height: 50,
          width: 50,
                  child: Stack(
                    children: [CircleAvatar(
    radius: 23,
    child: SvgPicture.asset("assets/person.svg",
    height:30 ,
    width: 30,
    color: Colors.white,
    
     ),
     backgroundColor: Colors.blueGrey,
    ),
    contact.select?
    Positioned(
          right: 1,
          bottom: 5,
            child: CircleAvatar(
          radius: 10,
          child: Icon(Icons.check,color: Colors.white,size: 18,),
          backgroundColor: Colors.teal,

      ),
    ):Container()

    ]),
        ),
    title: Text(contact.name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
    subtitle: Text(contact.status,style: TextStyle(fontSize: 13,)
    ),

        
        );
  }
}