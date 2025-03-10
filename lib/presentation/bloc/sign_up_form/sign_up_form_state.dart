part of 'sign_up_form_bloc.dart';

@freezed
class SignUpFormState with _$SignInFormState {
  const factory SignUpFormState({
    required RequestState state,
    required String message,
    required String email,
    required String password,
  }) = _SignInFormState;

  factory SignUpFormState.initial() => const SignUpFormState(
        state: RequestState.empty,
        message: '',
        email: '',
        password: '',
      );
}
