import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:room_meeting_app/core/routes/app_routes.dart';
import 'package:room_meeting_app/data/models/booking_model.dart';
import 'package:room_meeting_app/presentation/pages/auth/viewmodels/auth_controller.dart';
import 'package:room_meeting_app/presentation/pages/detailed_room/viewmodels/detailed_room_controller.dart';
import 'package:room_meeting_app/presentation/pages/payment_method/viewmodel/payment_controller.dart';
import 'package:room_meeting_app/presentation/pages/scheduled_room/viewmodels/scheduled_controller.dart';

Padding buttonPaymentDetailedComponents(
    AuthController authController,
    DetailedRoomController detailedRoom,
    RoomAvailabilityController scheduleController,
    PaymentController controller) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green.shade800,
        ),
        onPressed: () async {
          final token = authController.tokenResponse.value;
          final userId = token?['userId'] ?? 0;

          final detail = detailedRoom.getDetailedRoomResponse.value?.data;
          final roomId = detail?.id ?? 0;
          final totalPrice = detail?.price ?? "0";

          final date = scheduleController.selectedDateValue.value
              .toString()
              .split(' ')[0]
              .trim();

          final time = scheduleController.roomBookData.isNotEmpty
              ? scheduleController.roomBookData[0].toString().split('-')
              : ["", ""];

          final startTime = time[0].trim();
          final endTime = time[1].trim();

          final paymentMethod = controller.selectedPayment.value;

          // create booking model
          final booking = BookingModel(
            userId: userId,
            roomId: roomId,
            paymentMethod: paymentMethod,
            date: date,
            startTime: startTime,
            endTime: endTime,
            totalPrice: int.parse(totalPrice.toString()),
          );

          await controller.bookingRoom(booking);

          debugPrint('Booking created: $booking');
          Get.offAllNamed(AppRoutes.successRoom,
              arguments: controller.bookingResponse.value);
        },
        child: Text(
          "Next",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
    ),
  );
}
