import 'package:app_arch/app/features/domain/entities/user/user_entity.dart';

class UserMapper extends UserEntity {
  UserMapper({
    super.id,
    super.name,
    super.email,
    super.password,
    super.sessionToken,
  });

  factory UserMapper.fromMap(Map<String, dynamic> map) {
    return UserMapper(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      sessionToken: map['sessionToken'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'token': sessionToken,
    };
  }
}
