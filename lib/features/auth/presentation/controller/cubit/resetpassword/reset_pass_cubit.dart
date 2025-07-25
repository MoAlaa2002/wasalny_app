import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasalny_app/features/auth/data/repo/reset_pass_repo_imple.dart';
import 'package:wasalny_app/features/auth/presentation/controller/cubit/resetpassword/reset_pass_state.dart';

class ResetPassCubit extends Cubit<ResetPassState> {
  ResetPassRepoImple resetPassRepoImple;
  ResetPassCubit({required this.resetPassRepoImple})
    : super(InitialResetPassState());
  final TextEditingController email = TextEditingController();
  final GlobalKey<FormState> emailkey = GlobalKey();

  resetPassCubit() async {
    try {
      emit(LoadingResetPassState());
      await resetPassRepoImple.resetPassRepo(email: email.text);
      emit(LoadedResetPassState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        emit(FailureResetPassState(errormsg: 'This Email is Invalid'));
      } else {
        emit(FailureResetPassState(errormsg: e.code));
        print(e.code);
      }
    } catch (e) {
      emit(FailureResetPassState(errormsg: e.toString()));
    }
  }

  restPassvalidate() {
    if (emailkey.currentState!.validate()) {
      resetPassCubit();
    }
  }
}
