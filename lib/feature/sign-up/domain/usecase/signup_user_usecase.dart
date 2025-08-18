import 'package:house_finder/feature/sign-up/domain/repository/auth_repository.dart';

class SignupUserUsecase {
  final SignUpAuthRepository repository;

  SignupUserUsecase(this.repository);

  Future<void> call(String username, String email, String password) {
    return repository.createUserWithEmailAndPassword(username, email, password);
  }
}
