import 'package:app_arch/app/app_arch_injection.dart';
import 'package:app_arch/app/core/constants/routes_url.dart';
import 'package:app_arch/app/presentation/splash/bloc/splash_controller.dart';
import 'package:app_arch/app/presentation/splash/bloc/splash_event.dart';
import 'package:app_arch/app/presentation/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final SplashController _controller;

  @override
  void initState() {
    _controller = getIt<SplashController>();

    _controller.inputSplash.add(SplashEventUser());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SplashState>(
        stream: _controller.outputSplah,
        builder: (context, snapshot) {
          if (snapshot.data is SplashStateSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              Navigator.of(context).pushReplacementNamed(RoutesUrl.home);
            });
          }

          if (snapshot.data is SplashStateError) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              Navigator.of(context).pushNamed(RoutesUrl.login);
            });
          }

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Center(
                child: Image.asset('assets/images/accenture_logo.png'),
              ),
            ),
          );
        });
  }
}
