
import 'package:flutter/material.dart';
import 'package:get_parked/services/parking_format.dart';

class Detailed extends StatefulWidget{
  @override
  _DetailedState createState() => _DetailedState();
}


class _DetailedState extends State<Detailed> {

  ParkingLot? parkingLot = ParkingLot(
    lotName: "Default Lot",
    lotURL: "https://example.com/default-lot.jpg",
    totalStalls: 0,
    parkingStalls: [],
  );

  Future<ParkingLot> futureParkingLot = ParkingLot().setupDetailed();




  @override


  void initState(){
    super.initState();


    //print();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<ParkingLot>(
          future: futureParkingLot,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasData) {
              parkingLot = snapshot.data;
              return Column(
                children: [
                  Center(child: Image.network(parkingLot!.lotURL)),
                ],
              );
            } else {
              return Text('Error: ${snapshot.error}');
//Image.network(parkingLot.lotURL);
            //CustomPaint(
                  //size: Size(1920, 1080), // Set the size as per your requirements
           //painter: ShapePainter(futureParkingLot.parkingStalls, futureParkingLot.totalStalls),
             // );
            }
          },
        ),
      ),
    );
  }

}


