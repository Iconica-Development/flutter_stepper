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
    this.stepIndicatorTextStyleActive,
    this.stepIndicatorTextStyleInactive,
    this.stepIndicatorSize = 30,
    this.iconDone = Icons.check,
    this.iconSize = 20,
    this.emptyHeight = 100,
    this.emptyWidth = 100,
    this.paddingTopForCenterContent = 10,
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

  /// The style of the step indicator text while active
  final TextStyle? stepIndicatorTextStyleActive;

  /// The style of the step indicator text while inactive.
  final TextStyle? stepIndicatorTextStyleInactive;

  /// Height and width of the step indicator.
  final double stepIndicatorSize;

  /// The icon to show when the step is done.
  final IconData iconDone;

  /// The size of the icon.
  final double iconSize;

  /// Width for an step that is hidden
  final double emptyWidth;

  /// Height for an step that is hidden
  final double emptyHeight;

  /// Padding when single step is shown at the top
  final double paddingTopForCenterContent;
}
