import 'package:app_arch/app/features/domain/entities/user/user_entity.dart';

class UserMapper {

  UserEntity fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      sessionToken: map['sessionToken'] ?? '',
    );
  }

  Map<String, dynamic> toMap(UserEntity userEntity) {
    return {
      'id': userEntity.id,
      'name': userEntity.name,
      'email': userEntity.email,
      'password': userEntity.password,
      'token': userEntity.sessionToken,
    };
  }
}
