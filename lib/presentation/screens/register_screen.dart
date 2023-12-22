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

class _View extends StatefulWidget {
  const _View();

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const FlutterLogo(),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nombre de usuario',
                  ),
                  onChanged: (value) {
                    registerCubit.usernameChanged(value);
                    formKey.currentState?.validate();
                  },
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().isEmpty) {
                      return 'Campo requerido';
                    }
                    if (value.length < 6) return 'Mas de 6 letras';
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Correo electronico',
                  ),
                  onChanged: (value) {
                    registerCubit.usernameChanged(value);
                    formKey.currentState?.validate();
                  },
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
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Constraseña',
                  ),
                  obscureText: true,
                  onChanged: (value) {
                    registerCubit.usernameChanged(value);
                    formKey.currentState?.validate();
                  },
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().isEmpty) {
                      return 'Campo requerido';
                    }
                    if (value.length < 6) return 'Mas de 6 letras';
                    return null;
                  },
                ),
                const SizedBox(height: 40),
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
