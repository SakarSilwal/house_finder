import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:house_finder/feature/sign-up/domain/usecase/signup_user_usecase.dart';
import 'package:house_finder/feature/sign-up/presentation/bloc/signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupUserUsecase signupUserUsecase;
  SignupBloc({required this.signupUserUsecase}) : super(SignupInitial()) {
    on<SignupRequested>(_onSignupRequested);
  }

  Future<void> _onSignupRequested(
    SignupRequested event,
    Emitter<SignupState> emit,
  ) async {
    emit(SignupLoading());
    try {
      // Simulate signup process
      await signupUserUsecase.call(event.username, event.email, event.password);
      //if successful
      emit(SignupSuccess());
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }
}
