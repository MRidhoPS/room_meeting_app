class ApiEndPoint{

  ApiEndPoint._();

  static const String baseUrl = 'http://192.168.53.5:7000/roomapp';

  // Auth
  static const String registerUrl = '$baseUrl/auth/register';
  static const String loginUrl = '$baseUrl/auth/login';

  // room
  static const String roomUrl = '$baseUrl/public/rooms';

  // booking
  static const String bookingUrl = '$baseUrl/booking';

}