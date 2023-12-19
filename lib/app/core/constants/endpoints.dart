const String forAppBaseUrl = 'https://parseapi.back4app.com/parse/functions';

abstract class ForAppEndpoints {
  static const String login = '$forAppBaseUrl/login';
  static const String signup = '$forAppBaseUrl/register';
  static const String validateToken = '$forAppBaseUrl/validate-token';
}
