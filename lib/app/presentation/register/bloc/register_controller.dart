import 'dart:async';
import 'dart:developer';

import 'package:app_arch/app/features/domain/usecases/auth/auth_usecase.dart';
import 'package:app_arch/app/presentation/register/bloc/register_event.dart';
import 'package:app_arch/app/presentation/register/bloc/register_state.dart';

class RegisterController {
  final AuthUsecase _authUsecase;

  RegisterController({required AuthUsecase authUsecase})
      : _authUsecase = authUsecase {
    _inputRegiterController.stream.listen(_registerEventUser);
  }

  final StreamController<RegisterEvent> _inputRegiterController =
      StreamController<RegisterEvent>();

  final StreamController<RegisterState> _outputRegisterController =
      StreamController<RegisterState>();

  Sink<RegisterEvent> get inputRegister => _inputRegiterController.sink;

  Stream<RegisterState> get outputRegister => _outputRegisterController.stream;

  Future<void> _registerEventUser(RegisterEvent event) async {
    try {
      if (event is RegisterUserEvent) {
        await _authUsecase.register(event.newUser);

        _outputRegisterController.add(RegisterStateSuccess());
      }
    } on Exception catch (e, s) {
      log('Erro ao fazer cadastro', error: e, stackTrace: s);

      _outputRegisterController.add(RegisterStateError(exception: e));
    }
  }

  void dispose() {
    _inputRegiterController.close();
    _outputRegisterController.close();
  }
}
