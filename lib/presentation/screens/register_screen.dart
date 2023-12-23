import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/register_cubit/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _View(),
      ),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();

    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                const FlutterLogo(),
                // Username
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nombre de usuario',
                    errorText: username.errorMessage,
                  ),
                  onChanged: registerCubit.usernameChanged,
                ),
                // Email
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Correo electronico',
                    errorText: email.errorMessage,
                  ),
                  onChanged: registerCubit.emailChanged,
                ),
                // Password
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Constraseña',
                    errorText: password.errorMessage,
                  ),
                  obscureText: true,
                  onChanged: registerCubit.passwordChanged,
                ),
                const SizedBox(height: 40),
                // Submit Button
                FilledButton.icon(
                  onPressed: () => registerCubit.onSubmit(),
                  icon: const Icon(Icons.save_rounded),
                  label: const Text('Crear Usuario'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
