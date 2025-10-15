import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_meeting_app/presentation/pages/auth/viewmodels/auth_controller.dart';
import 'package:room_meeting_app/presentation/pages/detailed_room/viewmodels/detailed_room_controller.dart';
import 'package:room_meeting_app/presentation/pages/payment_method/viewmodel/payment_controller.dart';
import 'package:room_meeting_app/presentation/pages/scheduled_room/viewmodels/scheduled_controller.dart';

class PaymentDetailedPage extends GetView<PaymentController> {
  const PaymentDetailedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scheduleController = Get.find<RoomAvailabilityController>();
    final authController = Get.find<AuthController>();
    final detailedRoom = Get.find<DetailedRoomController>();

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Obx(
              () {
                if (authController.tokenResponse.value == null) {
                  return Text("No Payment Selected");
                }

                final id = authController.tokenResponse.value;
                return Text(
                  "User id: ${id!['userId']}",
                );
              },
            ),
            Obx(
              () {
                if (controller.selectedPayment.value.isEmpty) {
                  return Text("No Payment Selected");
                }

                return Text(
                  "Payment method: ${controller.selectedPayment.value}",
                );
              },
            ),
            Obx(
              () {
                if (scheduleController.roomBookData.isEmpty) {
                  return Text("No Date Selected");
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Start: ${scheduleController.roomBookData[0].toString().split('-')[0].toString().trim()}'),
                    Text(
                        'End: ${scheduleController.roomBookData[0].toString().split('-')[1].toString().trim()}'),
                    Text(
                      scheduleController.selectedDateValue.value.toString().split(' ')[0].trim(),
                    ),
                  ],
                );
              },
            ),
            Obx(
              () {
                if (detailedRoom.getDetailedRoomResponse.value == null) {
                  return Text("No price");
                }

                final data = detailedRoom.getDetailedRoomResponse.value!.data;
                return Text('${data.id}, ${data.price}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
