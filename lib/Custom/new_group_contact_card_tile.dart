
import 'package:flutter/material.dart';


class NewGroupCard extends StatelessWidget {

final String name;
final IconData icon;
  NewGroupCard({this.name,this.icon});
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading:CircleAvatar(
    backgroundColor: Color(0xFF25D366),
    child: Icon(icon,size:25 ,
    color: Colors.white,
    ),
    radius: 23,
         
    
    ),
        title: Text(name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
    
        
        );
  }
}