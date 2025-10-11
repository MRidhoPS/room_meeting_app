import 'package:get/get.dart';
import 'package:room_meeting_app/core/routes/app_routes.dart';
import 'package:room_meeting_app/presentation/pages/auth/bindings/auth_binding.dart';
import 'package:room_meeting_app/presentation/pages/auth/view/login_page.dart';
import 'package:room_meeting_app/presentation/pages/auth/view/register_page.dart';
import 'package:room_meeting_app/presentation/pages/detailed_room/bindings/detailed_room_binding.dart';
import 'package:room_meeting_app/presentation/pages/detailed_room/view/detailed_room_page.dart';
import 'package:room_meeting_app/presentation/pages/home/bindings/home_binding.dart';
import 'package:room_meeting_app/presentation/pages/home/view/home_page.dart';
import 'package:room_meeting_app/presentation/pages/scheduled_room/bindings/scheduled_binding.dart';
import 'package:room_meeting_app/presentation/pages/scheduled_room/view/scheduled_room_page.dart';
import 'package:room_meeting_app/presentation/pages/splash/bindings/splash_binding.dart';
import 'package:room_meeting_app/presentation/pages/splash/view/splash_page.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
        name: AppRoutes.register,
        page: () => const RegisterPage(),
        binding: AuthBinding()),
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      bindings: [
        AuthBinding(),
        HomeBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.detailedRoom,
      page: () => const DetailedRoomPage(),
      binding: DetailedRoomBinding(),
    ),
    GetPage(
      name: AppRoutes.scheduledRoom,
      page: () => const ScheduledRoomPage(),
      binding: ScheduledBinding(),
    ),
  ];
}
