import 'package:app_arch/app/core/network/base_rest.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class AppArchInjection {
  Future<void> startApp() async {
    getIt.registerLazySingleton(() => BaseRest());
  }
}
