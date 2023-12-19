import 'package:app_arch/app/core/constants/routes_url.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushNamed(RoutesUrl.login);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Image.asset('assets/images/accenture_logo.png'),
        ),
      ),
    );
  }
}
