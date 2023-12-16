import 'package:app_arch/app/core/constants/routes_url.dart';
import 'package:app_arch/app/core/ui/theme/app_arch_theme.dart';
import 'package:app_arch/app/presentation/login/login_page.dart';
import 'package:app_arch/app/presentation/register/register_page.dart';
import 'package:app_arch/app/presentation/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppArchModule extends StatelessWidget {
  const AppArchModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Arch',
      debugShowCheckedModeBanner: false,
      theme: AppArchTheme.theme,
      initialRoute: RoutesUrl.splash,
      routes: {
        RoutesUrl.splash: (context) => const SplashPage(),
        RoutesUrl.login: (context) => const LoginPage(),
        RoutesUrl.register: (context) => const RegisterPage(),
      },
    );
  }
}
