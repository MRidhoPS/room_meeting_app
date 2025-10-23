import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:room_meeting_app/controller/app_controller.dart';
import 'package:room_meeting_app/presentation/pages/detailed_room/viewmodels/detailed_room_controller.dart';
import 'package:room_meeting_app/presentation/pages/payment_method/components/payment_method_components.dart';

class NameTotalPriceComponents extends StatelessWidget {
  const NameTotalPriceComponents({
    super.key,
    required this.detailedRoom,
  });

  final DetailedRoomController detailedRoom;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleComponents(title: "Name & Total Price:"),
          Obx(
            () {
              if (detailedRoom.getDetailedRoomResponse.value == null) {
                return Text("No price");
              }

              final data = detailedRoom.getDetailedRoomResponse.value!.data;
              return Text(
                '${data.name}, ${formatRupiah(
                  data.price.toString(),
                )}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
