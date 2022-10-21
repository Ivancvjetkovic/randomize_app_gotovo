import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomize_app/authenticationRepository.dart';

import '../signInModel.dart';
import '../signInModelValidator.dart';
import 'bloc_event.dart';
import 'bloc_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final IAuthenticationRepository authenticationRepository;
  final SignInModelValidator signInModelValidator;

  SignInBloc({
    required this.authenticationRepository,
    required this.signInModelValidator,
  }) : super(initialState()) {
    on<SignInUpdateEvent>(_update);
    on<SignInSubmitEvent>(_submit);
  }

  static SignInState initialState() => SignInState(
        status: SignInStateStatus.initial,
        model: SignInModel(),
      );

  Future<void> _update(
      SignInUpdateEvent event, Emitter<SignInState> emit) async {
    emit(state.copyWith(model: event.model));
  }

  Future<void> _submit(
      SignInSubmitEvent event, Emitter<SignInState> emit) async {
    if (signInModelValidator.validate(state.model)) {
      emit(state.copyWith(status: SignInStateStatus.submitting));

      final success = await authenticationRepository.signIn(state.model);

      if (success) {
        emit(state.copyWith(status: SignInStateStatus.submittingSuccess));
        emit(initialState());
      } else {
        emit(state.copyWith(status: SignInStateStatus.submittingError));
      }
    } else {
      emit(state.copyWith(status: SignInStateStatus.validationError));
    }
  }
}
