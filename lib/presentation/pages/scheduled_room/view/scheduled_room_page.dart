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

        final data = controller.roomAvailability.value;
        if (data == null) {
          return const Center(child: Text('No data available'));
        }

        return Column(
          children: [
            Container(
              margin: EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime(2025),
                lastDate: DateTime(2030),
                onDateChanged: (value) {},
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemCount: data.availability.length,
                itemBuilder: (context, index) {
                  final slot = data.availability[index];
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    color: slot.available ? Colors.green[200] : Colors.red[200],
                    child: ListTile(
                      title: Text(slot.time),
                      trailing: Text(
                        slot.available ? 'Available' : 'Booked',
                        style: TextStyle(
                          color: slot.available ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
