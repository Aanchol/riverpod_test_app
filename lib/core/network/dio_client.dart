// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// final dioProvider = Provider<Dio>((ref) {
//   final dio = Dio(
//     BaseOptions(
//       baseUrl: 'https://dummyjson.com',
//       connectTimeout: const Duration(seconds: 30),
//       receiveTimeout: const Duration(seconds: 30),
//     ),
//   );
//   dio.interceptors.add(
//     PrettyDioLogger(
//       requestHeader: true,
//       requestBody: true,
//       responseBody: true,
//       maxWidth: 90,
//     ),
//   );
//
//   return dio;
// });

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_test_app/core/constants/api_constants.dart';

class DioClient {
  DioClient._();

  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {"Content-Type": "application/json"},
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
      ),
    );

    return dio;
  }
}
