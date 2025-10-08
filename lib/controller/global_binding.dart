import 'package:get/get.dart';
import 'package:room_meeting_app/core/network/api_provider.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiProvider(), permanent: true); 
  }
}
