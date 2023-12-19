import 'package:app_arch/app/features/domain/entities/user/user_login_entity.dart';

abstract class LoginEvent {}

class LoginUserEvent extends LoginEvent {
  final UserLoginEntity enterUserLogin;

  LoginUserEvent({required this.enterUserLogin});
}
