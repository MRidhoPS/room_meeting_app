import 'package:room_meeting_app/data/models/auth_model.dart';
import 'package:room_meeting_app/data/models/auth_response.dart';
import 'package:room_meeting_app/data/source/auth_remote_data_source.dart';

class AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepository(this.remoteDataSource);

  Future<AuthRegisterResponse> register (AuthModel authModel) async{
    return remoteDataSource.register(authModel);
  }

  Future<AuthLoginResponse> login (AuthLoginModel authLoginModel) async{
    return remoteDataSource.login(authLoginModel);
  }
}