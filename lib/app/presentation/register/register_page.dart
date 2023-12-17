import 'package:app_arch/app/app_arch_injection.dart';
import 'package:app_arch/app/core/ui/widgets/app_arch_button.dart';
import 'package:app_arch/app/core/ui/widgets/app_arch_input.dart';
import 'package:app_arch/app/features/domain/entities/user/user_entity.dart';
import 'package:app_arch/app/presentation/register/bloc/register_controller.dart';
import 'package:app_arch/app/presentation/register/bloc/register_event.dart';
import 'package:app_arch/app/presentation/register/bloc/register_state.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final RegisterController _controller;

  final _formKey = GlobalKey<FormState>();

  final _email = TextEditingController();
  final _password = TextEditingController();
  final _name = TextEditingController();

  @override
  void initState() {
    _controller = getIt<RegisterController>();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _name.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: StreamBuilder<RegisterState>(
              stream: _controller.outputRegister,
              builder: (context, state) {
                if (state.data is RegisterStateSuccess) {
                  Navigator.of(context).pop();
                }

                if (state.data is RegisterStateError) {
                  Fluttertoast.showToast(
                    msg: 'Erro ao realizar cadastro',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );

                  Navigator.of(context).pop();
                }

                return Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 48),
                      AppArchInput(
                        label: 'E-mail',
                        controller: _email,
                        isObscure: false,
                      ),
                      const SizedBox(height: 20),
                      AppArchInput(
                        label: 'Senha',
                        controller: _password,
                        isObscure: true,
                      ),
                      const SizedBox(height: 20),
                      AppArchInput(
                        label: 'Nome',
                        controller: _name,
                        isObscure: false,
                      ),
                      const SizedBox(height: 20),
                      AppArchButton(
                        text: 'Cadastrar',
                        action: () {
                          final valid =
                              _formKey.currentState?.validate() ?? false;

                          if (valid) {
                            final newUser = UserEntity(
                              email: _email.text,
                              password: _password.text,
                              name: _name.text,
                            );

                            _controller.inputRegister
                                .add(RegisterUserEvent(newUser: newUser));
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        child: const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Ja é cadastrado?  ',
                              ),
                              TextSpan(
                                text: 'Entrar aqui',
                              ),
                            ],
                          ),
                        ),
                        onTap: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
