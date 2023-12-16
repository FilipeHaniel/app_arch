import 'dart:developer';

import 'package:dio/dio.dart';

class BaseRest {
  Future<Map> restDioRequest({
    required String url,
    required String method,
    Map? headers,
    Map? body,
  }) async {
    Dio dio = Dio();

    final requestHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
        'X-Parse-Application-Id': 'GqIJtD7jltMmLIToR08fqx9esjSEQ5NybMLZKmYt',
        'X-Parse-REST-API-Key': 'K8pdIjvd6k4ijbmHut4hCuyZu1J7sSnVKtR635Cl',
      });

    try {
      Response response = await dio.request(
        url,
        options: Options(
          headers: requestHeaders,
          method: method,
        ),
        data: body,
      );

      return response.data;
    } on DioException catch (e, s) {
      log('Dio Connection Error -->', error: e, stackTrace: s);
      return e.response?.data ?? {};
    } on Exception catch (e, s) {
      log('Error -->', error: e, stackTrace: s);
      return {};
    } 
  }
}
