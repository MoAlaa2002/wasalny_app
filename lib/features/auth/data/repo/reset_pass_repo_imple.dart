import 'package:firebase_auth/firebase_auth.dart';

class ResetPassRepoImple {
  FirebaseAuth firebaseAuth;
  ResetPassRepoImple({required this.firebaseAuth});

  resetPassRepo({required String email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
