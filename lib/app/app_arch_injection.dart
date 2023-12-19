import 'package:app_arch/app/core/network/base_rest.dart';
import 'package:app_arch/app/features/data/datasources/auth/auth_datasource.dart';
import 'package:app_arch/app/features/data/datasources/auth/auth_datasource_impl.dart';
import 'package:app_arch/app/features/data/repositories/auth/auth_repository_impl.dart';
import 'package:app_arch/app/features/domain/repositories/auth/auth_repository.dart';
import 'package:app_arch/app/features/domain/usecases/auth/auth_usecase.dart';
import 'package:app_arch/app/features/domain/usecases/auth/auth_usecase_impl.dart';
import 'package:app_arch/app/presentation/login/bloc/login_controller.dart';
import 'package:app_arch/app/presentation/register/bloc/register_controller.dart';
import 'package:app_arch/app/presentation/splash/bloc/splash_controller.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class AppArchInjection {
  Future<void> startApp() async {
    getIt.registerLazySingleton(() => BaseRest());

    getIt.registerLazySingleton<AuthDatasource>(
        () => AuthDatasourceImpl(baseRest: getIt()));

    getIt.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(authDatasource: getIt()));

    getIt.registerLazySingleton<AuthUsecase>(
        () => AuthUsecaseImpl(authRepository: getIt()));

    getIt.registerLazySingleton(() => RegisterController(authUsecase: getIt()));

    getIt.registerLazySingleton(() => LoginController(authUsecase: getIt()));

    getIt.registerLazySingleton(() => SplashController(authUsecase: getIt()));
  }
}
