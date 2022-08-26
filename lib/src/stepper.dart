import 'package:flutter/material.dart';
import 'package:stepper/src/line_painter.dart';
import 'package:stepper/stepper.dart';

class MultiStepperView extends StatelessWidget {
  const MultiStepperView({
    required this.steps,
    this.currentStep = 0,
    this.showAllSteps = false,
    this.onStepContinue,
    this.onStepCancel,
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

  final VoidCallback? onStepContinue;

  final VoidCallback? onStepCancel;

  final double paddingLeft;

  final double paddingRight;

  final double pageHeight;

  /// The theme of the stepper.
  final StepperTheme theme;

  @override
  Widget build(BuildContext context) {
    if (!showAllSteps) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // draw a line below the current step
          Padding(
            padding: EdgeInsets.only(left: paddingLeft, right: paddingRight),
            child: Column(
              children: [
                Text(currentStep.toString()),
                Container(
                  width: 1,
                  height: pageHeight,
                  color: Colors.black,
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
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: theme.linePadding,
                              top: theme.linePadding,
                            ),
                            child: Text((i + 1).toString()),
                          ),
                          // draw dotted line below the current step
                          if (i < currentStep) ...[
                            Expanded(
                              child: Container(
                                width: theme.lineWidth,
                                color: theme.lineColor,
                              ),
                            ),
                          ] else ...[
                            // dotted line
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
                      steps[i].content,
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
