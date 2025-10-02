import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_meeting_app/core/routes/app_routes.dart';
import 'package:room_meeting_app/presentation/pages/auth/viewmodels/auth_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.find<AuthController>();

    final emailController = TextEditingController();
    final nameController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(hintText: "Name"),
              ),
              TextFormField(
                controller: emailController,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(hintText: "Email"),
              ),
              TextFormField(
                controller: passwordController,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(hintText: "Password"),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () async {
                          await controller.register(
                            fullname: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
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
                                controller.loginResponse.value?.message ?? "",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.white,
                              );
                            }
                            Get.offAllNamed(AppRoutes.login);
                          }
                        },
                  child: controller.isLoading.value
                      ? CircularProgressIndicator()
                      : Text("Register"),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextButton(
                child: Text("Login Here"),
                onPressed: () => Get.offAllNamed(AppRoutes.login),
              ),
            ],
          ),
        ),
      ),
    );
  }
}