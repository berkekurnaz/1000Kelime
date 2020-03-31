import 'package:flutter/material.dart';
import 'package:kelimeapp/database/DbHelper.dart';
import 'package:kelimeapp/models/WordModel.dart';
import 'package:kelimeapp/views/home/storageWordDetail.dart';
import 'package:kelimeapp/views/shared/myAppBar.dart';

class StorageWordsList extends StatefulWidget {
  @override
  _StorageWordsListState createState() => _StorageWordsListState();
}

class _StorageWordsListState extends State<StorageWordsList> {
  DbHelper dbHelper = new DbHelper();
  List<WordModel> words;

  @override
  void initState() {
    super.initState();
    words = new List<WordModel>();
    getData();
  }

  void getData() {
    var dbFuture = dbHelper.initializeDb();
    dbFuture.then((result) {
      var listFuture = dbHelper.getMyList();
      listFuture.then((data) {
        List<WordModel> myListData = new List<WordModel>();
        for (var i = 0; i < data.length; i++) {
          myListData.add(WordModel.fromJson(data[i]));
        }
        setState(() {
          words = myListData;
        });
      });
    });
  }

  void goToDetail(WordModel word) async {
    bool result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => StorageWordDetail(word)));
    if (result != null) {
      if (result) {
        getData();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        title: Text(
          "Kaydettiğim Kelimeler",
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
      ),
      body: wordList(),
    );
  }

  Widget wordList() {
    if (words.length == 0) {
      return Center(
        child: Text(
          "Henüz Veri Yok...",
          style: TextStyle(fontSize: 30),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: words.length,
        itemBuilder: (BuildContext context, int index) {
          return wordCard(words[index].word, words[index]);
        },
      );
    }
  }

  Widget wordCard(String title, WordModel wordModel) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.pages),
        title: Text('$title'),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          goToDetail(wordModel);
        },
      ),
    );
  }
}
