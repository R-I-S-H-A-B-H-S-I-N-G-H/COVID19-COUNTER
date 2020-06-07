import 'package:corona_counter/scripts/Home.dart';
import 'package:flutter/material.dart';
import 'package:corona_counter/scripts/data.dart';
void main() {
  runApp(MaterialApp(
    title: "My first app",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Reem',
      primaryColor: prussianBlue,
    ),
    home: HomePage(),
  ));
  
}
