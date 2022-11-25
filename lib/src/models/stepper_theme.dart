// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';

class StepperTheme {
  /// The theme for the [MultiStepperView].
  const StepperTheme({
    this.linePadding = 10,
    this.lineWidth = 2,
    this.lineDashLength = 5,
    this.lineDashGapLength = 3,
    this.lineColor = Colors.black,
    this.stepIndicatorTextStyle,
    this.stepIndicatorSize = 30,
    this.iconDone = Icons.check,
    this.iconSize = 20,
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

  /// The style of the step indicator text.
  final TextStyle? stepIndicatorTextStyle;

  /// Height and width of the step indicator.
  final double stepIndicatorSize;

  /// The icon to show when the step is done.
  final IconData iconDone;

  /// The size of the icon.
  final double iconSize;
}
