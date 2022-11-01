// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';

class VerticalDashedLinePainter extends CustomPainter {
  /// Draws a dashed line between two vertical points.
  const VerticalDashedLinePainter({
    required this.dashHeight,
    required this.dashSpace,
    required this.strokeWidth,
    required this.dashColor,
  });

  /// The height of the dashes.
  final double dashHeight;

  /// The space between the dashes.
  final double dashSpace;

  /// The width of the line.
  final double strokeWidth;

  /// The color of the line.
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
