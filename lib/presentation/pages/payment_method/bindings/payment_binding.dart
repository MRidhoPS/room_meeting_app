import 'package:get/get.dart';
import 'package:room_meeting_app/presentation/pages/payment_method/viewmodel/payment_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => PaymentController(),
      fenix: true,
    );
  }
}
