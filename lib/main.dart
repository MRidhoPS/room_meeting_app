import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      title: 'YouApp.Ai',
      initialRoute: AppRoutes.splash,
      getPages: AppPages.routes,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(9, 20, 26, 1),
        appBarTheme: AppBarTheme(
            backgroundColor: Color.fromRGBO(9, 20, 26, 1),
            centerTitle: true,
            titleTextStyle: TextStyle(color: Colors.white),
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.white,
            )),
        primarySwatch: Colors.blue,
      ),
    );
  }
}
