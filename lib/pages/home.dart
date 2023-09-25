import 'package:flutter/material.dart';
//import 'package:matrix2d/matrix2d.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

var nCols = 31;
var nRows = 6;
var avab = List<List<bool>>.generate(nRows, (i) => List<bool>.generate(nCols,(j)=> true));
//create an array with all spaces in a parking lot


class _HomeState extends State<Home> {
  List<Offset> rectanglePositions = [];

  @override
  void initState() {
    super.initState();
    avab[0][0] = false;
    drawGreenRectangles(nRows, nCols);

    print(avab);
  }



  void drawGreenRectangles(int columns, int rows) {

    List<double> startX = [28, 100, 170, 240, 312, 385];//offsets for creating the columns of parking spaces


    final double startY = 15;
    final double verticalSpacing = 14.5;


    for(int m = 0; m < columns; m++){
      for (int i = 0; i < rows; i++) {

        // Adjust the X position for the second column
        double y = startY + (i * verticalSpacing);
        double x = startX[m];

        rectanglePositions.add(Offset(x, y));

        }
      }

    }


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
            foregroundPainter: ShapePainter(rectanglePositions),

          ),
        ),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  final List<Offset> rectanglePositions;
  final double rectWidth = 28;
  final double rectHeight = 10;

  ShapePainter(this.rectanglePositions);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = DetermineColor(avab)
      ..style = PaintingStyle.fill;


    final double rectRadius = 4;

    for (var position in rectanglePositions) {
      final rect = Rect.fromCenter(
        center: position,
        width: rectWidth,
        height: rectHeight,

      );
      canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(rectRadius)), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }


  Color DetermineColor(List<List<bool>> arr) {
    if(arr[0][0]) {
      return Colors.greenAccent;
    }
    else{
      return Colors.red;
    }
  }
  }

