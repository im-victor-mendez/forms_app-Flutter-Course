import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../infrastructure/inputs/inputs.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  void usernameChanged(String value) {
    final username = Username.dirty(value);

    emit(state.copyWith(
      username: username,
      isValid: Formz.validate([username, state.password, state.email]),
    ));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    return emit(state.copyWith(
      email: email,
      isValid: Formz.validate([email, state.username, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);

    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([password, state.username, state.email]),
    ));
  }

  void formStatusChanged(FormStatus value) =>
      emit(state.copyWith(formStatus: value));

  void onSubmit() {
    emit(state.copyWith(
      formStatus: FormStatus.validating,
      username: Username.dirty(state.username.value),
      password: Password.dirty(state.password.value),
      isValid: Formz.validate([state.username, state.password, state.email]),
    ));

    debugPrint('Cubit submit: $state');
  }
}
