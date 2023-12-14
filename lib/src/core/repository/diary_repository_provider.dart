import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app/src/core/model/diary_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final user = FirebaseAuth.instance.currentUser!;
final diaryRepositortProvider = Provider((ref) => DiaryRepository());

class DiaryRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String currentUser = user.uid;

  Future<void> writeDiary(DiaryModel diary) async{
    await _firestore
        .collection('users')
        .doc(currentUser)
        .collection('diary')
        .doc(diary.id.isEmpty ? null : diary.id)
        .set(diary.toMap(), SetOptions(merge: true));
  }
}
