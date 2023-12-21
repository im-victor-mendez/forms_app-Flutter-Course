part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterState extends Equatable {
  final String username;
  final String email;
  final String password;
  final FormStatus formStatus;

  const RegisterState({
    this.username = '',
    this.email = '',
    this.password = '',
    this.formStatus = FormStatus.invalid,
  });

  @override
  List<Object> get props => [username, email, password, formStatus];

  RegisterState copyWith({
    String? username,
    String? email,
    String? password,
    FormStatus? formStatus,
  }) =>
      RegisterState(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        formStatus: formStatus ?? this.formStatus,
      );
}
