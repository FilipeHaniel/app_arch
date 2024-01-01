import 'dart:developer';

import 'package:app_arch/app/app_arch_injection.dart';
import 'package:app_arch/app/core/constants/routes_url.dart';
import 'package:app_arch/app/presentation/home/bloc/home_controller.dart';
import 'package:app_arch/app/presentation/home/bloc/home_event.dart';
import 'package:app_arch/app/presentation/home/bloc/home_state.dart';
import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _controller;

  @override
  void initState() {
    _controller = getIt<HomeController>();

    super.initState();
  }

  @override
  void dispose() {

    _controller.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<HomeState>(
        stream: _controller.outputHome,
        builder: (context, snapshot) {
          if (snapshot.data is HomeStateLogoutUserSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              log('Usuário deslogado com sucesso');

              Navigator.of(context).pushReplacementNamed(RoutesUrl.login);
            });
          }

          if (snapshot.data is HomeStateLogoutUserError) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              AsukaSnackbar.alert('Falha ao deslogar no App').show();
            });
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  icon: const Icon(FeatherIcons.logOut),
                  onPressed: () =>
                      _controller.inputHome.add(HomeEventLogoutUser()),
                ),
              ],
            ),
            body: Container(),
          );
        });
  }
}
