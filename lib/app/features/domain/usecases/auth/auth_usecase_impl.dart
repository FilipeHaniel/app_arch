import 'package:app_arch/app/features/domain/entities/user/user_entity.dart';
import 'package:app_arch/app/features/domain/repositories/auth/auth_repository.dart';
import 'package:app_arch/app/features/domain/usecases/auth/auth_usecase.dart';

class AuthUsecaseImpl implements AuthUsecase {
  final AuthRepository _authRepository;

  AuthUsecaseImpl({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<UserEntity> login(String email, String password) {
    return _authRepository.login(email, password);
  }

  @override
  Future<UserEntity> register(UserEntity user) {
    return _authRepository.register(user);
  }

  @override
  Future<UserEntity> validateToken(String token) {
    return _authRepository.validateToken(token);
  }
}
