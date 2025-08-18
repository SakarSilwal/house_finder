import 'package:house_finder/feature/sign-up/data/datasource/auth_remote_datasource.dart';
import 'package:house_finder/feature/sign-up/domain/repository/auth_repository.dart';

class SignUpAuthRepositoryImpl implements SignUpAuthRepository {
  final SignUpAuthRemoteDatasource remoteDatasource;

  SignUpAuthRepositoryImpl(this.remoteDatasource);

  @override
  Future<void> createUserWithEmailAndPassword(
    String username,
    String email,
    String password,
  ) {
    return remoteDatasource.createUserWithEmailAndPassword(
      username,
      email,
      password,
    );
  }
}
