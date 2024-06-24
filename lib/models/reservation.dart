import 'package:cloud_firestore/cloud_firestore.dart';

class Reservation {
  String userId;
  String restaurantId;
  Timestamp time;

  Reservation(
      {required this.userId, required this.restaurantId, required this.time});

  Reservation.fromJson(Map<String, Object?> json)
      : this(
            userId: json['userId']! as String,
            restaurantId: json['restaurantId']! as String,
            time: json['time'] as Timestamp);

  Map<String, Object?> toJson() {
    return {
      'userId': userId,
      'restaurantId': restaurantId,
      'time': time,
    };
  }
}
