import 'package:flutter/material.dart';
import 'package:kelimeapp/models/WordModel.dart';
import 'package:kelimeapp/views/home/wordListAlphabeticalList.dart';
import 'package:kelimeapp/views/shared/myAppBar.dart';

class WordListAlphabetical extends StatefulWidget {
  final List<WordModel> words;

  WordListAlphabetical(this.words);

  @override
  _WordListAlphabeticalState createState() => _WordListAlphabeticalState();
}

class _WordListAlphabeticalState extends State<WordListAlphabetical> {
  var alphabeticalList = ["a", "b", "c", "d", "e"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 240, 241,1.0),
      appBar: MyAppBar(),
      body: ListView.builder(
        itemCount: alphabeticalList.length,
        itemBuilder: (context, index) {
          return letterCard(
              "${alphabeticalList[index]} ile başlayan kelimeler",
              widget.words
                  .where((i) => i.word.startsWith(alphabeticalList[index]))
                  .toList());
        },
      ),
    );
  }

  Widget letterCard(String title, List<WordModel> wordsList) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.format_list_bulleted),
        title: Text('$title'),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WordListAlphabeticalList(wordsList)),
          );
        },
      ),
    );
  }
}
