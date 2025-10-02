import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_meeting_app/core/routes/app_routes.dart';
import 'package:room_meeting_app/core/storage/local_storage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}
