// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:flutter_stepper/stepper.dart';

class VerticalSinglePageStepper extends StatefulWidget {
  const VerticalSinglePageStepper({Key? key}) : super(key: key);

  @override
  State<VerticalSinglePageStepper> createState() =>
      _VerticalSinglePageStepperState();
}

class _VerticalSinglePageStepperState extends State<VerticalSinglePageStepper> {
  int _currentStep = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: MultiStepperView(
            theme: StepperTheme(
              stepIndicatorTextStyleActive:
                  Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: Colors.black,
                      ),
              stepIndicatorTextStyleInactive:
                  Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: Colors.white,
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
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    Text(
                      'Selecteer een datum',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
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
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    Text(
                      'Selecteer een tijd',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
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
                    const Text(
                      'Product',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Welk product',
                      style: TextStyle(
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
                    const Text(
                      'Temperatuur',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Selecteer gemeten temperatuur',
                      style: TextStyle(
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
                    const Text(
                      'Norm',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Selecteer gemeten temperatuur',
                      style: TextStyle(
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
                    const Text(
                      'Maatregel',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Omschrijving',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 50),
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
}
