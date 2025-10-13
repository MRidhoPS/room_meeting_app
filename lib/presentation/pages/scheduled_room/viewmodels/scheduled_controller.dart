import 'package:get/get.dart';
import 'package:room_meeting_app/data/models/room_model.dart';
import 'package:room_meeting_app/data/repositories/room_repository.dart';

class RoomAvailabilityController extends GetxController {
  final RoomRepository repository;

  RoomAvailabilityController(this.repository);

  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  RxInt selectedDateIndex = 0.obs;
  RxList<RoomAvailabilityData> roomAvailabilityList =
      <RoomAvailabilityData>[].obs;


  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args != null) {
      getRoomAvailability(
        roomId: args['id'],
        date: args['date'].toString(),
      );
    }
  }

  Future<void> getRoomAvailability({
    required int roomId,
    required String date, // make optional
  }) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final result = await repository.getScheduledRoom(id: roomId, date: date);

      // Because `result.data` is now a list
      roomAvailabilityList.assignAll(result.data);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
