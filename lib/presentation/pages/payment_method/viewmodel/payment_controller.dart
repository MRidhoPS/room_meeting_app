import 'package:get/get.dart';
import 'package:room_meeting_app/data/models/booking_model.dart';
import 'package:room_meeting_app/data/repositories/booking_repository.dart';

class PaymentController extends GetxController {

  final BookingRepository bookingRepository;
  PaymentController(this.bookingRepository);

  var selectedPayment = ''.obs;
  var isLoading = false.obs;
  var bookingResponse = Rxn<BookingResponse>();
  var errorMessage = ''.obs;

  void selectPayment(String title) {
    selectedPayment.value = title;
  }

  Future<dynamic> bookingRoom(BookingModel bookingModel) async{
    try {
      isLoading.value = true;
      final response = await bookingRepository.bookingRoom(bookingModel);

      bookingResponse.value = response;

      return response;
      
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
