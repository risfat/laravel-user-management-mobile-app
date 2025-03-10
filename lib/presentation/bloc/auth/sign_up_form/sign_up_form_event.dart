part of 'sign_up_form_bloc.dart';

@freezed
class SignUpFormEvent with _$SignUpFormEvent {
  const factory SignUpFormEvent.initial() = _Initial;
  const factory SignUpFormEvent.signUpWithEmail() = _SignUpWithEmail;

  // TextField events
  const factory SignUpFormEvent.nameOnChanged(
    String name,
  ) = _NameOnChanged;
  const factory SignUpFormEvent.emailOnChanged(
    String email,
  ) = _EmailOnChanged;
  const factory SignUpFormEvent.passwordOnChanged(
    String password,
  ) = _PasswordOnChanged;
  const factory SignUpFormEvent.confirmPasswordOnChanged(
    String confirmPassword,
  ) = _ConfirmPasswordOnChanged;
}
