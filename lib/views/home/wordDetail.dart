import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:kelimeapp/database/DbHelper.dart';
import 'package:kelimeapp/models/WordModel.dart';

class WordDetail extends StatefulWidget {
  final WordModel word;
  String language;
  WordDetail(this.word,this.language);

  @override
  _WordDetailState createState() => _WordDetailState();
}

class _WordDetailState extends State<WordDetail> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  DbHelper dbHelper = new DbHelper();

  WordModel wordModel;
  List<WordModel> wordsStorage;

  @override
  void initState() {
    super.initState();
    wordsStorage = new List<WordModel>();
    getData();
  }

  void getData() {
    var dbFuture = dbHelper.initializeDb();
    dbFuture.then((result) {
      var listFuture = dbHelper.getMyList(widget.language);
      listFuture.then((data) {
        List<WordModel> myListData = new List<WordModel>();
        for (var i = 0; i < data.length; i++) {
          myListData.add(WordModel.fromJson(data[i]));
        }
        setState(() {
          wordsStorage = myListData;
        });
      });
      return 1;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldstate =
      new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldstate,
      backgroundColor: Color.fromRGBO(236, 240, 241, 1.0),
      appBar: AppBar(
        elevation: 15,
        title: Text(
          "Kelime Detayları",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.menu),
            itemBuilder: (context) => [
              PopupMenuItem(
                  child: ListTile(
                leading: Icon(Icons.add_circle),
                title: Text("Kelimeyi Kaydet"),
                onTap: () {
                  saveWord();
                },
              )),
            ],
          ),
        ],
      ),
      body: Builder(
        builder: (BuildContext context){
          return Center(
        child: FlipCard(
            key: cardKey,
            flipOnTouch: true,
            front: Container(
              height: MediaQuery.of(context).size.height / 1.6,
              child: wordCard("${widget.word.word}", "${widget.word.mean}"),
            ),
            back: Container(
              height: MediaQuery.of(context).size.height / 1.6,
              child: sentenceCard(
                  "${widget.word.sentence}", "${widget.word.sentenceMean}"),
            )),
      );
        },
      ),
    );
  }

  Widget wordCard(String txt1, String txt2) {
    return Card(
      elevation: 50.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.all(10),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.3,
        padding: EdgeInsets.all(0.0),
        child: Column(
          children: <Widget>[
            headCard("Kelime Kartı"),
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    'Kelime',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  height: 1,
                  color: Colors.black,
                ),
                Container(
                  child: Text(
                    '$txt1',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    'Anlamı',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  height: 1,
                  color: Colors.black,
                ),
                Container(
                  child: Text(
                    '$txt2',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget sentenceCard(String txt1, String txt2) {
    return Card(
      elevation: 50.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.all(10),
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.3,
        padding: EdgeInsets.all(0.0),
        child: Column(
          children: <Widget>[
            headCard("Cümle Kartı"),
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    'Örnek Cümle',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  height: 1,
                  color: Colors.black,
                ),
                Container(
                  child: Text(
                    '$txt1',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    'Cümlenin Anlamı',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  height: 1,
                  color: Colors.black,
                ),
                Container(
                  child: Text(
                    '$txt2',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget headCard(String text) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.red,
      ),
      child: Center(
        child: Text(
          "$text",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
      ),
    );
  }

  void saveWord() async {
    print("${wordsStorage.length} ***********************");
    if (wordsStorage.where((i) => i.word == widget.word.word).toList().length >
        0) {
      final snackBar = SnackBar(
        content: Text(
          'Bu Kelime Zaten Kaydedilmiş...',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
        elevation: 5.0,
        action: SnackBarAction(
          label: 'Tamam',
          textColor: Colors.white,
          onPressed: () {
            _scaffoldstate.currentState.hideCurrentSnackBar();
          },
        ),
      );
      _scaffoldstate.currentState.showSnackBar(snackBar);
    } else {
      WordModel wordModel1 = new WordModel();
      wordModel1.word = widget.word.word;
      wordModel1.mean = widget.word.mean;
      wordModel1.sentence = widget.word.sentence;
      wordModel1.sentenceMean = widget.word.sentenceMean;

      int result = await dbHelper.insert(wordModel1,widget.language);
      if (result != 0) {
        final snackBar = SnackBar(
          content: Text(
            'Kelime Başarıyla Kaydedildi...',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.red,
          elevation: 5.0,
          action: SnackBarAction(
            label: 'Tamam',
            textColor: Colors.white,
            onPressed: () {
              _scaffoldstate.currentState.hideCurrentSnackBar();
            },
          ),
        );
        _scaffoldstate.currentState.showSnackBar(snackBar);
        wordsStorage.add(wordModel1);
      }
    }
  }

}
