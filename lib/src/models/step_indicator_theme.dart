// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';

class StepIndicatorTheme {
  const StepIndicatorTheme({
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

  final Color? activeBackgroundColor;

  final BoxBorder? activeBorder;

  final TextStyle? activeTextStyle;

  final Color? inactiveBackgroundColor;

  final BoxBorder? inactiveBorder;

  final TextStyle? inactiveTextStyle;

  final Color? completedBackgroundColor;

  final BoxBorder? completedBorder;

  final TextStyle? completedTextStyle;
}
