import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterchatapp/models/message.dart';
import 'package:flutterchatapp/widgets/category.dart';
import 'package:flutterchatapp/widgets/favorites.dart';
import 'package:flutterchatapp/widgets/recents.dart';

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
            "Chats",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 28.0,
          color: Colors.white,
          onPressed: () {},
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 28.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Category(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
              ),
              child: Column(
                children: <Widget>[
                  Favorites(),
                  Recents(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
