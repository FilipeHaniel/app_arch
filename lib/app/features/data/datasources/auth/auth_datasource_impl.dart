import 'package:app_arch/app/core/constants/endpoints.dart';
import 'package:app_arch/app/core/constants/http_methods.dart';
import 'package:app_arch/app/core/network/base_rest.dart';
import 'package:app_arch/app/features/data/datasources/auth/auth_datasource.dart';
import 'package:app_arch/app/features/data/mappers/user_mapper.dart';
import 'package:app_arch/app/features/domain/entities/user/user_entity.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final BaseRest _baseRest;

  AuthDatasourceImpl({required BaseRest baseRest}) : _baseRest = baseRest;

  @override
  Future<UserEntity> login(String email, String password) async {
    final response = await _baseRest.restDioRequest(
      url: ForAppEndpoints.signin,
      method: HttpMethods.post,
      body: {
        'email': email,
        'password': password,
      },
    );

    final result = UserMapper.fromMap(response['result']);

    return result;
  }

  @override
  Future<UserEntity> register(UserEntity user) async {
    UserMapper? userMapper;

    final response = await _baseRest.restDioRequest(
      url: ForAppEndpoints.signup,
      method: HttpMethods.post,
      body: userMapper!.toMap(),
    );

    final result = UserMapper.fromMap(response['result']);

    return result;
  }

  @override
  Future<UserEntity> validateToken(String token) async {
    final response = await _baseRest.restDioRequest(
      url: ForAppEndpoints.validateToken,
      method: HttpMethods.post,
      headers: {
        'X-Parse-Session-Token': token,
      },
    );

    final result = UserMapper.fromMap(response['result']);

    return result;
  }
}
