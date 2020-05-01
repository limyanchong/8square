import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'src/entities.dart';

class QuizRepository {
  final questionCollection = Firestore.instance
    .collection('/courses/0rGPdFIrnBOgnmo4vBR6/topics/JtXbPTWu9MPQxtM3WsbX/questions');

  Future<List<Map<String, Object>>> loadQuestions() async {
    QuerySnapshot snapshot = await questionCollection.getDocuments();
    return snapshot.documents
        .map((doc) => QuestionEntity.fromSnapshot(doc).toJson())
        .toList();
  }
}
