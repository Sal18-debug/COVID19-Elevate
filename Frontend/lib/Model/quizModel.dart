import 'package:flutter/cupertino.dart';

class QuizModel {
  String id;
  String question;
  String ans;
  List<String> options;

  QuizModel({
    @required this.id,
    @required this.question,
    @required this.ans,
    @required this.options,
  });

  QuizModel.fromMap(Map<String, dynamic> map) {
    this.id = map["_id"];
    this.question = map["question"];
    this.ans = map["ans"];
    this.options = List<String>();
    for (var i = 0; i < map["options"].length; i++) {
      this.options.add(map["options"][i]);
    }
  }
}
