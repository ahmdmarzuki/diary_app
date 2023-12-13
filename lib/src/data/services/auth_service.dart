import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
final db = FirebaseFirestore.instance;
final user = FirebaseAuth.instance.currentUser!;
final String currentUser = user.uid;
class AuthService {
  // get database
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users').doc(currentUser).collection('profile');

  // add users
  Future<void> addUsers(
    String uid,
    String email,
    String firstName,
    String lastName,
    String gender,
  ) {
    return _users.add({
      'uid': uid,
      'email': email,
      'first-name': firstName,
      'last-name': lastName,
      'gender': gender,
    });
  }
}
