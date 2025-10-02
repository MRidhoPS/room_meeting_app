import 'package:get/get.dart';
import 'package:room_meeting_app/core/routes/app_routes.dart';
import 'package:room_meeting_app/presentation/pages/auth/bindings/auth_binding.dart';
import 'package:room_meeting_app/presentation/pages/auth/view/login_page.dart';
import 'package:room_meeting_app/presentation/pages/auth/view/register_page.dart';
import 'package:room_meeting_app/presentation/pages/home/view/home_page.dart';
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
    ),
  ];
}
