part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  //equatable ko kaam chai to check equality among two  objects
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginRequested extends LoginEvent {
  final String email;
  final String password;

  const LoginRequested({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
