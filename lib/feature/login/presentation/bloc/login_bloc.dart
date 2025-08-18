import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecase/login_user_usecase.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUserUseCase loginUserUseCase;
  LoginBloc({required this.loginUserUseCase}) : super(LoginInitial()) {
    on<LoginRequested>(_loginRequested);
  }

  Future<void> _loginRequested(
    LoginRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      await loginUserUseCase.call(event.email, event.password);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }
}
