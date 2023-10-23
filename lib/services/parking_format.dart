import 'dart:convert';
import 'package:http/http.dart' as http;


class ParkingLot {
  String lotName;
  String lotURL;
  int totalStalls;
  List<ParkingStall> parkingStalls;

  ParkingLot({
    required this.lotName,
    required this.lotURL,
    required this.totalStalls,
    required this.parkingStalls,
  });

  factory ParkingLot.fromJson(Map<String, dynamic> json) {
    return ParkingLot(
      lotName: json['lotName'],
      lotURL: json['lotURL'],
      totalStalls: json['totalStalls'],
      parkingStalls: (json['parking_stalls'] as List)
          .map((stall) => ParkingStall.fromJson(stall))
          .toList(),
    );
  }
}

class ParkingStall {
  int id;
  int x;
  int y;

  ParkingStall({
    required this.id,
    required this.x,
    required this.y});

  factory ParkingStall.fromJson(Map<String, dynamic> json) {
    return ParkingStall(
      id: json['id'],
      x: json['x'],
      y: json['y'],
    );
  }
}
