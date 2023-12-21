import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  void usernameChanged(String value) => emit(state.copyWith(username: value));
  void emailChanged(String value) => emit(state.copyWith(email: value));
  void passwordChanged(String value) => emit(state.copyWith(password: value));
  void formStatusChanged(FormStatus value) =>
      emit(state.copyWith(formStatus: value));
}
