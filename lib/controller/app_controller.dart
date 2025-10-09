import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:room_meeting_app/core/routes/app_routes.dart';
import 'package:room_meeting_app/presentation/pages/auth/viewmodels/auth_controller.dart';

class AppController extends GetxController {
  final AuthController authController;

  AppController(this.authController);

  @override
  void onReady() async {
    super.onReady();
    await authController.loadToken();
    _redirect();
  }

  void _redirect() {
    if (authController.token.isNotEmpty) {
      Get.offAllNamed(AppRoutes.home);
      print(authController.token);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}

String formatRupiah(String priceString) {
   final number = double.tryParse(priceString) ?? 0.0;

  final formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 0, 
  );
  return formatter.format(number);
}
