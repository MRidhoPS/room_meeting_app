import 'package:get/get.dart';
import 'package:room_meeting_app/data/models/room_model.dart';
import 'package:room_meeting_app/data/repositories/room_repository.dart';

class HomeController extends GetxController {
  final RoomRepository roomRepository;
  HomeController(this.roomRepository);

  RxBool isLoading = false.obs;
  var getListRoomsData = Rxn<RoomModel>();
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRoom();
  }

  Future<void> fetchRoom() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final result = await roomRepository.getListRooms();
      getListRoomsData.value = result;
      print(
          "✅ Controller set data length: ${getListRoomsData.value?.data.length}");
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
