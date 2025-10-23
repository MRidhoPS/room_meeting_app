import 'package:room_meeting_app/data/models/booking_model.dart';
import 'package:room_meeting_app/data/source/booking_remote_data_source.dart';

class BookingRepository {
  final BookingRemoteDataSource bookingRemoteDataSource;

  BookingRepository(this.bookingRemoteDataSource);

  Future<BookingResponse> bookingRoom(BookingModel bookingModel) async {
    return bookingRemoteDataSource.bookingRoom(bookingModel);
  }
}
