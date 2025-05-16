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
    this.showOnlyCurrentStep = false,
    this.onStepTapped,
    this.paddingLeft = 10,
    this.paddingRight = 20,
    this.pageHeight = 400,
    this.theme = const StepperTheme(),
    super.key,
  }) : assert(
          !(showOnlyCurrentStep && !showAllSteps),
          'showOnlyCurrentStep only has effect if showAllSteps is true',
        );

  /// The steps of the stepper.
  final List<MultiViewStep> steps;

  /// The index of the current step. If [steps] is not provided, [currentStep]
  final int currentStep;

  /// Whether two show all the [steps] with indicators or just the current step.
  ///
  /// If you want to show all indicators but only 1 step at a time, set this to
  /// true and set [showOnlyCurrentStep] to true.
  final bool showAllSteps;

  /// Whether to show 0 as the first step.
  ///
  /// VISUAL INDICATOR ONLY!
  final bool zeroIndexed;

  /// Callback which is called when a step is clicked
  final ValueChanged<int>? onStepTapped;

  /// The padding between the start and the line of the stepper.
  final double paddingLeft;

  /// The padding between the line and the step indicator.
  final double paddingRight;

  /// The height of the page.
  final double pageHeight;

  /// The theme of the stepper.
  final StepperTheme theme;

  /// Whether the active step should be the only one visible
  /// whilst showing all future steps indicators.
  ///
  /// Only works in combination with [showAllSteps] true
  final bool showOnlyCurrentStep;

  @override
  Widget build(BuildContext context) {
    if (showAllSteps) {
      return _SinglePageStepper(
        stepperTheme: theme,
        steps: steps,
        showOnlyCurrentStep: showOnlyCurrentStep,
        currentIndex: currentStep,
        isZeroIndexed: zeroIndexed,
        linePadding: EdgeInsets.only(
          left: paddingLeft,
          right: paddingRight,
        ),
      );
    } else {
      return _MultiPageStepper(
        stepperTheme: theme,
        linePadding: EdgeInsets.only(
          left: paddingLeft,
          right: paddingRight,
        ),
        pageHeight: pageHeight,
        steps: steps,
        index: currentStep,
        zeroIndexed: zeroIndexed,
      );
    }
  }
}

class _StepContent extends StatelessWidget {
  const _StepContent({
    required this.stepperTheme,
    required this.steps,
    required this.index,
    required this.showOnlyCurrentStep,
    required this.lineHeight,
    required this.currentStep,
  });

  final StepperTheme stepperTheme;
  final List<MultiViewStep> steps;
  final bool showOnlyCurrentStep;
  final int index;
  final double lineHeight;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    var step = steps[index];
    if (currentStep - 1 > index && stepperTheme.hideStepWhenDone) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: stepperTheme.linePadding),
        if (showOnlyCurrentStep) ...[
          SizedBox(
            height: index == steps.length - 1 ? 0 : lineHeight,
          ),
        ] else if (step.hidden) ...[
          SizedBox(
            height: index == steps.length - 1 ? 0 : lineHeight,
            width: stepperTheme.emptyWidth,
          ),
        ] else if (step.size != null) ...[
          SizedBox(
            height: step.size,
            child: step.content,
          ),
        ] else ...[
          step.content,
        ],
      ],
    );
  }
}

class _MultiPageStepper extends StatelessWidget {
  const _MultiPageStepper({
    required this.stepperTheme,
    required this.linePadding,
    required this.steps,
    required this.index,
    required this.zeroIndexed,
    required this.pageHeight,
  });

  final StepperTheme stepperTheme;
  final double pageHeight;
  final EdgeInsets linePadding;
  final List<MultiViewStep> steps;
  final int index;
  final bool zeroIndexed;

  @override
  Widget build(BuildContext context) {
    var displayIndex = '${index + (zeroIndexed ? 0 : 1)}';
    var theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: linePadding,
          child: Column(
            children: [
              stepperTheme.stepIndicatorTheme.builder?.call(index, null) ??
                  Container(
                    width: stepperTheme.stepIndicatorSize,
                    height: stepperTheme.stepIndicatorSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: stepperTheme.lineColor,
                    ),
                    child: Center(
                      child: Text(
                        displayIndex,
                        style:
                            stepperTheme.stepIndicatorTheme.activeTextStyle ??
                                theme.textTheme.bodyMedium,
                      ),
                    ),
                  ),
              Padding(
                padding: EdgeInsets.only(top: stepperTheme.linePadding),
                child: Container(
                  width: 1,
                  height: pageHeight,
                  color: stepperTheme.lineColor,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: steps[index].content,
        ),
      ],
    );
  }
}

class _SinglePageStepper extends StatelessWidget {
  const _SinglePageStepper({
    required this.showOnlyCurrentStep,
    required this.stepperTheme,
    required this.linePadding,
    required this.steps,
    required this.currentIndex,
    required this.isZeroIndexed,
  });

  final StepperTheme stepperTheme;
  final List<MultiViewStep> steps;
  final bool showOnlyCurrentStep;

  final EdgeInsets linePadding;
  final bool isZeroIndexed;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    Widget expandIndicators(Widget child) =>
        showOnlyCurrentStep ? child : Expanded(child: child);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: expandIndicators(
            _StepperLine(
              steps: steps,
              stepperTheme: stepperTheme,
              currentIndex: currentIndex,
              isZeroIndexed: isZeroIndexed,
              linePadding: linePadding,
              showOnlyCurrentStep: showOnlyCurrentStep,
            ),
          ),
        ),
        if (showOnlyCurrentStep && !steps[currentIndex].hidden) ...[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: stepperTheme.paddingTopForCenterContent,
              ),
              child: steps[currentIndex].content,
            ),
          ),
        ],
      ],
    );
  }
}

