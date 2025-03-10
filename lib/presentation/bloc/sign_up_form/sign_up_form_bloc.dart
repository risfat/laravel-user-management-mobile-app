import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utilities/enums.dart';
import '../../../domain/usecases/login.dart';

part 'sign_up_form_bloc.freezed.dart';
part 'sign_up_form_event.dart';
part 'sign_up_form_state.dart';

class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  SignUpFormBloc(this._signInWithEmail) : super(SignUpFormState.initial()) {
    on<SignUpFormEvent>(
      (event, emit) async {
        await event.map(
          initial: (_) {
            emit(SignUpFormState.initial());
          },
          signInWithEmail: (_) async {
            emit(state.copyWith(state: RequestState.loading));
            // await Future.delayed(const Duration(seconds: 2));
            final result = await _signInWithEmail.execute(
              state.email,
              state.password,
            );
            result.fold(
                (f) => emit(
                      state.copyWith(
                        state: RequestState.error,
                        message: f.message,
                      ),
                    ),
                (_) => emit(state.copyWith(state: RequestState.loaded)));
          },
          emailOnChanged: (event) {
            emit(state.copyWith(email: event.email, state: RequestState.empty));
          },
          passwordOnChanged: (event) {
            emit(state.copyWith(
                password: event.password, state: RequestState.empty));
          },
        );
      },
    );
  }

  final Login _signInWithEmail;
}
