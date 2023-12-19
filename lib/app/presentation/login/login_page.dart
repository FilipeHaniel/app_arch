import 'package:app_arch/app/app_arch_injection.dart';
import 'package:app_arch/app/core/constants/routes_url.dart';
import 'package:app_arch/app/core/ui/widgets/app_arch_button.dart';
import 'package:app_arch/app/core/ui/widgets/app_arch_input.dart';
import 'package:app_arch/app/features/domain/entities/user/user_login_entity.dart';
import 'package:app_arch/app/presentation/login/bloc/login_controller.dart';
import 'package:app_arch/app/presentation/login/bloc/login_event.dart';
import 'package:app_arch/app/presentation/login/bloc/login_state.dart';
import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController _controller;

  final _formKey = GlobalKey<FormState>();

  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void initState() {
    _controller = getIt<LoginController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<LoginState>(
        stream: _controller.outputLogin,
        builder: (context, snapshot) {
          if (snapshot.data is LoginStateSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              AsukaSnackbar.success('Usuário logado com sucesso').show();

              Navigator.of(context).pushNamedAndRemoveUntil(
                RoutesUrl.home,
                (route) => false,
              );
            });
          }

          if (snapshot.data is LoginStateError) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              AsukaSnackbar.alert('Falha ao logar no App').show();
            });
          }

          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 48),
                        Image.asset('assets/images/accenture_logo.png'),
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
                        AppArchButton(
                          text: 'Entrar',
                          action: () {
                            final valid =
                                _formKey.currentState?.validate() ?? false;

                            if (valid) {
                              final userLogin = UserLoginEntity(
                                email: _email.text,
                                password: _password.text,
                              );

                              _controller.inputLogin.add(
                                  LoginUserEvent(enterUserLogin: userLogin));
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          child: const Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Não é cadastrado?  ',
                                ),
                                TextSpan(
                                  text: 'Cadastre-se aqui',
                                ),
                              ],
                            ),
                          ),
                          onTap: () => Navigator.of(context)
                              .pushNamed(RoutesUrl.register),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
