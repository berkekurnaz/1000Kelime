import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:kelimeapp/views/open/selectLanguage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();

  Future<int> _checkIsLandingPageView() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLandingPageView = prefs.getBool('isLandingPageView');
    if (isLandingPageView != null) {
      if (isLandingPageView == false) {
        await prefs.setBool('isLandingPageView', true);
      }
    }
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: OverBoard(
        pages: pages,
        showBullets: true,
        skipText: "Tamam",
        nextText: "İleri",
        skipCallback: () {
          /*
          _globalKey.currentState.showSnackBar(SnackBar(
            content: Text("Skip clicked"),
          ));
          */
        },
        finishCallback: () {
          _checkIsLandingPageView().then((value) {
            print("Kayit Tamamlandi");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SelectLanguage()),
            );
          });
        },
      ),
    );
  }

  final pages = [
    PageModel(
        color: const Color(0xFF0097A7),
        imageAssetPath: 'assets/images/1.png',
        title: 'Kelimeleri Listeleyin',
        body: 'Dünya Dillerinden En Sık Kullanılan 1000 Kelimeyi Listeleyin.',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF536DFE),
        imageAssetPath: 'assets/images/2.png',
        title: "Kelimeleri Kaydedin",
        body: 'İstediğiniz Kelimeyi Kaydedin Ve Daha Sonra Kolayca Ulaşın.',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF9B90BC),
        imageAssetPath: 'assets/images/3.png',
        title: 'Arama Yapın',
        body: 'Kelimeler Arasında İstediğiniz Kelimenin Aramasını Yapın.',
        doAnimateImage: true),
  ];
}
