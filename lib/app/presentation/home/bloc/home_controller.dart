import 'dart:async';
import 'dart:developer';

import 'package:app_arch/app/core/constants/token_keys.dart';
import 'package:app_arch/app/core/network/local_storage.dart';
import 'package:app_arch/app/presentation/home/bloc/home_event.dart';
import 'package:app_arch/app/presentation/home/bloc/home_state.dart';

class HomeController {
  final _localStorage = LocalStorage();

  HomeController() {
    _inputHomeController.stream.listen(_logoutUser);
  }

  final StreamController<HomeEvent> _inputHomeController =
      StreamController<HomeEvent>();

  final StreamController<HomeState> _outputHomeController =
      StreamController<HomeState>();

  Sink<HomeEvent> get inputHome => _inputHomeController.sink;

  Stream<HomeState> get outputHome => _outputHomeController.stream;

  Future<void> _logoutUser(HomeEvent event) async {
    try {
      if (event is HomeEventLogoutUser) {
        await _localStorage.removeStorageData(key: TokenKeys.userToken);

        _outputHomeController.add(HomeStateLogoutUserSuccess());
      }
    } on Exception catch (e, s) {
      log('Erro ao deslogar usuário', error: e, stackTrace: s);

      _outputHomeController.add(HomeStateLogoutUserError());
    }
  }

  void dispose() {
    _inputHomeController.close();
    _outputHomeController.close();
  }
}
