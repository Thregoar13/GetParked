
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
List<bool> avab = [
  true, false, true, true, true, false, true, true,true, false, true, true,true, false, true, true,
  true, false, true, true, true, false, true, true,true, false, true, true,true, false, true, true,
  true, false, true, true,true, false, true, true,true, false, true, true,true, false, true, true,
  true, false, true, true,true, false, true, true,true, false, true, true,true, false, true, true,
  true, false, true, true,true, false, true, true,true, false, true, true,true, false, true, true,
  true, false, true, true,true, false, true, true,true, false, true, true,true, false, true, true,
  true, false, true, true,true, false, true, true,true, false, true, true,true, false, true, true,
  true, false, true, true,true, false, true, true,true, false, true, true,true, false, true, true,
  true, false, true, true, true, false, true, true,true, false, true, true,true, false, true, true,
  true, false, true, true, true, false, true, true,true, false, true, true,true, false, true, true,
  true, false, true, true, true, false, true, true,true, false, true, true,true, false, true, true,
  true, false, true, true, true, false, true, true,true, false, true, true,true, false, true, true,];




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
                          avab,
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
  final List<bool> avab; // List of availability statuses

  RectanglePainter(this.parkingStalls,  this.imageWidth, this.imageHeight, this.avab);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < parkingStalls.length; i++) {
      final paint = Paint()
        ..style = PaintingStyle.fill;

      final paint2 = Paint()
        ..color = Colors.black87
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4.0;


      final x = ((parkingStalls[i].x + 2) / imageWidth) * size.width;
      final y = ((parkingStalls[i].y + 2) / imageHeight) * size.height;
      final x2 = (parkingStalls[i].x / imageWidth) * size.width;
      final y2 = (parkingStalls[i].y / imageHeight) * size.height;

      final rect = Rect.fromPoints(Offset(x, y), Offset(x + 27, y + 76));
      final rect2 = Rect.fromPoints(Offset(x2, y2), Offset(x2 + 30, y2 + 80));

      paint.color = avab[i] ? Colors.green : Colors.red;
      canvas.drawRect(rect, paint);
      canvas.drawRect(rect2, paint2);
    }
  }
      @override
      bool shouldRepaint(CustomPainter oldDelegate) {
        return false;
      }
    }
