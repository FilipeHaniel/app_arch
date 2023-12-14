import 'package:app_arch/app/app_arch_page.dart';
import 'package:app_arch/app/core/ui/theme/app_arch_theme.dart';
import 'package:flutter/material.dart';

class AppArchModule extends StatelessWidget {
  const AppArchModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Arch',
      debugShowCheckedModeBanner: false,
      theme: AppArchTheme.theme,
      home: const AppArchPage(),
    );
  }
}
