import 'package:flutter/material.dart';

class MultiViewStep {
  const MultiViewStep({
    required this.content,
    this.title = '',
  });
  final String title;
  final Widget content;
}
