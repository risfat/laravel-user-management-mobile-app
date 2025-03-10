part of 'sign_up_form_bloc.dart';

@freezed
class SignUpFormState with _$SignUpFormState {
  const factory SignUpFormState({
    required RequestState state,
    required String message,
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) = _SignUpFormState;

  factory SignUpFormState.initial() => const SignUpFormState(
        state: RequestState.empty,
        message: '',
        name: '',
        email: '',
        password: '',
        confirmPassword: '',
      );
}
