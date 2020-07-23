import 'package:flutter/material.dart';
import 'package:flutterchatapp/models/message.dart';
import 'package:flutterchatapp/screens/chats.dart';


class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Favorites", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.blueGrey),),
              IconButton(
                icon: Icon(Icons.more_horiz),
                iconSize: 30.0,
                color: Colors.blueGrey,
                onPressed:() {},
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 5.0),
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black26,
                  width: 0.75,
                ),
              ),
            ),
            child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: favorites.length,itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                   builder: (context) {
                     return Chats(user: favorites[index]);
                   }
                  ),);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right:10 ),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(radius: 35, backgroundImage: AssetImage(favorites[index].imageUrl)),
                      SizedBox(height: 6.0),
                      Text(favorites[index].name, style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w600), ),
                    ],
                  ),
                ),
              );
            } ),
          ),
        ),
      ],
    );

  }
}
