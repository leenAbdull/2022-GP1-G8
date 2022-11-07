import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

class BackgroundDesign extends StatelessWidget {
  const BackgroundDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(
          1.sw,
          (1.sw * 1.930841121495327)
              .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
      painter: RPSCustomPainter(),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 161, 198, 227)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;
    paint0.shader = ui.Gradient.linear(
        Offset(0, size.height * 0.37),
        Offset(size.width, size.height * 0.37),
        [Color.fromARGB(255, 108, 70, 106), Color.fromARGB(255, 255, 224, 253)],
        [0.00, 1.00]);

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width, 0);
    path0.quadraticBezierTo(size.width, size.height * 0.5145813, size.width,
        size.height * 0.6861084);
    path0.cubicTo(
        size.width * 0.4798131,
        size.height * 0.5921225,
        size.width * 0.2955607,
        size.height * 0.7375363,
        0,
        size.height * 0.6945789);
    path0.quadraticBezierTo(0, size.height * 0.5209342, 0, 0);
    path0.close();

    canvas.drawPath(path0, paint0);

    Paint paint1 = Paint()
      ..color = const Color.fromARGB(255, 138, 162, 181)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;
    paint1.shader = ui.Gradient.linear(
        Offset(0, size.height * 0.38), Offset(size.width, size.height * 0.38), [
      Color.fromARGB(255, 250, 234, 255),
      Color.fromARGB(255, 178, 212, 255)
    ], [
      0.00,
      1.00
    ]);

    Path path1 = Path();
    path1.moveTo(0, 0);
    path1.lineTo(size.width, 0);
    path1.quadraticBezierTo(size.width, size.height * 0.4791868, size.width,
        size.height * 0.6413359);
    path1.cubicTo(
        size.width * 0.5568925,
        size.height * 0.5522144,
        size.width * 0.3418925,
        size.height * 0.7527348,
        0,
        size.height * 0.6957890);
    path1.quadraticBezierTo(0, size.height * 0.5191191, 0, 0);

    canvas.drawPath(path1, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
