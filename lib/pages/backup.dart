
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



class ShapePainter extends CustomPainter {
  final List<ParkingStalls> parkingStalls;
  final int totalStalls;
  final double rectWidth = 28;
  final double rectHeight = 10;

  ShapePainter(this.parkingStalls, this.totalStalls);

  @override
  void paint(Canvas canvas, Size size) {




    for (int space = 0; space < parkingStalls.size; space++) {
      //   final ParkingStalls? stall = parkingStalls.size > space ? parkingStalls[space] : null;

      final double x = stall.x.toDouble() ?? 0.0;
      final double y = stall.y.toDouble() ?? 0.0;
      final Color rectColor = Colors.green; // You can set the color based on availability

      final rect = Rect.fromPoints(
        Offset(x, y),
        Offset(x + rectWidth, y + rectHeight),
      );

      final paint = Paint()
        ..color = rectColor
        ..style = PaintingStyle.fill;

      canvas.drawRect(rect, paint);
    }


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

