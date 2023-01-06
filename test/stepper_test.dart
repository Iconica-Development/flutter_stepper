// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:flutter_stepper/stepper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MultiStepperView has a step indicator', (tester) async {
    // Act
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: MultiStepperView(
            currentStep: 0,
            showAllSteps: true,
            steps: [
              MultiViewStep(
                content: Text(
                  'First page',
                ),
              ),
              MultiViewStep(
                content: Text(
                  'Second page',
                ),
              ),
            ],
          ),
        ),
      ),
    );
    var pageFinder = find.text('1');
    var secondPageFinder = find.text('2');
    var contentFinder = find.text('First page');

    // Assert
    expect(pageFinder, findsOneWidget);
    expect(secondPageFinder, findsOneWidget);
    expect(contentFinder, findsOneWidget);
  });

  testWidgets('MultiStepperView shows only one step', (tester) async {
    // Act
    await tester.pumpWidget(
      const MaterialApp(
        home: MultiStepperView(
          currentStep: 1,
          showAllSteps: false,
          steps: [
            MultiViewStep(
              content: Text(
                'First page',
              ),
            ),
            MultiViewStep(
              content: Text(
                'Second page',
              ),
            ),
          ],
        ),
      ),
    );
    var pageFinder = find.text('1');
    var secondPageFinder = find.text('2');
    var contentFinder = find.text('Second page');

    // Assert
    expect(pageFinder, findsNothing);
    expect(secondPageFinder, findsOneWidget);
    expect(contentFinder, findsOneWidget);
  });

  testWidgets('MultiStepperView draws line between steps', (tester) async {
    // Act
    await tester.pumpWidget(
      const MaterialApp(
        home: MultiStepperView(
          showAllSteps: true,
          currentStep: 0,
          steps: [
            MultiViewStep(
              content: Text(
                'First page',
              ),
              size: 150,
            ),
            MultiViewStep(
              content: Text(
                'Second page',
              ),
              size: 150,
            ),
            MultiViewStep(
              content: Text(
                'Third page',
              ),
              size: 150,
            ),
          ],
        ),
      ),
    );
    var lineFinder = find.byType(CustomPaint);

    // Assert
    expect(lineFinder, findsNWidgets(4));
  });
}
