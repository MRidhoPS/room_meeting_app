import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_meeting_app/core/routes/app_routes.dart';
import 'package:room_meeting_app/presentation/pages/auth/viewmodels/auth_controller.dart';
import 'package:room_meeting_app/presentation/widgets/common_components.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();

    final emailController = TextEditingController();
    final nameController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 249, 255, 1),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Sign In",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Sign in to book meeting room",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.black54),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                controller: nameController,
                title: "Username",
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
                        text: "Register",
                        isLoading: controller.isLoading.value,
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
                                      controller.loginResponse.value?.message ??
                                          "",
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.white,
                                    );
                                  }
                                  emailController.dispose();
                                  nameController.dispose();
                                  passwordController.dispose();
                                  Get.offAllNamed(AppRoutes.login);
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
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
                    "Have an account? ",
                    style: TextStyle(color: Colors.black45, fontSize: 12),
                  ),
                  GestureDetector(
                    onTap: () => Get.offAllNamed(AppRoutes.login),
                    child: const Text(
                      "Login here",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              // Obx(
              //   () => ElevatedButton(
              //     onPressed: controller.isLoading.value
              //         ? null
              //         : () async {
              //             await controller.register(
              //               fullname: nameController.text,
              //               email: emailController.text,
              //               password: passwordController.text,
              //             );

              //             if (controller.errorMessage.isNotEmpty) {
              //               if (!Get.testMode) {
              //                 Get.snackbar(
              //                   "Error",
              //                   controller.errorMessage.value,
              //                   snackPosition: SnackPosition.BOTTOM,
              //                   backgroundColor: Colors.white,
              //                 );
              //               }
              //             } else {
              //               if (!Get.testMode) {
              //                 Get.snackbar(
              //                   "Success",
              //                   controller.loginResponse.value?.message ?? "",
              //                   snackPosition: SnackPosition.BOTTOM,
              //                   backgroundColor: Colors.white,
              //                 );
              //               }
              //               Get.offAllNamed(AppRoutes.login);
              //             }
              //           },
              //     child: controller.isLoading.value
              //         ? CircularProgressIndicator()
              //         : Text("Register"),
              //   ),
              // ),
              // const SizedBox(
              //   height: 16,
              // ),
              // TextButton(
              //   child: Text("Login Here"),
              //   onPressed: () => Get.offAllNamed(AppRoutes.login),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
