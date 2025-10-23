import 'package:get/get.dart';
import 'package:room_meeting_app/core/network/api_provider.dart';
import 'package:room_meeting_app/data/repositories/booking_repository.dart';
import 'package:room_meeting_app/data/source/booking_remote_data_source.dart';
import 'package:room_meeting_app/presentation/pages/payment_method/viewmodel/payment_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookingRemoteDataSource(Get.find<ApiProvider>()),
        fenix: true);
    Get.lazyPut(
      () => BookingRepository(Get.find<BookingRemoteDataSource>()),
      fenix: true,
    );

    Get.lazyPut(
      () => PaymentController(Get.find<BookingRepository>()),
      fenix: true,
    );
  }
}
