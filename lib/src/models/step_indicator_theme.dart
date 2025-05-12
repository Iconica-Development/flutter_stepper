// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';

class StepIndicatorTheme {
  const StepIndicatorTheme({
    this.builder,
    this.lastBuilder,
    this.completedBackgroundColor,
    this.completedBorder,
    this.completedTextStyle,
    this.inactiveBackgroundColor,
    this.inactiveBorder,
    this.inactiveTextStyle,
    this.activeBackgroundColor,
    this.activeBorder,
    this.activeTextStyle,
  });

  /// A function that defines custom widget builders based on the step index
  /// and current index.
  final Widget Function(int stepIndex, int? currentIndex)? builder;

  /// A function that defines custom widget builders based on the step index
  /// and current index for the last step.
  final Widget Function(int stepIndex, int? currentIndex)? lastBuilder;

  /// The background color for active steps.
  final Color? activeBackgroundColor;

  /// The border for active steps.
  final BoxBorder? activeBorder;

  /// The text style for active steps.
  final TextStyle? activeTextStyle;

  /// The background color for inactive steps.
  final Color? inactiveBackgroundColor;

  /// The border for inactive steps.
  final BoxBorder? inactiveBorder;

  /// The text style for inactive steps.
  final TextStyle? inactiveTextStyle;

  /// The background color for completed steps.
  final Color? completedBackgroundColor;

  /// The border for completed steps.
  final BoxBorder? completedBorder;

  /// The text style for completed steps.
  final TextStyle? completedTextStyle;
}
