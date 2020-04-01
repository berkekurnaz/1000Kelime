import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:kelimeapp/models/WordModel.dart';
import 'package:kelimeapp/views/home/randomWord.dart';
import 'package:kelimeapp/views/home/storageWordsList.dart';
import 'package:kelimeapp/views/home/wordList.dart';
import 'package:kelimeapp/views/home/wordListAlphabetical.dart';
import 'package:flutter/services.dart' show rootBundle;

class HomePage extends StatefulWidget {
  final String language;

  HomePage(this.language);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WordModel> words;
  var random = new Random();

  @override
  void initState() {
    super.initState();
    words = new List<WordModel>();
    loadWordsList().then((value) {
      setState(() {
        words = value;
        words.sort((a, b) => a.word.compareTo(b.word));
      });
      print("completed");
    });
  }

  Future<String> _loadJsonFile() async {
    if (widget.language == "İngilizce") {
      return await rootBundle.loadString('assets/data/wordEnglish.json');
    } else if (widget.language == "İspanyolca") {
      return await rootBundle.loadString('assets/data/wordEnglish.json');
    } else if (widget.language == "Almanca") {
      return await rootBundle.loadString('assets/data/wordGerman.json');
    } else if (widget.language == "Fransızca") {
      return await rootBundle.loadString('assets/data/wordFrench.json');
    } else {
      return await rootBundle.loadString('assets/data/wordEnglish.json');
    }
  }

  Future<List<WordModel>> loadWordsList() async {
    String jsonString = await _loadJsonFile();
    List<dynamic> jsonResponse = json.decode(jsonString).toList();
    return jsonResponse.map((v) => WordModel.fromJson(v)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 240, 241,1.0),
      body: ListView(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Center(
              child: Text("${widget.language}", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 45,color: Colors.white),),
            ),
          ),
          ),
          SizedBox(
            height: 30,
          ),
          selectButton(
              Color.fromRGBO(241, 196, 15, 1.0),
              Colors.white,
              "Rastgele Kelime Getir",
              Icon(Icons.access_alarm),
              RandomWord(words,widget.language)),
          selectButton(
              Color.fromRGBO(46, 204, 113, 1.0),
              Colors.white,
              "Bütün Kelimeleri Listele",
              Icon(Icons.access_alarm),
              WordList(words,widget.language)),
          selectButton(
              Color.fromRGBO(231, 76, 60, 1.0),
              Colors.white,
              "Harflere Göre Kelimeler",
              Icon(Icons.access_alarm),
              WordListAlphabetical(words,widget.language)),
          selectButton(
              Color.fromRGBO(52, 152, 219, 1.0),
              Colors.white,
              "Kaydettiğim Kelimeler",
              Icon(Icons.access_alarm),
              StorageWordsList(widget.language)),
        ],
      ),
    );
  }

  Widget selectButton(Color backColor, Color textColor, String text, Icon icon,
      Object navigatorClass) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: GFButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => navigatorClass),
          );
        },
        borderShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(width: 1.5, color: Colors.black)
        ),
        color: backColor,
        text: "$text",
        textStyle: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: textColor,shadows: [
            Shadow(
                blurRadius: 2.0,
                color: Colors.black,
                offset: Offset(0.2, 0.2),
                ),
            ],),
        borderSide: BorderSide(width: 2, color: Colors.black),
        size: 75,
        icon: icon,
        shape: GFButtonShape.standard,
      ),
    );
  }

}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height-70);
    var controllPoint = Offset(50, size.height);
    var endPoint = Offset(size.width/2, size.height); 
    path.quadraticBezierTo(controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy); 
    path.lineTo(size.width, size.height); 
    path.lineTo(size.width, 0); 
    return path; 
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
  
}