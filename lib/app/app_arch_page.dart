import 'package:app_arch/app/core/ui/widgets/app_arch_button.dart';
import 'package:app_arch/app/core/ui/widgets/app_arch_input.dart';
import 'package:flutter/material.dart';

class AppArchPage extends StatefulWidget {
  const AppArchPage({super.key});

  @override
  State<AppArchPage> createState() => _AppArchPageState();
}

class _AppArchPageState extends State<AppArchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Tela principal',
        style: TextStyle(color: Colors.black),
      )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Olá User'),
              const SizedBox(height: 15),
              AppArchInput(
                label: 'Nome',
                controller: TextEditingController(),
                isObscure: false,
              ),
              const SizedBox(height: 15),
              const AppArchButton(text: 'Entrar'),
            ],
          ),
        ),
      ),
    );
  }
}
