import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterchatapp/models/message.dart';
import 'package:flutterchatapp/models/user.dart';

class Chats extends StatefulWidget {
  User user;
  Chats({this.user});

  @override
  _ChatsState createState() => _ChatsState();
}


class _ChatsState extends State<Chats> {

  buildMessage(Message messages, bool isMe) {
        Container msg= Container(
          width: MediaQuery.of(context).size.width* 0.75,
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          margin: isMe? EdgeInsets.only(left: 99.0, top:8.0, bottom: 8.0) : EdgeInsets.only(top:8.0,bottom:8.0),
          decoration: BoxDecoration(
              color: isMe? Theme.of(context).accentColor:Color(0xffffefee),
              borderRadius:
              isMe? BorderRadius.only(topLeft: Radius.circular(15.0), bottomLeft: Radius.circular(15.0)):
              BorderRadius.only(topRight: Radius.circular(15.0), bottomRight: Radius.circular(15.0))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(messages.time, style: TextStyle(fontSize: 12.0, color: Colors.blueGrey, fontWeight: FontWeight.w600),),
              SizedBox(
                height: 5,
              ),
              Text(
                messages.text,
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0
                ),
              ),
            ],
          ),
        );
        if(isMe){
          return msg;
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            msg,
            IconButton(
              iconSize: 30.0,
              icon: messages.isLiked? Icon(Icons.favorite, color: Colors.red,) : Icon(Icons.favorite_border, color: Colors.red) ,

            ),
          ],
        );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(

        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(widget.user.name, style: TextStyle(
            color: Colors.white,
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
        )),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_vert, color: Colors.white,  ), onPressed: () {},),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () =>FocusScope.of(context).unfocus(),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0))
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
                  child: ListView.builder(reverse: true, padding: EdgeInsets.only(top: 5.0 ),itemCount: messages.length,itemBuilder: (BuildContext context, int index) {
                    bool isMe= messages[index].sender.id== currentUser.id;
                    return buildMessage(messages[index], isMe);
                  }),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.image, color: Colors.red, ),
                  onPressed: () {},
                  iconSize: 24.0,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: TextField(
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration.collapsed(
                      hintStyle: TextStyle(color: Colors.black45),
                      hintText: "Send ${widget.user.name} a message!"
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.red),
                  onPressed: () {},
                  iconSize: 24.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
