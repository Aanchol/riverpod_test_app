import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_test_app/features/auth/data/datasource/auth_remote_datasource.dart';

import '../../features/auth/data/datasource/auth_api_service.dart';
import '../../features/auth/data/datasource/auth_local_datasource.dart';
import '../../features/auth/data/datasource/auth_local_datasource_impl.dart';
import '../../features/auth/data/datasource/auth_remote_datasource_impl.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/token_usecase.dart';
import '../../features/product/data/datasource/product_datasource.dart';
import '../../features/product/data/datasource/product_datasource_impl.dart';
import '../../features/product/data/datasource/products_api_service.dart';
import '../../features/product/data/repositories/products_repository_impl.dart';
import '../../features/product/domain/repositories/products_repository.dart';
import '../../features/product/domain/usecases/product_details_usecase.dart';
import '../../features/product/domain/usecases/products_usecase.dart';
import '../network/dio_client.dart';
import '../storage/hive_storage.dart';

final getIt = GetIt.instance;

Future<void> setupInjection() async {
  // Dio
  getIt.registerLazySingleton<Dio>(() => DioClient.create());

  // Retrofit
  getIt.registerLazySingleton<ProductsApiService>(
    () => ProductsApiService(getIt<Dio>()),
  );
  getIt.registerLazySingleton<AuthApiService>(
    () => AuthApiService(getIt<Dio>()),
  );

  // DataSource
  getIt.registerLazySingleton<ProductsDataSource>(
    () => ProductsDataSourceImpl(getIt<ProductsApiService>()),
  );
  getIt.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(getIt<AuthApiService>()),
  );
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(getIt<HiveStorage>()),
  );

  // Repository
  getIt.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(getIt<ProductsDataSource>()),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      getIt<AuthRemoteDatasource>(),
      getIt<AuthLocalDataSource>(),
    ),
  );

  // UseCase
  getIt.registerLazySingleton(() => ProductsUseCase(getIt()));
  getIt.registerLazySingleton(() => ProductsDetailsUseCase(getIt()));
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton(() => GetTokenUseCase(getIt()));

  //hive
  getIt.registerLazySingleton<HiveStorage>(() => HiveStorage.instance);
}
