import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app/src/presentation/screen/auth/profile_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final db = FirebaseFirestore.instance;
final user = FirebaseAuth.instance.currentUser;
final userData = FirebaseAuth.instance.currentUser!;
final String currentUser = userData.uid;

class AuthService {
  // get database
  final CollectionReference _users = FirebaseFirestore.instance
      .collection('users')
      .doc(currentUser)
      .collection('profile');
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // Future<void> googleSignIn(){

  // }
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

  // Future<String?> signInWithGoogle() async {
  //   if (user != null) {
  //       print('proccess');
  //     return currentUser;
  //   } else {
  //     try {
  //       print('proccess');
  //       final GoogleSignInAccount? googleSignInAccount =
  //           await _googleSignIn.signIn();
  //       final GoogleSignInAuthentication googleSignInAuthentication =
  //           await googleSignInAccount!.authentication;
  //       final AuthCredential credential = GoogleAuthProvider.credential(
  //           accessToken: googleSignInAuthentication.accessToken,
  //           idToken: googleSignInAuthentication.idToken);
  //       await _auth.signInWithCredential(credential);
  //     } on FirebaseAuthException catch (e) {
  //       print(e.message);
  //       throw e;
  //     }
  //   }
  //   return currentUser;
  // }

  Future<void> setDisplayName(String displayName) {
    return userData.updateDisplayName(displayName);
  }
}
