import 'package:arrow_path/arrow_path.dart';
import 'package:flutter/material.dart';

class PokemonEvolution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _evolution(4, 5),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Divider(
            thickness: 1.5,
          ),
        ),
        _evolution(5, 6)
      ],
    );
  }

  Widget _evolution(int from, int to) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Container(
            height: 120,
            child: Image.asset("assets/images/pokemon/" + from.toString().padLeft(3, '0') + ".png"),
          ),
        ),
        Container(
          height: 100,
          width: 100,
          child: CustomPaint(
            painter: PathPainter(),
          ),
        ),
        Expanded(
          child: Container(
            height: 120,
            child: Image.asset("assets/images/pokemon/" + to.toString().padLeft(3, '0') + ".png"),
          ),
        ),
      ],
    );
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
  

    TextSpan textSpan;
    TextPainter textPainter;

    Paint paint = Paint();
    paint.color = Colors.grey;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.0;

    Path path = Path();
  
    path.moveTo(0, size.height * 0.5);
    path.lineTo(size.height , size.height * 0.5);
    // path.relativeCubicTo(0, 0, size.width * 0.25, 50, size.width * 0.5, 0);
    path = ArrowPath.make(path: path);
    path.close();
    canvas.drawPath(path, paint);
    textSpan = TextSpan(
      text: 'Lv. 16',
      style: TextStyle(color: Colors.blue),
    );
    textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: size.width);
    textPainter.paint(canvas, Offset(0, size.height * 0.2));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
