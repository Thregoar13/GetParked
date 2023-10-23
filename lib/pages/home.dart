import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get_parked/services/parking_format.dart'; //import the ParkingLot class






class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}










class _HomeState extends State<Home> {


  void setupParkingFormat() async{

    List<ParkingStall> instance = [];


    ParkingLot parkingLot = ParkingLot(lotName: 'error', lotURL: 'error', totalStalls: 1, parkingStalls: instance);


    await parkingLot.fetchData();
  }




  @override
  void initState() {
    super.initState();
    setupParkingFormat();


    //   print(avab);
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return Center(
            child: Image.network(
              parkingLot.lotURL // Use the lotURL from the fetched data
            ),
          );
        } else {
          return const Center(
            child: Text('screen under 600'),
          );
        }
      },
    );
  }

}

class ShapePainter extends CustomPainter {
  final List<List<bool>> avab;
  final double rectWidth = 28;
  final double rectHeight = 10;
  final double verticalSpacing = 14.5;   // Adjust this value as needed
  List<double> startX = [14, 84, 155, 226, 298, 371];//offsets for creating the columns of parking spaces
  final double startY = 10;


  ShapePainter(this.avab);

  @override
  void paint(Canvas canvas, Size size) {
    for (int row = 0; row < avab.length; row++) {
      for (int col = 0; col < avab[row].length; col++) {
        final bool isAvailable = avab[row][col];
        final Color rectColor = isAvailable ? Colors.green : Colors.red;

        final double x = startX[row]; // offsets for columns
        final double y = col * verticalSpacing + startY;   // Adjust for spacing

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
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


