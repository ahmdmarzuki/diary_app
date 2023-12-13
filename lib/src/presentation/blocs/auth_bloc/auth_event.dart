part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignUpRequest extends AuthEvent {
  final String uid;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;

  SignUpRequest(
      {required this.uid,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.gender});
}
