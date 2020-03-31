import 'package:flutter/material.dart';
import 'package:kelimeapp/models/WordModel.dart';
import 'package:kelimeapp/views/home/wordDetail.dart';
import 'package:kelimeapp/views/shared/myAppBar.dart';

class WordList extends StatefulWidget {

  final List<WordModel> words;

  WordList(this.words);

  @override
  _WordListState createState() => _WordListState();
}

class _WordListState extends State<WordList> {

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
        itemCount: widget.words.length,
        itemBuilder: (BuildContext context, int index){
          return wordCard(widget.words[index].word, widget.words[index]);
        },
      ),
    );
  }

  Widget wordCard(String title, WordModel wordModel) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.pages),
        title: Text('$title'),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WordDetail(wordModel)),
          );
        },
      ),
    );
  }
  
}
