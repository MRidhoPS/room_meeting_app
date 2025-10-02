import 'package:get/get.dart';
import 'package:room_meeting_app/core/network/api_provider.dart';
import 'package:room_meeting_app/data/repositories/auth_repository.dart';
import 'package:room_meeting_app/data/source/auth_remote_data_source.dart';
import 'package:room_meeting_app/presentation/pages/auth/viewmodels/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    final apiProvider = ApiProvider();

    final remoteDataSource = AuthRemoteDataSource(apiProvider);

    final repository = AuthRepository(remoteDataSource);

    Get.put(AuthController(repository));
  }
}
