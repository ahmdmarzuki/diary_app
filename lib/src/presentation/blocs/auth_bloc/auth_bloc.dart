import 'package:bloc/bloc.dart';
import 'package:diary_app/src/data/model/user_model.dart';
import 'package:diary_app/src/data/repository/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is SignUpRequest) {
        emit(LoadingState());

        try {
          await authRepository.signUp(event.uid, event.email, event.firstName,
              event.lastName, event.gender);

          emit(Authenticated());
        } catch (e) {
          emit(AuthErrorState(e.toString()));
          emit(UnAuthenticated());
        }
      }
    });
  }
}
