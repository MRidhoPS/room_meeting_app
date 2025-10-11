import 'package:dio/dio.dart';
import 'package:room_meeting_app/core/network/api_endpoint.dart';
import 'package:room_meeting_app/core/network/api_provider.dart';
import 'package:room_meeting_app/data/models/room_model.dart';

class RoomRemoteDataSource {
  final ApiProvider apiProvider;

  RoomRemoteDataSource(this.apiProvider);

  Future<RoomModel> getListRooms() async {
    try {
      final result = await apiProvider.dio.get(ApiEndPoint.roomUrl);

      print("Call APi: $result");

      return RoomModel.fromJson(result.data);
    } on DioException catch (e) {
      print(e.response?.data);
      throw Exception(e.response?.data['message'] ?? "Error");
    }
  }

  Future<RoomDetailedModel> getDetailedRoom({
    required int id,
  }) async {
    try {
      final result = await apiProvider.dio.get("${ApiEndPoint.roomUrl}/$id");

      return RoomDetailedModel.fromJson(result.data);
    } on DioException catch (e) {
      print(e.response?.data);
      throw Exception(e.response?.data['message'] ?? "Error");
    }
  }

  Future<RoomAvailabilityModel> getScheduledRoom({
    required int id,
     required String date,
  }) async{
    try {
      final result = await apiProvider.dio.get("${ApiEndPoint.roomUrl}/$id/availability", queryParameters: {
        'date': date,
      });

      return RoomAvailabilityModel.fromJson(result.data);
     } on DioException catch (e) {
      print(e.response?.data);
      throw Exception(e.response?.data['message'] ?? "Error");
    }
  }
}
