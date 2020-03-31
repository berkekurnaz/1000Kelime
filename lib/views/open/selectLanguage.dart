import 'package:flutter/material.dart';
import 'package:kelimeapp/views/home/homePage.dart';
import 'package:kelimeapp/views/shared/myAppBar.dart';

class SelectLanguage extends StatefulWidget {
  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 240, 241,1.0),
      body: ListView(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Center(
              child: Text("Öğrenmek İstediğiniz\nDili Seçiniz",textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.white),),
            ),
          ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                child: languageCard("flag_english.jpg", "İngilizce"),
                onTap: () {
                  
                  // Dil Anaekran Gitme
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage("İngilizce")),
                  );

                },
              ),
              GestureDetector(
                child: languageCard("flag_spanish.jpg", "İspanyolca"),
                onTap: () {
                  
                  // Dil Anaekran Gitme
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage("İspanyolca")),
                  );

                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              languageCard("flag_german.jpg", "Almanca"),
              languageCard("flag_french.jpg", "Fransızca"),
            ],
          ),
        ],
      ),
    );
  }

  Widget languageCard(String image, String title) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.all(10),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        padding: EdgeInsets.all(0.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              child: Image.asset(
                "assets/images/$image",
                fit: BoxFit.cover,
              ),
            ),
            Divider(),
            Container(
              child: Text(
                '$title',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
