import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasalny_app/core/helpers/sharedpreferences/shared_pref_cache.dart';
import 'package:wasalny_app/features/auth/data/repo/login_repo_imple.dart';
import 'package:wasalny_app/features/auth/presentation/controller/cubit/Login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepoImple loginRepoImple;
  LoginCubit({required this.loginRepoImple}) : super(InitialLoginState());
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> loginKey = GlobalKey();
  loginWithEmailAndPass() async {
    try {
      emit(LoadingLoginState());

      await loginRepoImple.loginWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      emit(LoadedLoginState());
      await SharedPrefCache.setData(key: 'isLoggedIn', value: true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(FailureLoginState(errormsg: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(
          FailureLoginState(errormsg: 'Wrong password provided for that user.'),
        );
      } else if (e.code == 'invalid-email') {
        emit(FailureLoginState(errormsg: 'This Email is Invalid'));
      } else {
        emit(FailureLoginState(errormsg: e.code));
      }
    } catch (e) {
      emit(FailureLoginState(errormsg: e.toString()));
    }
  }

  loginValidate() {
    if (loginKey.currentState!.validate()) {
      loginWithEmailAndPass();
    }
  }

  logout() async {
    await SharedPrefCache.setData(key: 'isLoggedIn', value: false);
    await FirebaseAuth.instance.signOut();
  }
}
