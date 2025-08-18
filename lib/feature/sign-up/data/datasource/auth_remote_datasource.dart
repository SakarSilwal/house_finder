import 'dart:developer' show log;

import 'package:firebase_auth/firebase_auth.dart';

class SignUpAuthRemoteDatasource {
  final FirebaseAuth _firebaseAuth;

  SignUpAuthRemoteDatasource(this._firebaseAuth);

  Future<void> createUserWithEmailAndPassword(
    String username,
    String email,
    String password,
  ) async {
    UserCredential
    userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ); //firebase auth le email ra password matra support garxa but we need username too that's why we added username as parameter to store in firestore.
    // await FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(userCredential.user!.uid)
    //     .set({
    //       'name': username,
    //       'email': email,
    //       'createdAt': FieldValue.serverTimestamp(),
    //     });

    log('User Doc data: ${userCredential}');
  }
}
