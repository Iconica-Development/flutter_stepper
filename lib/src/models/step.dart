import 'package:flutter/material.dart';

class MultiViewStep {
  /// Step class for the [MultiStepperView].
  /// Title and size are optional for the [MultiStepperView].
  const MultiViewStep({
    required this.content,
    this.title = '',
    this.size,
  });

  // The Title of the step
  final String title;

  // The content of the step
  final Widget content;

  // The size of the step, if not provided it will be calculated
  // Use this mainly if you want longer steps
  final double? size;
}
