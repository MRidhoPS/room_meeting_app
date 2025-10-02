class ApiEndPoint{

  ApiEndPoint._();

  static const String baseUrl = 'http://10.152.105.5:7000/roomapp';

  // Auth
  static const String registerUrl = '$baseUrl/auth/register';
  static const String loginUrl = '$baseUrl/auth/login';

}