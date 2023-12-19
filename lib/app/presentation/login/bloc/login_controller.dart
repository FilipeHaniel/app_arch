import 'dart:async';
import 'dart:developer';

import 'package:app_arch/app/core/constants/token_keys.dart';
import 'package:app_arch/app/core/network/local_storage.dart';
import 'package:app_arch/app/features/domain/usecases/auth/auth_usecase.dart';
import 'package:app_arch/app/presentation/login/bloc/login_event.dart';
import 'package:app_arch/app/presentation/login/bloc/login_state.dart';

class LoginController {
  final AuthUsecase _authUsecase;

  final _localStorage = LocalStorage();

  LoginController({required AuthUsecase authUsecase})
      : _authUsecase = authUsecase {
    _inputLoginController.stream.listen(_loginEventUser);
  }

  final StreamController<LoginEvent> _inputLoginController =
      StreamController<LoginEvent>();

  final StreamController<LoginState> _outputLoginController =
      StreamController<LoginState>();

  Sink<LoginEvent> get inputLogin => _inputLoginController.sink;

  Stream<LoginState> get outputLogin => _outputLoginController.stream;

  Future<void> _loginEventUser(LoginEvent event) async {
    try {
      if (event is LoginUserEvent) {
        final user = await _authUsecase.login(
            event.enterUserLogin.email!, event.enterUserLogin.password!);

        await _localStorage.saveStorageData(
            key: TokenKeys.userToken, data: user.sessionToken!);

        _outputLoginController.add(LoginStateSuccess());
      }
    } on Exception catch (e, s) {
      log('Erro ao logar usuário', error: e, stackTrace: s);
      _outputLoginController.add(LoginStateError());
    }
  }

  void dispose() {
    _inputLoginController.close();
    _outputLoginController.close();
  }
}
