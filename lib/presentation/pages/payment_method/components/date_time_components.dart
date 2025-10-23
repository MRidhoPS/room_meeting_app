import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:room_meeting_app/presentation/pages/payment_method/components/payment_method_components.dart';
import 'package:room_meeting_app/presentation/pages/scheduled_room/viewmodels/scheduled_controller.dart';

SizedBox dateTimeComponents(RoomAvailabilityController scheduleController) {
  return SizedBox(
    width: double.infinity,
    height: 80,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleComponents(title: "Time:"),
            Obx(
              () {
                if (scheduleController.roomBookData.isEmpty) {
                  return Text("No Date Selected");
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      scheduleController.roomBookData[0].toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleComponents(title: "Date:"),
            Text(
              scheduleController.selectedDateValue.value
                  .toString()
                  .split(' ')[0]
                  .trim(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
