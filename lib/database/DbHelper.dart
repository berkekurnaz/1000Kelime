import 'dart:io';
import 'package:kelimeapp/models/WordModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{

  static final DbHelper _dbHelper = DbHelper._internal();
  DbHelper._internal(); 

  factory DbHelper(){
    return _dbHelper;
  }

  static Database _db;
  Future<Database> get db async{
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "DbMyWords.db";

    var dbList = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbList;
  }

  void _createDb(Database db, int version) async{
    await db.execute("Create Table Words (Id integer primary key, word text, mean text, sentence text, sentenceMean text, category text)");
  }

  /* Insert Islemi Yazilmasi */
  Future<int> insert(WordModel wordModel, String category) async{
    Database db = await this.db;
    var result = await db.rawInsert("Insert Into Words (word,mean,sentence,sentenceMean,category) Values ('${wordModel.word}','${wordModel.mean}','${wordModel.sentence}','${wordModel.sentenceMean}','${category}')");
    return result;
  }

  /* Delete Islemi Yazilmasi */
  Future<int> delete(String word,String category) async{
    Database db = await this.db;
    var result = await db.rawDelete("Delete From Words where word = '$word' and category = '$category'");
    return result;
  }

  /* Listeleme Islemi Yazilmasi */
  Future<List> getMyList(String category) async{
    Database db = await this.db;
    var result = await db.rawQuery("Select * From Words where category = '$category'");
    return result;
  }

}