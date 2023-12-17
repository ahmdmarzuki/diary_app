import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app/src/core/repository/diary_repository_provider.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final String currentUser = user.uid;

class UserRepository {
  final userData = _firestore.collection(currentUser).doc('profile').get();
}
