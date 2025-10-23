import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_meeting_app/core/routes/app_routes.dart';
import 'package:room_meeting_app/presentation/pages/payment_method/viewmodel/payment_controller.dart';

class SuccessPage extends GetView<PaymentController> {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {

    final response = Get.arguments;
    print("this is response args: ${response.id}");

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Successful Booking",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
            const SizedBox(height: 10),

         if (response != null) ...[
            const Text(
              "Show Your Booking ID",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(color: Colors.black12, offset: Offset(2, 5))
                ]
              ),
              child: Center(
                child: Text(
                  "Booking ID: ${response.id}",
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ),
          ] else ...[
            const Text("No response data received."),
          ],

          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade800,
                ),
                onPressed: () {
                  Get.offAllNamed(AppRoutes.home);
                },
                child: Text(
                  "Done",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
