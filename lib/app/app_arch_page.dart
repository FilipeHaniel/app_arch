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
      appBar: AppBar(title: const Text('tela principal')),
      body: Container(),
    );
  }
}
