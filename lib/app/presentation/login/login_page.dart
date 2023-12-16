import 'package:app_arch/app/core/constants/routes_url.dart';
import 'package:app_arch/app/core/ui/widgets/app_arch_button.dart';
import 'package:app_arch/app/core/ui/widgets/app_arch_input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'login',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            child: Column(
              children: [
                const SizedBox(height: 48),
                AppArchInput(
                  label: 'E-mail',
                  controller: TextEditingController(),
                  isObscure: false,
                ),
                const SizedBox(height: 20),
                AppArchInput(
                  label: 'Senha',
                  controller: TextEditingController(),
                  isObscure: true,
                ),
                const SizedBox(height: 20),
                AppArchButton(
                  text: 'Entrar',
                  action: () {},
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
                  onTap: () =>
                      Navigator.of(context).pushNamed(RoutesUrl.register),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
