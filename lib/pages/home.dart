import 'package:image_editor/image_editor.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Camosun Parking Lot B'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(

        padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
        child: GestureDetector(
          child: CustomPaint(
            child: Image(
              image: AssetImage('assets/camosunParkingLot.jpg'),

            ),
            foregroundPainter: ShapePainter(),

          ),


        ),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size){

    var paint = Paint()
      ..color = Colors.greenAccent
      ..style = PaintingStyle.fill;
    final pL = Offset(28, 15);
    double sW = 30;
    double sH = 10;
    final radius = Radius.circular(4);

    final rect = Rect.fromCenter(center: pL, width: sW, height: sH);


    canvas.drawRRect(RRect.fromRectAndRadius(rect, radius), paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return false;
  }
}