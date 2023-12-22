import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';

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
                    errorText: username.isPure || username.isValid
                        ? null
                        : 'Usuario no valido',
                  ),
                  onChanged: registerCubit.usernameChanged,
                ),
                // Email
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Correo electronico',
                  ),
                  onChanged: (value) => registerCubit.usernameChanged(value),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().isEmpty) {
                      return 'Campo requerido';
                    }
                    final emailRegex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );
                    if (!emailRegex.hasMatch(value)) {
                      return 'No tiene formato de correo';
                    }
                    return null;
                  },
                ),
                // Password
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Constraseña',
                    errorText: password.isPure || password.isValid
                        ? null
                        : 'Contraseña no valida',
                  ),
                  obscureText: true,
                  onChanged: (value) => registerCubit.usernameChanged(value),
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
