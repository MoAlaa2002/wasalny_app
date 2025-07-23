abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoadingLoginState extends LoginState {}

class LoadedLoginState extends LoginState {}

class FailureLoginState extends LoginState {
  final String errormsg;

  FailureLoginState({required this.errormsg});
}
