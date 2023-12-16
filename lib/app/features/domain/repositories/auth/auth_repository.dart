import 'package:app_arch/app/features/domain/entities/user/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login(String email, String password);
  Future<UserEntity> register(UserEntity user);
  Future<UserEntity> validateToken(String token);
}
