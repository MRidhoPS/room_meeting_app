import 'package:get/get.dart';
import 'package:room_meeting_app/controller/app_controller.dart';
import 'package:room_meeting_app/presentation/pages/auth/bindings/auth_binding.dart';
import 'package:room_meeting_app/presentation/pages/auth/viewmodels/auth_controller.dart';

class SplashBinding extends AuthBinding {
  @override
  void dependencies() {
    super.dependencies();

    final authController = Get.find<AuthController>();
    Get.put(AppController(authController));
  }
}
