abstract class SignUpAuthRepository {
  Future<void> createUserWithEmailAndPassword(
    String username,
    String email,
    String password,
  );
}
