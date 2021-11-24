import 'package:flutter/material.dart';

class CustomDesign extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 20);
    path.quadraticBezierTo(0.0, size.height, 20.0, size.height);
    path.lineTo(size.width - 20.0, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 50.0);
    path.quadraticBezierTo(size.width, 30.0, size.width - 20.0, 30.0);
    path.lineTo(20.0, 5.0);
    path.quadraticBezierTo(0.0, 0.0, 0.0, 20.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
