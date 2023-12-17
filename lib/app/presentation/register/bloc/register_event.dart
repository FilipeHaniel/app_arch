import 'package:app_arch/app/features/domain/entities/user/user_entity.dart';

abstract class RegisterEvent {}

class RegisterUserEvent extends RegisterEvent {
  final UserEntity newUser;

  RegisterUserEvent({required this.newUser});
}
