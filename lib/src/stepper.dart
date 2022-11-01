// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:stepper/src/line_painter.dart';
import 'package:stepper/stepper.dart';

class MultiStepperView extends StatelessWidget {
  /// MultiStepperView is a widget that displays a vertical list of steps.
  /// Each step is represented by a [MultiViewStep] widget.
  /// Steps can either be displayed in a single page or in multiple pages.
  /// If the steps are displayed in multiple pages, the [currentStep] property
  /// determines which page is displayed.
  /// The height of the page is determined by the height of the containing
  /// widget or by the [size] property.
  /// Style can be customized by setting the [theme] property.
  const MultiStepperView({
    required this.steps,
    this.currentStep = 0,
    this.showAllSteps = false,
    this.zeroIndexed = false,
    this.onStepTapped,
    this.paddingLeft = 10,
    this.paddingRight = 20,
    this.pageHeight = 400,
    this.theme = const StepperTheme(),
    Key? key,
  }) : super(key: key);

  /// The steps of the stepper.
  final List<MultiViewStep> steps;

  /// The index of the current step. If [steps] is not provided, [currentStep]
  final int currentStep;

  /// Whether two show all the [steps] or just the current one.
  final bool showAllSteps;

  /// Whether to show 0 as the first step.
  final bool zeroIndexed;

  // int callback for step clicked
  final ValueChanged<int>? onStepTapped;

  /// The padding between the start and the line of the stepper.
  final double paddingLeft;

  /// The padding between the line and the step indicator.
  final double paddingRight;

  /// The height of the page.
  final double pageHeight;

  /// The theme of the stepper.
  final StepperTheme theme;

  @override
  Widget build(BuildContext context) {
    if (!showAllSteps) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: paddingLeft, right: paddingRight),
            child: Column(
              children: [
                Text((currentStep + (zeroIndexed ? 0 : 1)).toString()),
                Padding(
                  padding: EdgeInsets.only(top: theme.linePadding),
                  child: Container(
                    width: 1,
                    height: pageHeight,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          steps[currentStep].content,
        ],
      );
    } else {
      return Column(
        children: [
          for (var i = 0; i < steps.length; i++)
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // draw a line below the current step
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(right: paddingRight),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              onStepTapped?.call(i);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                bottom: theme.linePadding,
                                top: theme.linePadding,
                              ),
                              child: Text(
                                (i + (zeroIndexed ? 0 : 1)).toString(),
                                style: theme.stepIndicatorTextStyle ??
                                    Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          ),
                          if (i < currentStep) ...[
                            Expanded(
                              child: Container(
                                width: theme.lineWidth,
                                color: theme.lineColor,
                              ),
                            ),
                          ] else ...[
                            Expanded(
                              child: CustomPaint(
                                painter: VerticalDashedLinePainter(
                                  dashColor: theme.lineColor,
                                  dashHeight: theme.lineDashLength,
                                  dashSpace: theme.lineDashGapLength,
                                  strokeWidth: theme.lineWidth,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: theme.linePadding),
                      if (steps[i].size != null) ...[
                        SizedBox(
                          height: steps[i].size,
                          child: steps[i].content,
                        ),
                      ] else ...[
                        steps[i].content,
                      ],
                    ],
                  ),
                ],
              ),
            ),
        ],
      );
    }
  }
}
