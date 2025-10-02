class AuthRegisterResponse {
  final String message;
  final int userId;

  AuthRegisterResponse({required this.message, required this.userId});

  factory AuthRegisterResponse.fromJson(Map<String, dynamic> json) {
    return AuthRegisterResponse(
      message: json['message'],
      userId: json['user_id'],
    );
  }
}

class AuthLoginResponse {
  final String message;
  final String token;
  final int status;

  AuthLoginResponse({
    required this.message,
    required this.status,
    required this.token,
  });

  factory AuthLoginResponse.fromJson(Map<String, dynamic> json) {
    return AuthLoginResponse(
      message: json['message'],
      status: json['status'],
      token: json['token'],
    );
  }
}
