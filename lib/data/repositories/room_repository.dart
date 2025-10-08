import 'package:room_meeting_app/data/models/room_model.dart';
import 'package:room_meeting_app/data/source/room_remote_data_source.dart';

class RoomRepository {

  final RoomRemoteDataSource remoteDataSource;

  RoomRepository(this.remoteDataSource);

  Future<RoomModel> getListRooms()async{

    final data = remoteDataSource.getListRooms();
    print("data repo: ${data.hashCode}");

    return data;
  }
}