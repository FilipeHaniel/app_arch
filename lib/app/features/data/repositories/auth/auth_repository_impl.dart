import 'package:app_arch/app/features/data/datasources/auth/auth_datasource.dart';
import 'package:app_arch/app/features/domain/repositories/auth/auth_repository.dart';
import 'package:app_arch/app/features/domain/entities/user/user_entity.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _authDatasource;

  AuthRepositoryImpl({required AuthDatasource authDatasource})
      : _authDatasource = authDatasource;

  @override
  Future<UserEntity> login(String email, String password) {
    return _authDatasource.login(email, password);
  }

  @override
  Future<UserEntity> register(UserEntity user) {
    return _authDatasource.register(user);
  }

  @override
  Future<UserEntity> validateToken(String token) {
    return _authDatasource.validateToken(token);
  }
}
