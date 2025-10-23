import 'package:dio/dio.dart';
import 'package:room_meeting_app/core/network/api_endpoint.dart';
import 'package:room_meeting_app/core/network/api_provider.dart';
import 'package:room_meeting_app/data/models/booking_model.dart';

class BookingRemoteDataSource {
  final ApiProvider apiProvider;

  BookingRemoteDataSource(this.apiProvider);

  Future<BookingResponse> bookingRoom(BookingModel bookingModel) async {
    try {
      final response = await apiProvider.dio.post(
        ApiEndPoint.bookingUrl,
        data: bookingModel.toJson(),
      );

      print("Payload: ${bookingModel.toJson()}");
      return BookingResponse.fromJson(response.data['data']);
    } on DioException catch (e) {
      print(e.response?.data);
      throw Exception(e.response?.data['message'] ?? "Register failed");
    }
  }
}
