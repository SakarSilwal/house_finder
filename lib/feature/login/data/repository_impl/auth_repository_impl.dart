import '../datasource/auth_remote_datasource.dart';
import '../../domain/repository/auth_repository.dart';

class LoginAuthRepositoryImpl implements LoginAuthRepository {
  final LoginAuthRemoteDatasource remoteDatasource;

  LoginAuthRepositoryImpl(this.remoteDatasource);

  @override
  Future<void> loginUserWithEmailAndPassword(String email, String password) {
    return remoteDatasource.loginUserWithEmailAndPassword(email, password);
  }
}
