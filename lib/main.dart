import "package:flutter/material.dart";
import 'screens/home.dart';

void main() {
 runApp(MaterialApp(
   title: "Messenger!",
   theme: ThemeData(
     primaryColor: Colors.redAccent,
     accentColor: Color(0xFFFEF9EB),
   ),
   home: HomeApp(),
 ),);
}

