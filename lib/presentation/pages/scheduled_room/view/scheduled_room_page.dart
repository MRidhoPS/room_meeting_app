import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_meeting_app/presentation/pages/scheduled_room/viewmodels/scheduled_controller.dart';

class ScheduledRoomPage extends GetView<RoomAvailabilityController> {
  const ScheduledRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Room Availability')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        final dataList = controller.roomAvailabilityList;
        if (dataList.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        final selectedIndex = controller.selectedDateIndex.value;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- DATE SELECTOR ---
            Container(
              height: 90,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  final date = DateTime.parse(dataList[index].date);
                  final isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      controller
                          .changeSelectedDate(index); // resets selection list
                      debugPrint(
                          'Switched to date index: $index, date: ${dataList[index].date}');
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 80,
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.green[400] : Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color:
                              isSelected ? Colors.green : Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _getWeekdayName(date),
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "${date.day}",
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            _getMonthName(date),
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Available Slots',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // --- TIME SLOT GRID ---
            Expanded(
              child: Obx(() {
                if (controller.roomAvailabilityList.isEmpty)
                  return const SizedBox();

                final selectedDay = controller
                    .roomAvailabilityList[controller.selectedDateIndex.value];

                // Ensure selection list matches slot count
                if (controller.isSelectedList.length !=
                    selectedDay.availability.length) {
                  controller
                      .initializeSelectedList(selectedDay.availability.length);
                }

                return GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 2.4,
                  ),
                  itemCount: selectedDay.availability.length,
                  itemBuilder: (context, index) {
                    final slot = selectedDay.availability[index];
                    // final isAvailable = slot.available;

                    // Check if available (support String or bool)
                    final bool isAvailable = slot.available
                        ? slot.available
                        : slot.available.toString().toLowerCase() ==
                                'available' ||
                            slot.available.toString().toLowerCase() == 'true';

                    final bool isSelected =
                        controller.isSelectedList.length > index
                            ? controller.isSelectedList[index]
                            : false;

                    // Colors for different states
                    final Color bgColor = !isAvailable
                        ? Colors.grey.shade300
                        : isSelected
                            ? Colors.green.shade300
                            : Colors.white;
                    final Color borderColor = !isAvailable
                        ? Colors.grey.shade400
                        : Colors.green.shade600;
                    final Color textColor = !isAvailable
                        ? Colors.grey.shade600
                        : isSelected ? Colors.white : Colors.black;

                    return GestureDetector(
                      onTap: isAvailable
                          ? () {
                              controller.toggleSelected(index);
                              controller.roomBookTempo(slot.time);
                            }
                          : null, // disable tap
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          color: bgColor,
                          border: Border.all(color: borderColor, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            slot.time,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),

            // --- NEXT BUTTON ---
            Obx(() {
              final dataTempo = controller.roomBookData;
              if (dataTempo.isEmpty) return const SizedBox();

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint(
                          'Next pressed, selected times: ${controller.roomBookData}');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade800,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    child: const Text("Next",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
              );
            }),

            const SizedBox(height: 20),
          ],
        );
      }),
    );
  }

  String _getWeekdayName(DateTime date) {
    const weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return weekdays[date.weekday - 1];
  }

  String _getMonthName(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[date.month - 1];
  }
}
