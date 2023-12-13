import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app/src/data/datasource/user_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

final db = FirebaseFirestore.instance;
final user = FirebaseAuth.instance.currentUser!;
final String currentUser = user.uid;

class AuthRepository {
  // get database
  final UserDatasource user = UserDatasource();

  // add users
  Future<void> signUp(
    String uid,
    String email,
    String firstName,
    String lastName,
    String gender,
  ) {
    return user.profileCollection.add({
      'uid': uid,
      'email': email,
      'first-name': firstName,
      'last-name': lastName,
      'gender': gender,
    });
  }
}
