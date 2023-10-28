
import 'package:flutter/material.dart';
import 'package:get_parked/services/parking_format.dart';

class Detailed extends StatefulWidget{
  @override
  _DetailedState createState() => _DetailedState();
}


class _DetailedState extends State<Detailed> {

  ParkingLot parkingLot = ParkingLot(
    lotName: "Default Lot",
    lotURL: "https://example.com/default-lot.jpg",
    totalStalls: 0,
    parkingStalls: [],
  );

  Future<ParkingLot>? futureParkingLot;




  @override

  void initState(){
    super.initState();
    futureParkingLot = ParkingLot().setupDetailed();

  }


  @override
  Widget build(BuildContext context){


    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Image.network(parkingLot.lotURL!),
      ),
    );
  }

}



