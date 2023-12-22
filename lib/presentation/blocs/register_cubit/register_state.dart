part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterState extends Equatable {
  final Username username;
  final String email;
  final Password password;
  final FormStatus formStatus;
  final bool isValid;

  const RegisterState({
    this.username = const Username.pure(),
    this.email = '',
    this.password = const Password.pure(),
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
  });

  @override
  List<Object> get props => [username, email, password, formStatus, isValid];

  RegisterState copyWith({
    Username? username,
    String? email,
    Password? password,
    FormStatus? formStatus,
    bool? isValid,
  }) =>
      RegisterState(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        formStatus: formStatus ?? this.formStatus,
        isValid: isValid ?? this.isValid,
      );
}
