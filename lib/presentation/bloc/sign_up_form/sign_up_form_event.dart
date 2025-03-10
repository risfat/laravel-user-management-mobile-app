part of 'sign_up_form_bloc.dart';

@freezed
class SignUpFormEvent with _$SignInFormEvent {
  const factory SignUpFormEvent.initial() = _Initial;
  const factory SignUpFormEvent.signInWithEmail() = _SignInWithEmail;

  // TextField events
  const factory SignUpFormEvent.emailOnChanged(
    String email,
  ) = _EmailOnChanged;
  const factory SignUpFormEvent.passwordOnChanged(
    String password,
  ) = _PasswordOnChanged;
}
