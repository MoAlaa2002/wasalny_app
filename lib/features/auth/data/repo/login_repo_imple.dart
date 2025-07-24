import 'package:firebase_auth/firebase_auth.dart';

class LoginRepoImple {
  FirebaseAuth firebaseAuth;
  LoginRepoImple({required this.firebaseAuth});
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
