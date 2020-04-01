import 'package:flutter/material.dart';
import 'package:kelimeapp/views/home/homePage.dart';
import 'package:kelimeapp/views/home/storageWordsList.dart';
import 'package:kelimeapp/views/home/wordList.dart';
import 'package:kelimeapp/views/open/selectLanguage.dart';

void main(){
  runApp(MaterialApp(
    initialRoute: "/selectLanguage",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        backgroundColor: Color.fromRGBO(236, 240, 241,1.0),
        fontFamily: "OpenSans",
        accentColor: Colors.black,
      ),
    routes: {
      "/homePage": (context) => HomePage(null),
      "/wordList": (context) => WordList(null,null),
      "/selectLanguage": (context) => SelectLanguage(),
    },
  ));
}