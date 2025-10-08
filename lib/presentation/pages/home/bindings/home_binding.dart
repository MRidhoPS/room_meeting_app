import 'package:get/get.dart';
import 'package:room_meeting_app/core/network/api_provider.dart';
import 'package:room_meeting_app/data/repositories/room_repository.dart';
import 'package:room_meeting_app/data/source/room_remote_data_source.dart';
import 'package:room_meeting_app/presentation/pages/home/viewmodels/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RoomRemoteDataSource(Get.find<ApiProvider>()),
        fenix: true);
    Get.lazyPut(() => RoomRepository(Get.find<RoomRemoteDataSource>()),
        fenix: true);
    Get.lazyPut(() => HomeController(Get.find<RoomRepository>()), fenix: true);
  }
}
