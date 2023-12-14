import 'package:app_arch/app/app_arch_page.dart';
import 'package:flutter/material.dart';

class AppArchModule extends StatelessWidget {
  const AppArchModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Arch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AppArchPage(),
    );
  }
}
