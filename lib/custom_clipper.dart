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
    var radius =  (size.height) / 2 - 35;
    var innerwidth = 35.0;
    var path = Path();
    print(size.width);
     print(size.height);
    path.lineTo(0.0, (size.height) / 2 - 5);

    path.lineTo(innerwidth, (size.height) / 2 - 5);
    path.quadraticBezierTo(
    size.width / 2,radius, size.width - innerwidth, (size.height) / 2 - 5);

    path.lineTo(size.width, (size.height) / 2 - 5);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    path.lineTo(0.0, (size.height) / 2 + 5);

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
