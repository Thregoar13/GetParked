import 'package:http/http.dart' as http;
import 'dart:convert';

class ParkingLot {
  String? lotName = '' ;

  String? lotURL;
  int? totalStalls = 0;
  List<ParkingStalls>? parkingStalls;

  ParkingLot({this.lotName, this.lotURL, this.totalStalls, this.parkingStalls});

  ParkingLot.fromJson(Map<String, dynamic> json) {
    lotName = json['lotName'];
    lotURL = json['lotURL'];
    totalStalls = json['totalStalls'];
    if (json['parking_stalls'] != null) {
      parkingStalls = <ParkingStalls>[];
      json['parking_stalls'].forEach((v) {
        parkingStalls!.add(new ParkingStalls.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lotName'] = this.lotName;
    data['lotURL'] = this.lotURL;
    data['totalStalls'] = this.totalStalls;
    if (this.parkingStalls != null) {
      data['parking_stalls'] =
          this.parkingStalls!.map((v) => v.toJson()).toList();
    }
    return data;
  }


  Future<ParkingLot> setupDetailed() async {
    try {
      String url = "https://storage.googleapis.com/getparked/CHW%20lot1.json";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return ParkingLot.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to fetch data");
      }
    } catch (e) {
      print(e);
      throw e; // Rethrow the exception to handle it in the UI
    }
  }
}

class ParkingStalls {
  int id = 0 ;
  int? x;
  int? y;

  ParkingStalls({this.id, this.x, this.y});

  ParkingStalls.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}

