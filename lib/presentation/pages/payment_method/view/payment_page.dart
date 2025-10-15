import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_meeting_app/core/routes/app_routes.dart';
import 'package:room_meeting_app/presentation/pages/payment_method/viewmodel/payment_controller.dart';

class PaymentPage extends GetView<PaymentController> {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Text(
                "Cash",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black45,
                ),
              ),
            ),
            PaymentMethodCard(
              title: 'Cash',
              controller: controller,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Text(
                "Virtual Account",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black45,
                ),
              ),
            ),
            PaymentMethodCard(
              title: 'BCA',
              controller: controller,
            ),
            PaymentMethodCard(
              title: 'Mandiri',
              controller: controller,
            ),
            PaymentMethodCard(
              title: 'BRI',
              controller: controller,
            ),
            const SizedBox(
              height: 40,
            ),
            Obx(
              () {
                if (controller.selectedPayment.value.isEmpty) {
                  return const SizedBox();
                }

                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade800,
                      ),
                      onPressed: () {
                        debugPrint(
                            'value payment method: ${controller.selectedPayment.value}');
                        Get.toNamed(AppRoutes.paymentDetailedRoom);
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
              },
            )
          ],
        ),
      ),
    );
  }
}

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({
    super.key,
    required this.title,
    required this.controller,
  });

  final String title;
  final PaymentController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.selectPayment(title),
      child: Obx(() {
        final isSelected = controller.selectedPayment.value == title;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: isSelected ? Colors.green.shade800 : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? Colors.green.shade800 : Colors.lightGreen,
              width: 2,
            ),
          ),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Colors.black54,
            ),
          ),
        );
      }),
    );
  }
}
