import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  String? id;
  String? name;
  String? email;
  String? password;
  String? sessionToken;

  UserEntity({
    this.id,
    this.name,
    this.email,
    this.password,
    this.sessionToken,
  });

  @override
  List<Object?> get props => [id, name, email, password, sessionToken];
}
