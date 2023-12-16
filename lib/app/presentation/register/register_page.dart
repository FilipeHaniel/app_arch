import 'package:app_arch/app/core/ui/widgets/app_arch_button.dart';
import 'package:app_arch/app/core/ui/widgets/app_arch_input.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                AppArchInput(
                  label: 'Nome',
                  controller: TextEditingController(),
                  isObscure: false,
                ),
                const SizedBox(height: 20),
                AppArchButton(
                  text: 'Cadastrar',
                  action: () {},
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
          ),
        ),
      ),
    );
  }
}
