import 'dart:async';
import 'dart:developer';

import 'package:app_arch/app/core/constants/token_keys.dart';
import 'package:app_arch/app/core/network/local_storage.dart';
import 'package:app_arch/app/features/domain/usecases/auth/auth_usecase.dart';
import 'package:app_arch/app/presentation/splash/bloc/splash_event.dart';
import 'package:app_arch/app/presentation/splash/bloc/splash_state.dart';

class SplashController {
  final AuthUsecase _authUsecase;

  final _localStorage = LocalStorage();

  SplashController({required AuthUsecase authUsecase})
      : _authUsecase = authUsecase {
    _inputSplashController.stream.listen(_validateUserToEnterInApp);
  }

  final StreamController<SplashEvent> _inputSplashController =
      StreamController<SplashEvent>();

  final StreamController<SplashState> _outputSplahController =
      StreamController<SplashState>();

  Sink<SplashEvent> get inputSplash => _inputSplashController.sink;

  Stream<SplashState> get outputSplah => _outputSplahController.stream;

  Future<void> _validateUserToEnterInApp(SplashEvent event) async {
    try {
      if (event is SplashEventUser) {
        final token =
            await _localStorage.getStorageData(key: TokenKeys.userToken);

        final hasToken = token != null;

        if (!hasToken) {
          _outputSplahController.add(SplashStateError());
          return;
        }

        await _authUsecase.validateToken(token);

        _outputSplahController.add(SplashStateSuccess());
      }
    } on Exception catch (e, s) {
      log('Erro ao carregar user token', error: e, stackTrace: s);
    }
  }

  void dispose() {
    _inputSplashController.close();
    _outputSplahController.close();
  }
}
