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
      isValid: Formz.validate([username, state.password]),
    ));
  }

  void emailChanged(String value) => emit(state.copyWith(email: value));

  void passwordChanged(String value) {
    final password = Password.dirty(value);

    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([password, state.username]),
    ));
  }

  void formStatusChanged(FormStatus value) =>
      emit(state.copyWith(formStatus: value));

  void onSubmit() => debugPrint('Cubit submit: $state');
}
