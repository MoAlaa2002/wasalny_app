abstract class ResetPassState {}

class InitialResetPassState extends ResetPassState {}

class LoadingResetPassState extends ResetPassState {}

class LoadedResetPassState extends ResetPassState {}

class FailureResetPassState extends ResetPassState {
  final String errormsg;
  FailureResetPassState({required this.errormsg});
}
