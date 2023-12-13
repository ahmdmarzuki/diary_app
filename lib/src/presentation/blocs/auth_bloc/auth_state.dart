part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

// When the user presses the signin or signup button the state is changed to loading first and then to Authenticated.
class LoadingState extends AuthState {
  List<Object?> get props => [];
}

// When the user is authenticated the state is changed to Authenticated.
class Authenticated extends AuthState {
  List<Object?> get props => [];
}

// This is the initial state of the bloc. When the user is not authenticated the state is changed to Unauthenticated.
class UnAuthenticated extends AuthState {
  List<Object?> get props => [];
}

// If any error occurs the state is changed to AuthError.
class AuthErrorState extends AuthState {
  final String error;

  AuthErrorState(this.error);

  List<Object?> get props => [error];
}
