// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:flutter_stepper/src/models/step_indicator_theme.dart';

class StepperTheme {
  /// The theme for the [MultiStepperView].
  const StepperTheme({
    this.linePadding = 10,
    this.lineWidth = 2,
    this.lineDashLength = 5,
    this.lineDashGapLength = 3,
    this.lineColor = Colors.black,
    this.stepIndicatorTheme = const StepIndicatorTheme(),
    this.stepIndicatorSize = 30,
    this.iconDone = Icons.check,
    this.iconSize = 20,
    this.emptyHeight = 100,
    this.emptyWidth = 100,
    this.paddingTopForCenterContent = 10,
    this.useIndicator = false,
    this.lineHeight = 0,
    this.useDashedLine = false,
    this.activeLineColor,
    this.hideStepWhenDone = false,
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

  /// The style of the step indicator for the different states
  final StepIndicatorTheme stepIndicatorTheme;

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

  /// Use the indicator widget instead of the default one
  /// when the step is done
  final bool useIndicator;

  /// The height of the line between the steps when all steps are shown
  final double? lineHeight;

  /// Always use a dashedline
  final bool useDashedLine;

  /// The color of the line coming from the current step
  final Color? activeLineColor;

  /// scroll the completed steps up
  final bool hideStepWhenDone;
}
