import 'package:equatable/equatable.dart';

sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignupRequested extends SignupEvent {
  final String username;
  final String email;
  final String password;

  const SignupRequested({
    required this.username,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [username, email, password];
}
