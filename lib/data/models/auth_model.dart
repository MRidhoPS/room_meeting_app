class AuthModel {
  final String fullname;
  final String email;
  final String password;

  AuthModel({
    required this.fullname,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullname,
      'email': email,
      'password': password,
    };
  }
}

class AuthLoginModel{
  final String email;
  final String password;

  AuthLoginModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
