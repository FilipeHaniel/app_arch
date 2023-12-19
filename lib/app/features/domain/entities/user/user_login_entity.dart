import 'package:equatable/equatable.dart';
 
class UserLoginEntity extends Equatable {
  String? email;
  String? password;

  UserLoginEntity({
    this.email,
    this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
