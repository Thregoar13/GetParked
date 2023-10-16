import 'package:flutter/material.dart';



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

    avab[2][30] = false;//testing box updates

    print(avab);
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
            child: Image.network(
              "https://storage.googleapis.com/getparked/CHW%20Lot%201.png",
            ),
            foregroundPainter: ShapePainter(avab),


          ),
        ),
      ),
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
