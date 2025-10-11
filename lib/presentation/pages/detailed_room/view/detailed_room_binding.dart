import 'package:get/get.dart';
import 'package:room_meeting_app/core/network/api_provider.dart';
import 'package:room_meeting_app/data/repositories/room_repository.dart';
import 'package:room_meeting_app/data/source/room_remote_data_source.dart';
import 'package:room_meeting_app/presentation/pages/detailed_room/viewmodels/detailed_room_controller.dart';

class DetailedRoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RoomRemoteDataSource(Get.find<ApiProvider>()),
        fenix: true);
    Get.lazyPut(() => RoomRepository(Get.find<RoomRemoteDataSource>()),
        fenix: true);
    Get.lazyPut(() => DetailedRoomController(Get.find<RoomRepository>()), fenix: true);
  }
}
