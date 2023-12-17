abstract class RegisterState {}

class RegisterStateSuccess extends RegisterState {}

class RegisterStateError extends RegisterState {
  final Exception exception;

  RegisterStateError({required this.exception});
}
