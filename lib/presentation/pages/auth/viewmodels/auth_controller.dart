import 'package:get/get.dart';
import 'package:room_meeting_app/data/models/auth_model.dart';
import 'package:room_meeting_app/data/models/auth_response.dart';
import 'package:room_meeting_app/data/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final AuthRepository authRepository;

  AuthController(this.authRepository);

  RxBool isLoading = false.obs;
  var loginResponse = Rxn<AuthLoginResponse>();
  var registerResponse = Rxn<AuthRegisterResponse>();
  var errorMessage = ''.obs;

  var token = "".obs;
  RxBool isHidden = true.obs;

  void togglePassword() {
    isHidden.value = !isHidden.value;
  }

  Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    final savedToken = prefs.getString("TOKEN_KEY");
    if (savedToken != null) {
      token.value = savedToken;
    }
  }

  Future<void> saveToken(String newToken) async {
    token.value = newToken;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("TOKEN_KEY", newToken);
  }

  Future<void> register({
    required String email,
    required String fullname,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      errorMessage.value = "";

      final authModel = AuthModel(
        fullname: fullname,
        email: email,
        password: password,
      );

      final result = await authRepository.register(authModel);
      registerResponse.value = result;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      errorMessage.value = "";

      final authLoginModel = AuthLoginModel(
        email: email,
        password: password,
      );

      final result = await authRepository.login(authLoginModel);

      loginResponse.value = result;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
