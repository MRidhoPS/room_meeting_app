import 'package:dio/dio.dart';
import 'package:room_meeting_app/core/network/api_endpoint.dart';
import 'package:room_meeting_app/core/network/api_provider.dart';
import 'package:room_meeting_app/data/models/auth_model.dart';
import 'package:room_meeting_app/data/models/auth_response.dart';

class AuthRemoteDataSource {
  final ApiProvider apiProvider;

  AuthRemoteDataSource(this.apiProvider);

  Future<AuthRegisterResponse> register(AuthModel authModel) async {
    try {
      final response = await apiProvider.dio.post(
        ApiEndPoint.registerUrl,
        data: authModel.toJson(),
      );

      print("Payload: ${authModel.toJson()}");
      return AuthRegisterResponse.fromJson(response.data);
    } on DioException catch (e) {
      print(e.response?.data);
      throw Exception(e.response?.data['message'] ?? "Register failed");
    }
  }

  Future<AuthLoginResponse> login(AuthLoginModel authLoginModel) async {
    try {
      final response = await apiProvider.dio
          .post(ApiEndPoint.loginUrl, data: authLoginModel.toJson());

      return AuthLoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      print(e.response?.data);
      throw Exception(e.response?.data['message'] ?? "Login failed");
    }
  }
}
