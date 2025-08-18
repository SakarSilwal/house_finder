import '../repository/auth_repository.dart';

class LoginUserUseCase {
  final LoginAuthRepository repository;

  LoginUserUseCase(this.repository);

  Future<void> call(String email, String password) {
    return repository.loginUserWithEmailAndPassword(email, password);
  }
}
