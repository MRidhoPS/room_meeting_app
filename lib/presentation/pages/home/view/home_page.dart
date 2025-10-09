import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_meeting_app/presentation/pages/auth/viewmodels/auth_controller.dart';
import 'package:room_meeting_app/presentation/pages/home/components/account_components.dart';
import 'package:room_meeting_app/presentation/pages/home/components/listroom_component.dart';
import 'package:room_meeting_app/presentation/pages/home/components/search_container.dart';
import 'package:room_meeting_app/presentation/pages/home/viewmodels/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final profileController = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        title: AccountComponents(profileController: profileController),
        // actions: [
        //   IconButton(
        //     onPressed: () async {
        //       await LocalStorage.clearToken();
        //       Get.offAllNamed(AppRoutes.login);
        //     },
        //     icon: const Icon(
        //       Icons.logout_outlined,
        //     ),
        //   ),
        // ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SearchContainer(),
              ListRooms(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}


