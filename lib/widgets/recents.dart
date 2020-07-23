import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterchatapp/models/message.dart';
import 'package:flutterchatapp/models/user.dart';
import 'package:flutterchatapp/screens/chats.dart';


class Recents extends StatefulWidget {
  @override
  _RecentsState createState() => _RecentsState();
}

class _RecentsState extends State<Recents> {
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
          child: ListView.builder(itemCount: chats.length ,itemBuilder:(BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return  Chats(user: chats[index].sender);
                  },
                ),);
              },
              child: Container(
                margin: EdgeInsets.only(top:5.0, bottom: 5.0, right: 20, left:1),
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: chats[index].unread? Color(0xffffefee) : Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), bottomRight: Radius.circular(30.0) )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(radius: 35.0, backgroundImage: AssetImage(chats[index].sender.imageUrl),),
                        SizedBox(width:11),
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                chats[index].sender.name,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0 ),),
                              SizedBox(height: 5.0),
                              Text(
                                  chats[index].text,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w600,
                                  ),

                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          chats[index].time,
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0)
                          ,),
                        SizedBox(height: 5,),
                        chats[index].unread? Container(
                          alignment: Alignment.center,
                          height:20, width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Text(
                                "NEW",
                                style: TextStyle(color: Colors.white, fontSize: 11.0),
                            ),
                        ) : Text(""),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } ,
          ),
        ),
      ),
    );
  }
}
