import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:room_meeting_app/data/models/auth_model.dart';
import 'package:room_meeting_app/data/models/auth_response.dart';
import 'package:room_meeting_app/data/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository;

  AuthController(this.authRepository);

  // --- Observables ---
  RxBool isLoading = false.obs;
  var loginResponse = Rxn<AuthLoginResponse>();
  var registerResponse = Rxn<AuthRegisterResponse>();
  var errorMessage = ''.obs;
  var tokenResponse = Rxn<Map<String, dynamic>>();
  var token = "".obs;
  RxBool isHidden = true.obs;

  // --- Lifecycle ---
  @override
  void onInit() {
    super.onInit();
    loadToken(); // Load token when controller starts
  }

  // --- Password visibility toggle ---
  void togglePassword() {
    isHidden.value = !isHidden.value;
  }

  // --- Token handling ---
  Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    final savedToken = prefs.getString("TOKEN_KEY");
    if (savedToken != null && savedToken.isNotEmpty) {
      token.value = savedToken;
      try {
        tokenResponse.value = JwtDecoder.decode(savedToken);
        print("Token loaded and decoded successfully.");
      } catch (e) {
        print("Error decoding saved token: $e");
      }
    } else {
      print("No saved token found.");
    }
  }

  Future<void> saveToken(String newToken) async {
    token.value = newToken;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("TOKEN_KEY", newToken);
    tokenResponse.value = JwtDecoder.decode(newToken);
    print("Token saved and decoded successfully.");
  }

  // --- Register ---
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

  // --- Login ---
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

      // Save token for later use
      await saveToken(result.token);

      // Decode and store in observable
      final resultDecoded = JwtDecoder.decode(result.token);
      tokenResponse.value = resultDecoded;

      print('Decoded token username: ${tokenResponse.value?['username']}');
      loginResponse.value = result;
    } catch (e) {
      errorMessage.value = e.toString();
      print("Login error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // --- Logout (optional helper) ---
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("TOKEN_KEY");
    token.value = "";
    tokenResponse.value = null;
  }
}
