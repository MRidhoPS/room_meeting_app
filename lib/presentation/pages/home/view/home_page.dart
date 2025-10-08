import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_meeting_app/core/routes/app_routes.dart';
import 'package:room_meeting_app/core/storage/local_storage.dart';
import 'package:room_meeting_app/presentation/pages/auth/viewmodels/auth_controller.dart';
import 'package:room_meeting_app/presentation/pages/home/viewmodels/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final profileController = Get.find<AuthController>();

    print("Profile Controller: ${profileController.tokenResponse.value}");

    return Scaffold(
      appBar: AppBar(
        title: Column(
          
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
                  profile['username'],
                  style: TextStyle(
                    color: Colors.black,
                  ),
                );
              },
            ),
            Text(
              "Name",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await LocalStorage.clearToken();
              Get.offAllNamed(AppRoutes.login);
            },
            icon: Icon(
              Icons.logout_outlined,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                    profile['username'],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  );
                },
              ),
              Obx(
                () {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (controller.errorMessage.isNotEmpty) {
                    return Center(
                        child: Text(
                      "Error: ${controller.errorMessage.value}",
                      style: TextStyle(color: Colors.white),
                    ));
                  }

                  final rooms = controller.getListRoomsData.value?.data;

                  if (rooms == null || rooms.isEmpty) {
                    return const Center(child: Text("No rooms available"));
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: rooms.length,
                    itemBuilder: (context, index) {
                      final room = rooms[index];
                      return ListTile(
                        title: Text(
                          room.name,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          "Capacity: ${room.capacity}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
