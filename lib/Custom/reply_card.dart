
import 'package:flutter/material.dart';

class ReplyCard extends StatelessWidget {
final String textMessage;
ReplyCard(this.textMessage);

  @override
  Widget build(BuildContext context) {
    return Align(
          alignment: Alignment.centerLeft,
          child: ConstrainedBox(
        constraints:BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width-45,

      )
,
  child: Card(
    elevation:1,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      
      margin: EdgeInsets.symmetric(horizontal:15,vertical:5),
        child: Stack(
        children:[
          Padding(
            padding: EdgeInsets.only(bottom: 20,top:10,right:60,left:10),

            child: Text(textMessage ,style:TextStyle(fontSize: 16) ,)),
          Positioned(
            right: 10,
            bottom: 4,
            child: 
              Text("20.30",style: TextStyle(fontSize: 13,color: Colors.grey[600]),),
              

            
          )
        ]
      ),
  ),
       ),
    );
  }
}