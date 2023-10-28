
import 'package:flutter/material.dart';
import 'package:get_parked/services/parking_format.dart';

class Detailed extends StatefulWidget{
  @override
  _DetailedState createState() => _DetailedState();
}


class _DetailedState extends State<Detailed> {


  Future<ParkingLot>? futureParkingLot;


  @override

  void initState(){
    super.initState();
    futureParkingLot = ParkingLot().setupDetailed();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FittedBox(
        child: Center(
          child: FutureBuilder<ParkingLot>(
            future: futureParkingLot,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final parkingLot = snapshot.data;
                return CustomPaint(
                    size: Size(1920, 1080), // Set the size as per your requirements
              painter: ShapePainter(parkingLot?.parkingStalls, parkingLot?.totalStalls),
                );
              }
            },
          ),
        ),
      ),
    );
  }

}

class ShapePainter extends CustomPainter {
  final List<ParkingStalls>? parkingStalls;
  final int? totalStalls;
  final double rectWidth = 28;
  final double rectHeight = 10;

ShapePainter(this.parkingStalls, this.totalStalls);

@override
void paint(Canvas canvas, Size size) {

  if (parkingStalls != null && totalStalls != null) {
    int wow =totalStalls?.toInt() ?? 0 ;

    for (int space = 0; space < wow; space++) {
      final ParkingStalls? stall = wow > space ? parkingStalls[space] : null;
      if (stall != null) {
        final double x = stall.x?.toDouble() ?? 0.0;
        final double y = stall.y?.toDouble() ?? 0.0;
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
  }
}

@override
bool shouldRepaint(CustomPainter oldDelegate) {
  return false;
}
}


