// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:flutter_stepper/src/line_painter.dart';
import 'package:flutter_stepper/stepper.dart';

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
    this.showAllStepExpandedOne = false,
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

  final bool showAllStepExpandedOne;

  @override
  Widget build(BuildContext context) {
    var indicatorTheme = theme.stepIndicatorTheme;
    if (!showAllSteps) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: paddingLeft, right: paddingRight),
            child: Column(
              children: [
                Container(
                  width: theme.stepIndicatorSize,
                  height: theme.stepIndicatorSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.lineColor,
                  ),
                  child: Center(
                    child: Text(
                      (currentStep + (zeroIndexed ? 0 : 1)).toString(),
                      style: indicatorTheme.activeTextStyle ??
                          Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: theme.linePadding),
                  child: Container(
                    width: 1,
                    height: pageHeight,
                    color: theme.lineColor,
                  ),
                ),
              ],
            ),
          ),
          steps[currentStep].content,
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                for (var i = 0; i < steps.length; i++) ...[
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
                                    child: Container(
                                      width: theme.stepIndicatorSize,
                                      height: theme.stepIndicatorSize,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: currentStep == i
                                            ? indicatorTheme.activeBorder
                                            : currentStep >=
                                                    (i + (zeroIndexed ? 0 : 1))
                                                ? indicatorTheme.completedBorder
                                                : indicatorTheme
                                                        .inactiveBorder ??
                                                    Border.all(
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                    ),
                                        color: currentStep == i
                                            ? indicatorTheme
                                                .activeBackgroundColor
                                            : currentStep >=
                                                    (i + (zeroIndexed ? 0 : 1))
                                                ? indicatorTheme
                                                    .completedBackgroundColor
                                                : indicatorTheme
                                                        .inactiveBackgroundColor ??
                                                    Theme.of(context)
                                                        .primaryColor,
                                      ),
                                      child: Center(
                                        child: currentStep >=
                                                _getIndexNumber(
                                                  index: i,
                                                  zeroIndexed: zeroIndexed,
                                                )
                                            ? Icon(
                                                theme.iconDone,
                                                size: theme.iconSize,
                                                color: currentStep == i
                                                    ? indicatorTheme
                                                        .completedTextStyle
                                                        ?.color
                                                    : currentStep >=
                                                            _getIndexNumber(
                                                              index: i,
                                                              zeroIndexed:
                                                                  zeroIndexed,
                                                            )
                                                        ? indicatorTheme
                                                            .completedTextStyle
                                                            ?.color
                                                        : indicatorTheme
                                                                .inactiveTextStyle
                                                                ?.color ??
                                                            Theme.of(context)
                                                                .textTheme
                                                                .bodyText2
                                                                ?.color,
                                              )
                                            : Text(
                                                _getIndexNumber(
                                                  index: i,
                                                  zeroIndexed: zeroIndexed,
                                                ).toString(),
                                                style: currentStep == i
                                                    ? indicatorTheme
                                                        .activeTextStyle
                                                    : indicatorTheme
                                                            .inactiveTextStyle ??
                                                        Theme.of(context)
                                                            .textTheme
                                                            .bodyText2,
                                              ),
                                      ),
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
                              if (!showAllStepExpandedOne &&
                                  !steps[i].hidden) ...[
                                SizedBox(
                                  height: steps[i].size,
                                  child: steps[i].content,
                                ),
                              ] else ...[
                                SizedBox(
                                  height: i == steps.length - 1
                                      ? 0
                                      : theme.emptyHeight,
                                  width: theme.emptyWidth,
                                ),
                              ],
                            ] else ...[
                              if (!showAllStepExpandedOne &&
                                  !steps[i].hidden) ...[
                                steps[i].content,
                              ] else ...[
                                SizedBox(
                                  height: i == steps.length - 1
                                      ? 0
                                      : theme.emptyHeight,
                                  width: theme.emptyWidth,
                                ),
                              ],
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (showAllStepExpandedOne && !steps[currentStep].hidden) ...[
            Padding(
              padding: EdgeInsets.only(
                top: theme.paddingTopForCenterContent,
              ),
              child: steps[currentStep].content,
            ),
          ],
        ],
      );
    }
  }

  int _getIndexNumber({
    required int index,
    required bool zeroIndexed,
  }) {
    return index + (zeroIndexed ? 0 : 1);
  }
}
