import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasalny_app/core/functions/check_user_type.dart';
import 'package:wasalny_app/features/auth/data/repo/register_repo_imple.dart';
import 'package:wasalny_app/features/auth/presentation/controller/cubit/register/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepoImple registerRepoImple;
  RegisterCubit({required this.registerRepoImple})
    : super(InitialRegisterSate());
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  String? userType;
  String? confirmPasswordError;
  bool value = false;
  bool isShowPass = false;
  final GlobalKey<FormState> keyRegister = GlobalKey();

  signInWithEmailAndPass() async {
    try {
      emit(LoadingRegisterSate());
      await registerRepoImple.signUpWiteEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      if (userType == null) {
        emit(FailureRegisterSate(errormsg: " Please Select User Type "));
        return;
      }

      await checkUserType(
        fullName: fullName.text,
        email: email.text,
        phoneNumber: phoneNumber.text,
        userType: userType!,
      );
      await verfiedEmail();
      emit(LoadedRegisterSate());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(
          FailureRegisterSate(errormsg: 'The password provided is too weak.'),
        );
      } else if (e.code == 'email-already-in-use') {
        emit(
          FailureRegisterSate(
            errormsg: 'The account already exists for that email.',
          ),
        );
      } else if (e.code == 'invalid-email') {
        emit(FailureRegisterSate(errormsg: 'This Email is Invalid'));
      } else {
        emit(FailureRegisterSate(errormsg: e.code));
        print(e.code);
      }
    } catch (e) {
      emit(FailureRegisterSate(errormsg: e.toString()));
    }
  }

  void registervalidate() {
    if (!confirmPass()) {
      emit(FailureRegisterSate(errormsg: "Passwords do not match!".trim()));
      return;
    }
    if (keyRegister.currentState!.validate()) {
      signInWithEmailAndPass();
    }
  }

  bool confirmPass() {
    if (confirmPassword.text != password.text) {
      confirmPasswordError = 'Passwords do not match!'.trim();
      emit(InitialRegisterSate());
      return false;
    } else {
      confirmPasswordError = null;
      return true;
    }
  }

  updateTermsAndconditions(newvalue) {
    value = newvalue;
    emit(TermsAndConditionChangesState(value: newvalue));
  }

  showPassword() {
    isShowPass = !isShowPass;
    emit(ShowPassState(value: isShowPass));
  }

  verfiedEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  void updateUserType(String value) {
    userType = value;
    emit(InitialRegisterSate());
  }
}
