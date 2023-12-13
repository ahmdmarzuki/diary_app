import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final db = FirebaseFirestore.instance;

final user = FirebaseAuth.instance.currentUser!;
final String currentUser = user.uid;

class UserDatasource {
  final profileCollection = db.collection('users').doc(currentUser).collection('profile');
}
