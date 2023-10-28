import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get_parked/services/parking_format.dart';



void main() async {
  print("main Method");
  String url =
      "https://storage.googleapis.com/getparked/CHW%20lot1.json";
  final response = await http.get(Uri.parse(url));
  //print(response.body);

  ParkingLot parkingLot = ParkingLot.fromJson(jsonDecode(response.body));
  //print(parkingLot.parkingstalls[2]);
}

