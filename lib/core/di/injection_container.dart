import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/product/data/datasource/product_datasource.dart';
import '../../features/product/data/datasource/product_datasource_impl.dart';
import '../../features/product/data/datasource/products_api_service.dart';
import '../../features/product/data/repositories/products_repository_impl.dart';
import '../../features/product/domain/repositories/products_repository.dart';
import '../../features/product/domain/usecases/product_details_usecase.dart';
import '../../features/product/domain/usecases/products_usecase.dart';
import '../network/dio_client.dart';

final getIt = GetIt.instance;

Future<void> setupInjection() async {
  // Dio
  getIt.registerLazySingleton<Dio>(() => DioClient.create());

  // Retrofit
  getIt.registerLazySingleton<ProductsApiService>(
    () => ProductsApiService(getIt<Dio>()),
  );

  // DataSource
  getIt.registerLazySingleton<ProductsDataSource>(
    () => ProductsDataSourceImpl(getIt<ProductsApiService>()),
  );

  // Repository
  getIt.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(getIt<ProductsDataSource>()),
  );

  // UseCase
  getIt.registerLazySingleton<ProductsUseCase>(
    () => ProductsUseCase(getIt<ProductsRepository>()),
  );
  getIt.registerLazySingleton<ProductsDetailsUseCase>(
    () => ProductsDetailsUseCase(getIt<ProductsRepository>()),
  );
}
