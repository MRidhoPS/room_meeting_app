import 'package:get/get.dart';

class PaymentController extends GetxController {
  var selectedPayment = ''.obs;

  void selectPayment(String title) {
    selectedPayment.value = title;
  }
}
