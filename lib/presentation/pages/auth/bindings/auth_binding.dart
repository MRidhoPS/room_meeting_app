import 'package:get/get.dart';
import 'package:room_meeting_app/core/network/api_provider.dart';
import 'package:room_meeting_app/data/repositories/auth_repository.dart';
import 'package:room_meeting_app/data/source/auth_remote_data_source.dart';
import 'package:room_meeting_app/presentation/pages/auth/viewmodels/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => AuthRemoteDataSource(Get.find<ApiProvider>()),
        fenix: true);
    Get.lazyPut(() => AuthRepository(Get.find<AuthRemoteDataSource>()),
        fenix: true);
    Get.lazyPut(() => AuthController(Get.find<AuthRepository>()), fenix: true);
  }
}
