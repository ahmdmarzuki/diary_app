import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final db = FirebaseFirestore.instance;
final user = FirebaseAuth.instance.currentUser!;
final String currentUser = user.uid;

class DiaryService {
  // get database
  final CollectionReference _diary =
      db.collection('users').doc(currentUser).collection('diary');

  // ADD Diary
  Future<void> addDiary(
    String title,
    String content,
    DateTime date,
  ) {
    return _diary.add(
      {
        'title': title,
        'content': content,
        'date': date,
      },
    );
  }
}
