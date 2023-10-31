
import 'package:flutter/material.dart';
import 'package:get_parked/services/parking_format.dart';

class Detailed extends StatefulWidget{
  @override
  _DetailedState createState() => _DetailedState();
}


class _DetailedState extends State<Detailed> {

  double imageHeight = 1080;
  double imageWidth = 1920;
  int rotation = 0;

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
  }


  @override
  Widget build(BuildContext context) {

    if (MediaQuery.of(context).orientation == Orientation.portrait ){
      rotation = 1;
    }else{
      rotation = 0;
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Parking Lot'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<ParkingLot>(
          future: futureParkingLot,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasData) {
              parkingLot = snapshot.data;
              return Column(
                children: [
                  RotatedBox(
                    quarterTurns: rotation,
                    child: FittedBox(
                      child:CustomPaint(size: Size(imageWidth, imageHeight),
                        child: Image.network(parkingLot!.lotURL),// Set the size as per your image dimensions
                        foregroundPainter: RectanglePainter(
                          parkingLot!.parkingStalls,
                          imageWidth,
                          imageHeight,
                        ),
                      ),
                    ),
                  ),
                  
                ],
              );
            } else {
              return Text('Error: ${snapshot.error}');
            }
          },
        ),
      ),
    );
  }

}

class RectanglePainter extends CustomPainter {
  final List<ParkingStalls> parkingStalls;
  final double imageWidth;
  final double imageHeight;

  RectanglePainter(this.parkingStalls, this.imageWidth, this.imageHeight);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black87
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    final paint2 = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;


    for (var stall in parkingStalls) {
      final x = (stall.x / imageWidth) * size.width;
      final y = (stall.y / imageHeight) * size.height;
      final rect = Rect.fromPoints(Offset(x, y), Offset(x + 35, y + 80)); // Adjust the rectangle size as needed
      final x2 = ((stall.x + 2) / imageWidth) * size.width ;
      final y2 = ((stall.y + 2)  / imageHeight) * size.height ;
      final rect2 = Rect.fromPoints(Offset(x2, y2), Offset(x2 + 31, y2 + 76));
      canvas.drawRect(rect, paint);
      canvas.drawRect(rect2, paint2);


    }

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}