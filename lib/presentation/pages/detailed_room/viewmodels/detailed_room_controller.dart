import 'package:get/get.dart';
import 'package:room_meeting_app/data/models/room_model.dart';
import 'package:room_meeting_app/data/repositories/room_repository.dart';

class DetailedRoomController extends GetxController {
  final RoomRepository roomRepository;
  DetailedRoomController(this.roomRepository);

  RxBool isLoading = false.obs;
  var getDetailedRoomResponse = Rxn<RoomDetailedModel>();
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    final id = Get.arguments;
    getDetailedRoom(id: id);
  }

  Future<void> getDetailedRoom({required int id}) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await roomRepository.getDetailedRoom(id: id);
      getDetailedRoomResponse.value = response;
      print(response.data);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
