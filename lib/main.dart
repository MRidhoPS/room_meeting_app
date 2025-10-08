import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_meeting_app/controller/global_binding.dart';
import 'package:room_meeting_app/core/routes/app_pages.dart';
import 'package:room_meeting_app/core/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Room Meeting App',
      initialBinding: AppBinding(),
      initialRoute: AppRoutes.splash,
      getPages: AppPages.routes,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(249, 246, 243, 1),
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            toolbarHeight: 100,
            titleTextStyle: TextStyle(color: Colors.black),
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            )),
        primarySwatch: Colors.green,
      ),
    );
  }
}
