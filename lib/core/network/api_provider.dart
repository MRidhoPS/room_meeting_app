import 'package:dio/dio.dart';
import 'package:room_meeting_app/core/storage/local_storage.dart';
import 'dart:html' as html;

class ApiProvider {
  late Dio dio;

  ApiProvider() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await LocalStorage.getToken();

          if (token != null && token.isNotEmpty) {
            options.headers['x-access-token'] = token;
            html.window.localStorage['token'] = token;
          }

          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
      ),
    );
  }
}
