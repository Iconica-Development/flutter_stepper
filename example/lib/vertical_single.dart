// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:flutter_stepper/stepper.dart';

class VerticalSinglePageStepper extends StatefulWidget {
  const VerticalSinglePageStepper({super.key});

  @override
  State<VerticalSinglePageStepper> createState() =>
      _VerticalSinglePageStepperState();
}

class _VerticalSinglePageStepperState extends State<VerticalSinglePageStepper> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: MultiStepperView(
                showOnlyCurrentStep: true,
                theme: StepperTheme(
                  stepIndicatorTheme: StepIndicatorTheme(
                    activeBackgroundColor: Colors.white,
                    activeTextStyle:
                        Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.black,
                            ),
                    activeBorder: Border.all(
                      color: Colors.white,
                    ),
                    inactiveBackgroundColor: Colors.black,
                    inactiveTextStyle:
                        Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                            ),
                    inactiveBorder: Border.all(
                      color: Colors.white,
                    ),
                    completedBackgroundColor: Colors.green,
                    completedTextStyle:
                        Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                            ),
                  ),
                  lineColor: Colors.white,
                ),
                showAllSteps: true,
                currentStep: _currentStep,
                zeroIndexed: false,
                onStepTapped: (value) {
                  debugPrint('step tapped: ${value + 1}');
                },
                steps: [
                  MultiViewStep(
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Datum',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        Text(
                          'Selecteer een datum',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                  MultiViewStep(
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tijd',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        Text(
                          'Selecteer een tijd',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                  const MultiViewStep(
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Product',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Welk product',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                  const MultiViewStep(
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Temperatuur',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Selecteer gemeten temperatuur',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                  const MultiViewStep(
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Norm',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Selecteer gemeten temperatuur',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                  const MultiViewStep(
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Maatregel',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Omschrijving',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                  const MultiViewStep(
                    content: Text(
                      'Akkoord',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // button to go to next step
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (_currentStep < 6) {
                  _currentStep += 1;
                }
              });
            },
            child: const Text('Volgende'),
          ),
        ],
      );
}
