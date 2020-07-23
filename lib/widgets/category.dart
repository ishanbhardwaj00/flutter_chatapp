import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  int sIndex=0;
  List<String> categories= ["Messages", "Online", "Groups", "Requests"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,

        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                sIndex=index;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30,),
              child: Text(categories[index], style: TextStyle(
                color: index==sIndex? Colors.white: Colors.white60,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
              ),
            ),
          );
        },
        itemCount: categories.length,)
    );
  }
}
