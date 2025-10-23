class BookingModel {
  final int userId;
  final int roomId;
  final String paymentMethod;
  final String date;
  final String startTime;
  final String endTime;
  final int totalPrice;

  BookingModel({
    required this.userId,
    required this.roomId,
    required this.paymentMethod,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.totalPrice,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      userId: json['userId'],
      roomId: json['roomId'],
      paymentMethod: json['paymentMethod'],
      date: json['date'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      totalPrice: json['totalPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "roomId": roomId,
      "paymentMethod": paymentMethod,
      "date": date,
      "start_time": startTime,
      "end_time": endTime,
      "total_price": totalPrice,
    };
  }
}

class BookingResponse {
  final int id;
  final int userId;
  final int roomId;
  final String date;
  final String startTime;
  final String endTime;
  final String status;
  final String totalPrice;

  BookingResponse({
    required this.id,
    required this.userId,
    required this.roomId,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.totalPrice,
  });

  factory BookingResponse.fromJson(Map<String, dynamic> json) {
    return BookingResponse(
      id: json['id'],
      userId: json['user_id'],
      roomId: json['room_id'],
      date: json['date'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      status: json['status'],
      totalPrice: json['total_price'],
    );
  }
}

/** 
 * Booking Response
 * {
    "status": 201,
    "message": "Booking created successfully",
    "data": {
        "id": 15,
        "user_id": 3,
        "room_id": 17,
        "date": "2025-10-13T17:00:00.000Z",
        "start_time": "11:00:00",
        "end_time": "12:00:00",
        "status": "pending",
        "total_price": "500000.00",
        "created_at": "2025-10-22T23:58:29.000Z",
        "updated_at": "2025-10-22T23:58:29.000Z"
    }
} */

/**
 * {
  "userId":3,
  "roomId": 17,
  "paymentMethod": "BCA",
  "date": "2025-10-14",
  "start_time": "09:00",
  "end_time": "10:00",
  "total_price":  500000
}
 */
