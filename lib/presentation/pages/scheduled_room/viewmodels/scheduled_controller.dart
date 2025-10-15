import 'package:get/get.dart';
import 'package:room_meeting_app/data/models/room_model.dart';
import 'package:room_meeting_app/data/repositories/room_repository.dart';

class RoomAvailabilityController extends GetxController {
  final RoomRepository repository;

  RoomAvailabilityController(this.repository);

  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  RxInt selectedDateIndex = 0.obs;
    Rxn<DateTime> selectedDateValue = Rxn<DateTime>(); 
  RxList<RoomAvailabilityData> roomAvailabilityList =
      <RoomAvailabilityData>[].obs;

  RxList roomBookData = [].obs;
  RxBool isSelected = true.obs;

  void selectedDate() {
    isSelected.value = !isSelected.value;
  }

  // in RoomAvailabilityController

// reactive list for per-slot selection
  RxList<bool> isSelectedList = <bool>[].obs;

// initialize list to exact length (resets to all false)
  void initializeSelectedList(int length) {
    isSelectedList.value = List.generate(length, (_) => false);
  }

// toggle a single index
  void toggleSelected(int index) {
    if (index < 0 || index >= isSelectedList.length) return;
    isSelectedList[index] = !isSelectedList[index];
    isSelectedList.refresh();
  }

// optional: make single-select (uncomment if you want)
  void selectSingleSlot(int index) {
    if (index < 0 || index >= isSelectedList.length) return;
    for (var i = 0; i < isSelectedList.length; i++) {
      isSelectedList[i] = i == index;
    }
    isSelectedList.refresh();
  }

// call this after you assign roomAvailabilityList
// e.g. after roomAvailabilityList.assignAll(result.data)
  void ensureInitForSelectedDay() {
    if (roomAvailabilityList.isEmpty) return;
    final selectedDay = roomAvailabilityList[selectedDateIndex.value];
    initializeSelectedList(selectedDay.availability.length);
  }

// when user changes the date index
  void changeSelectedDate(int index) {
    if (index < 0 || index >= roomAvailabilityList.length) return;
    selectedDateIndex.value = index;
    final selectedDay = roomAvailabilityList[index];
    selectedDateValue.value = DateTime.parse(selectedDay.date);
    initializeSelectedList(roomAvailabilityList[index].availability.length);
  }


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

  void roomBookTempo(String data) async {
    try {
      if (data.isEmpty) return;

      roomBookData.add(data);

      print(roomBookData);
    } catch (e) {
      print(e);
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
