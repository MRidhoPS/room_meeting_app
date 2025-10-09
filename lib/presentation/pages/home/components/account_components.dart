import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_meeting_app/presentation/pages/auth/viewmodels/auth_controller.dart';

class AccountComponents extends StatelessWidget {
  const AccountComponents({
    super.key,
    required this.profileController,
  });

  final AuthController profileController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.green,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () {
                if (profileController.isLoading.value) {
                  return CircularProgressIndicator();
                }

                final profile = profileController.tokenResponse.value;

                if (profile == null) {
                  return Text(
                    "No data",
                    style: TextStyle(color: Colors.white),
                  );
                }

                return Text(
                  "Halo, ${profile['username']}",
                  style: TextStyle(
                    color: Colors.black45,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Get Best Room!",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
