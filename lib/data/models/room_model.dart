class RoomModel {
  final int status;
  final String message;
  final List<RoomData> data;

  RoomModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => RoomData.fromJson(item))
          .toList(),
    );
  }
}

class RoomData {
  final int id;
  final String name;
  final String address;
  final String city;
  final int capacity;
  final String price;
  final String thumbnail;

  RoomData({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.capacity,
    required this.price,
    required this.thumbnail,
  });

  factory RoomData.fromJson(Map<String, dynamic> json) {
    return RoomData(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      city: json['city'],
      capacity: json['capacity'],
      price: json['hourly_price'],
      thumbnail: json['thumbnail_photo'],
    );
  }
}

class RoomDetailedModel {
  final int status;
  final String message;
  final RoomDetailedData data;

  RoomDetailedModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory RoomDetailedModel.fromJson(Map<String, dynamic> json) {
    return RoomDetailedModel(
      status: json['status'],
      message: json['message'],
      data: RoomDetailedData.fromJson(json['data']),
    );
  }
}

class RoomDetailedData {
  final int id;
  final String name;
  final String address;
  final String city;
  final int capacity;
  final int price;
  final String description;
  final List<String> photos;
  final List<String> facilities;

  RoomDetailedData({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.capacity,
    required this.price,
    required this.description,
    required this.photos,
    required this.facilities,
  });

  factory RoomDetailedData.fromJson(Map<String, dynamic> json) {
    return RoomDetailedData(
      id: json['id'],
      name: json['name'],
      capacity: json['capacity'],
      address: json['address'],
      city: json['city'],
      price: json['hourly_price'],
      description: json['description'],
      photos: List<String>.from(json['photos']),
      facilities: List<String>.from(json['facilities']),
    );
  }
}

class RoomAvailabilityModel {
  final int status;
  final String message;
  final String roomId;
  final List<RoomAvailabilityData> data;

  RoomAvailabilityModel({
    required this.status,
    required this.message,
    required this.roomId,
    required this.data,
  });

  factory RoomAvailabilityModel.fromJson(Map<String, dynamic> json) {
    return RoomAvailabilityModel(
      status: json['status'],
      message: json['message'],
      roomId: json['roomId'],
      data: (json['data'] as List)
          .map((item) => RoomAvailabilityData.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'roomId': roomId,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class RoomAvailabilityData {
  final String date;
  final List<AvailabilitySlot> availability;

  RoomAvailabilityData({
    required this.date,
    required this.availability,
  });

  factory RoomAvailabilityData.fromJson(Map<String, dynamic> json) {
    return RoomAvailabilityData(
      date: json['date'],
      availability: (json['availability'] as List)
          .map((item) => AvailabilitySlot.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'availability': availability.map((e) => e.toJson()).toList(),
    };
  }
}

class AvailabilitySlot {
  final String time;
  final bool available;

  AvailabilitySlot({
    required this.time,
    required this.available,
  });

  factory AvailabilitySlot.fromJson(Map<String, dynamic> json) {
    return AvailabilitySlot(
      time: json['time'],
      available: json['available'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'available': available,
    };
  }
}

