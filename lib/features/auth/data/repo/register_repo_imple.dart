import 'package:firebase_auth/firebase_auth.dart';

class RegisterRepoImple {
  final FirebaseAuth firebaseAuth;
  RegisterRepoImple({required this.firebaseAuth});

  Future<void> signUpWiteEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print(e);
    }
  }
}
