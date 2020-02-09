import 'package:flutter/material.dart';

class StraightlineClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Draw a straight line from current point to the bottom left corner.
    path.lineTo(0.0, 250);

    // Draw a straight line from current point to the top right corner.
    path.lineTo(size.width, 250);
    path.lineTo(size.width, 0);

    // Draws a straight line from current point to the first point of the path.
    // In this case (0, 0), since that's where the paths start by default.
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ObliqueLineClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Draw a straight line from current point to the bottom left corner.
    path.lineTo(0.0, size.height - 550);

    // Draw a straight line from current point to the top right corner.
    path.lineTo(size.width, 170);
    path.lineTo(size.width, 0);

    // Draws a straight line from current point to the first point of the path.
    // In this case (0, 0), since that's where the paths start by default.
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class PokeballClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double thickness = 20.0;
    double thiknessup = 0;
    var innerwidthleft = thickness;
    var innerwidthright = size.width - innerwidthleft;

    var radius = thiknessup;
    var radiusdown = size.height - radius;

    var path = Path();
    print(size.width);
    print(size.height);
    path.lineTo(0.0, (size.height) / 2 - 5);

    path.lineTo(innerwidthleft, (size.height) / 2 - 5);
    path.quadraticBezierTo(
        size.width / 2, radius, innerwidthright, (size.height) / 2 - 5);

    path.lineTo(size.width, (size.height) / 2 - 5);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    path.lineTo(0.0, (size.height) / 2 + 5);

    path.lineTo(innerwidthleft, (size.height) / 2 + 5);
    path.quadraticBezierTo(
        size.width / 2, radiusdown, innerwidthright, (size.height) / 2 + 5);

    path.lineTo(size.width, (size.height) / 2 + 5);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    // Draws a straight line from current point to the first point of the path.
    // In this case (0, 0), since that's where the paths start by default.
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ShapesPainter extends CustomPainter {

  final Color pokeball;
  final Color main;

  ShapesPainter({this.main,this.pokeball});

  @override
  void paint(Canvas canvas, Size size) {
    
    // print("width:${size.width},height:${size.height}");
    final paint = Paint();
    double radius = size.width < size.height ? size.width / 2 : size.height / 2;
    Color pokeball = this.pokeball;
    paint.color = pokeball;
    // center of the canvas is (x,y) => (width/2, height/2)
    Offset center = Offset(size.width / 2, size.height / 2);

    // draw the circle on centre of canvas having radius 75.0
    canvas.drawCircle(center, radius, paint);

    Rect rect = Rect.fromLTWH(0, radius - 5, size.width, 10);
    paint.color = this.main;
    // draw the rectangle using the paint
    canvas.drawRect(rect, paint);
    canvas.drawCircle(center, radius * 0.50, paint);
    paint.color = pokeball;
    canvas.drawCircle(center, radius * 0.30, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
  
    return false;
  }
}
