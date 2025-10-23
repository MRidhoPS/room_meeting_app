import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:room_meeting_app/presentation/pages/payment_method/viewmodel/payment_controller.dart';

class PaymentMethodComponents extends StatelessWidget {
  const PaymentMethodComponents({
    super.key,
    required this.controller,
  });

  final PaymentController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleComponents(
            title: "Payment Method:",
          ),
          Obx(
            () {
              if (controller.selectedPayment.value.isEmpty) {
                return Text("No Payment Selected");
              }

              return Text(
                controller.selectedPayment.value,
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

class TitleComponents extends StatelessWidget {
  const TitleComponents({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
    );
  }
}
