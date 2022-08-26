import 'package:flutter/material.dart';

class StepperTheme {
  const StepperTheme({
    this.linePadding = 10,
    this.lineWidth = 2,
    this.lineDashLength = 5,
    this.lineDashGapLength = 3,
    this.lineColor = Colors.black,
  });

  /// The padding between the start of the line and the stepper indicator.
  final double linePadding;

  /// The width of the line.
  final double lineWidth;

  /// The length of the line's dashes.
  final double lineDashLength;

  /// The length of the line's gaps.
  final double lineDashGapLength;

  /// The color of the line.
  final Color lineColor;
}
