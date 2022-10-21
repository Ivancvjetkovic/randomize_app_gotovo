import '../signInModel.dart';

enum SignInStateStatus {
  initial,
  submitting,
  submittingSuccess,
  submittingError,
  validationError,
}

class SignInState {
  SignInStateStatus status;
  SignInModel model;

  SignInState({
    required this.status,
    required this.model,
  });

  SignInState copyWith({
    SignInStateStatus? status,
    SignInModel? model,
  }) =>
      SignInState(
        status: status ?? this.status,
        model: model ?? this.model,
      );
}
