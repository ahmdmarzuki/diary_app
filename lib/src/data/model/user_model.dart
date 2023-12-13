
class UserModel {
  final String uid;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;

  UserModel(
      {required this.uid,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.gender});

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'first-name': firstName,
      'last-name': lastName,
      'gender': gender,
    };
  }

  UserModel.fromMap(Map<String, dynamic> userModelMap)
      : uid = userModelMap["uid"],
        email = userModelMap["email"],
        firstName = userModelMap["first-name"],
        lastName = userModelMap["last-name"],
        gender = userModelMap["gender"];
}
