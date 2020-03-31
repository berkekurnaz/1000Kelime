class WordModel {
  String id;
  String word;
  String mean;
  String sentence;
  String sentenceMean;

  WordModel({this.id, this.word, this.mean, this.sentence, this.sentenceMean});

  /* Map Olusturma */
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["word"] = word;
    map["mean"] = mean;
    map["sentence"] = sentence;
    map["sentenceMean"] = sentenceMean;
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return new WordModel(
      id: json['id'] as String,
      word: json['word'] as String,
      mean: json['mean'] as String,
      sentence: json['sentence'] as String,
      sentenceMean: json['sentenceMean'] as String,
    );
  }
}