class _StepperLine extends StatelessWidget {
  const _StepperLine({
    required this.steps,
    required this.stepperTheme,
    required this.currentIndex,
    required this.isZeroIndexed,
    required this.linePadding,
    required this.showOnlyCurrentStep,
  });

  final List<MultiViewStep> steps;
  final StepperTheme stepperTheme;
  final int currentIndex;
  final bool isZeroIndexed;
  final EdgeInsets linePadding;
  final bool showOnlyCurrentStep;

  @override
  Widget build(BuildContext context) {
    Widget expandIndicators(Widget child) =>
        showOnlyCurrentStep ? child : Expanded(child: child);

    Widget dashedLine(Color lineColor) => Expanded(
          child: CustomPaint(
            painter: VerticalDashedLinePainter(
              dashColor: lineColor,
              dashHeight: stepperTheme.lineDashLength,
              dashSpace: stepperTheme.lineDashGapLength,
              strokeWidth: stepperTheme.lineWidth,
            ),
          ),
        );

    Widget solidLine(Color lineColor) => Expanded(
          child: Container(
            height: stepperTheme.lineHeight,
            width: stepperTheme.lineWidth,
            color: lineColor,
          ),
        );

    return Column(
      children: List.generate(
        steps.length,
        (index) {
          var lineColor = stepperTheme.activeLineColor != null
              ? currentIndex == index
                  ? stepperTheme.activeLineColor!
                  : stepperTheme.lineColor
              : stepperTheme.lineColor;
          Widget stepIndicator;
          stepIndicator = stepperTheme.stepIndicatorTheme.builder
                  ?.call(index, currentIndex) ??
              _StepIndicator(
                step: index,
                isZeroIndexed: isZeroIndexed,
                stepperTheme: stepperTheme,
                currentIndex: currentIndex,
                indicator: steps[index].indicator,
              );
          if (currentIndex > index && stepperTheme.hideStepWhenDone) {
            stepIndicator = const SizedBox.shrink();
          }

          if (steps.length - 1 == index) {
            stepIndicator = stepperTheme.stepIndicatorTheme.lastBuilder
                    ?.call(index, currentIndex) ??
                _StepIndicator(
                  step: index,
                  isZeroIndexed: isZeroIndexed,
                  stepperTheme: stepperTheme,
                  currentIndex: currentIndex,
                  indicator: steps[index].indicator,
                );
          }
          Widget line;

          if (currentIndex < index) {
            line = stepperTheme.useDashedLine
                ? dashedLine(lineColor)
                : solidLine(lineColor);
          } else {
            line = dashedLine(lineColor);
          }

          if (currentIndex - 1 > index && stepperTheme.hideStepWhenDone) {
            line = const SizedBox.shrink();
          }

          return IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: linePadding,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: stepIndicator,
                      ),
                      line,
                    ],
                  ),
                ),
                expandIndicators(
                  _StepContent(
                    stepperTheme: stepperTheme,
                    showOnlyCurrentStep: showOnlyCurrentStep,
                    steps: steps,
                    index: index,
                    currentStep: currentIndex,
                    lineHeight:
                        currentIndex > index && stepperTheme.hideStepWhenDone
                            ? 40
                            : stepperTheme.emptyHeight,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _StepIndicator extends StatelessWidget {
  const _StepIndicator({
    required this.step,
    required this.currentIndex,
    required this.stepperTheme,
    required this.isZeroIndexed,
    this.indicator,
  });

  final int step;
  final int currentIndex;
  final StepperTheme stepperTheme;
  final bool isZeroIndexed;
  final Widget? indicator;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var indicatorTheme = stepperTheme.stepIndicatorTheme;

    BoxBorder border = Border.all(color: theme.primaryColor);
    var color = theme.primaryColor;
    var textStyle = theme.textTheme.bodyMedium;
    if (currentIndex == step) {
      border = indicatorTheme.activeBorder ?? border;
      color = indicatorTheme.activeBackgroundColor ?? color;
      textStyle = indicatorTheme.activeTextStyle ?? textStyle;
    } else if (currentIndex > step) {
      border = indicatorTheme.completedBorder ?? border;
      color = indicatorTheme.completedBackgroundColor ?? color;
      textStyle = indicatorTheme.completedTextStyle ?? textStyle;
    } else {
      border = indicatorTheme.inactiveBorder ?? border;
      color = indicatorTheme.inactiveBackgroundColor ?? color;
      textStyle = indicatorTheme.inactiveTextStyle ?? textStyle;
    }
    var indicator = this.indicator ??
        Text(
          isZeroIndexed ? '$step' : '${step + 1}',
          style: textStyle,
        );

    if (currentIndex > step) {
      if (this.indicator != null && stepperTheme.useIndicator) {
        indicator = this.indicator!;
      } else {
        indicator = Icon(
          stepperTheme.iconDone,
          size: stepperTheme.iconSize,
          color: textStyle?.color,
        );
      }
    }

    return Container(
      margin: EdgeInsets.only(
        bottom: stepperTheme.linePadding,
        top: stepperTheme.linePadding,
      ),
      width: stepperTheme.stepIndicatorSize,
      height: stepperTheme.stepIndicatorSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: border,
        color: color,
      ),
      alignment: Alignment.center,
      child: indicator,
    );
  }
}
