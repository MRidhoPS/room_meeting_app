import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_meeting_app/presentation/pages/auth/viewmodels/auth_controller.dart';
import 'package:room_meeting_app/presentation/pages/detailed_room/viewmodels/detailed_room_controller.dart';
import 'package:room_meeting_app/presentation/pages/payment_method/components/button_payment_components.dart';
import 'package:room_meeting_app/presentation/pages/payment_method/components/date_time_components.dart';
import 'package:room_meeting_app/presentation/pages/payment_method/components/name_totalprice_components.dart';
import 'package:room_meeting_app/presentation/pages/payment_method/components/payment_method_components.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PaymentMethodComponents(controller: controller),
              dateTimeComponents(scheduleController),
              NameTotalPriceComponents(detailedRoom: detailedRoom),
              buttonPaymentDetailedComponents(
                authController,
                detailedRoom,
                scheduleController,
                controller,
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}




