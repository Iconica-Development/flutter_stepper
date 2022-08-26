import 'package:flutter/material.dart';

class VerticalDashedLinePainter extends CustomPainter {
  const VerticalDashedLinePainter({
    required this.dashHeight,
    required this.dashSpace,
    required this.strokeWidth,
    required this.dashColor,
  });

  final double dashHeight;

  final double dashSpace;

  final double strokeWidth;

  final Color dashColor;

  @override
  void paint(Canvas canvas, Size size) {
    var startY = 0.0;
    var paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = strokeWidth;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
