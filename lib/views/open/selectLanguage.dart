import 'package:flutter/material.dart';
import 'package:kelimeapp/views/home/homePage.dart';
import 'package:kelimeapp/views/open/landingPage.dart';
import 'package:kelimeapp/views/shared/myAppBar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectLanguage extends StatefulWidget {
  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  Future<int> _checkIsLandingPageView() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLandingPageView = prefs.getBool('isLandingPageView');
    print("COm: $isLandingPageView");
    if (isLandingPageView == false) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LandingPage()),
      );
    }
    return 1;
  }

  Future<int> _fillIsLandingPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLandingPageView = prefs.getBool('isLandingPageView');
    if (isLandingPageView == null) {
      await prefs.setBool('isLandingPageView', false);
    }
  }

  @override
  void initState() {
    super.initState();
    _fillIsLandingPage().then((value) {
      _checkIsLandingPageView().then((value) {
        print("Kayit Getirildi");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 240, 241, 1.0),
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
                child: Text(
                  "Öğrenmek İstediğiniz\nDili Seçiniz",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.white),
                ),
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
                    MaterialPageRoute(
                        builder: (context) => HomePage("İngilizce")),
                  );
                },
              ),
              GestureDetector(
                child: languageCard("flag_spanish.jpg", "İspanyolca"),
                onTap: () {
                  // Dil Anaekran Gitme
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage("İspanyolca")),
                  );
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                child: languageCard("flag_german.jpg", "Almanca"),
                onTap: () {
                  showAlert();
                },
              ),
              GestureDetector(
                child: languageCard("flag_french.jpg", "Fransızca"),
                onTap: () {
                  showAlert();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showAlert() {
    Alert(
      context: context,
      type: AlertType.error,
      title: "Uyarı Mesajı",
      desc:
          "Seçmiş Olduğunuz Dil Henüz Eklenmedi. En Yakın Zamanda Bu Dili Eklemiş Olacağız.",
      buttons: [
        DialogButton(
          child: Text(
            "Tamam",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
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
