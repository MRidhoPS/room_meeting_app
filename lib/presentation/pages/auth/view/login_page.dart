import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_meeting_app/core/routes/app_routes.dart';
import 'package:room_meeting_app/presentation/pages/auth/viewmodels/auth_controller.dart';

import '../../../widgets/common_components.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    final controller = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 249, 255, 1),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Log In",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Log in to access your account",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.black54),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              controller: emailController,
              title: "Email",
            ),
            CustomTextField(
              controller: passwordController,
              title: "Password",
              isPassword: true,
              toggleVisibility: controller.togglePassword,
              isHidden: controller.isHidden,
            ),
            const SizedBox(
              height: 13,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Obx(() => PrimaryButton(
                      text: "Login",
                      isLoading: controller.isLoading.value,
                      onPressed: controller.isLoading.value
                          ? null
                          : () async {
                              await controller.login(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );

                              if (controller.errorMessage.isNotEmpty) {
                                if (!Get.testMode) {
                                  Get.snackbar(
                                    "Error",
                                    controller.errorMessage.value,
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.white,
                                  );
                                }
                              } else {
                                if (!Get.testMode) {
                                  Get.snackbar(
                                    "Success",
                                    controller.loginResponse.value?.message ??
                                        "",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.white,
                                  );
                                }
                                emailController.dispose();
                                passwordController.dispose();
                                print("Tap Primary button ✅");
                                Get.offAllNamed(AppRoutes.home);
                              }
                            },
                    ))),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: const OrDivider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: SizedBox(
                width: double.infinity,
                height: 30,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Google",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(color: Colors.black45, fontSize: 12),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.register),
                  child: const Text(
                    "Register here",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
