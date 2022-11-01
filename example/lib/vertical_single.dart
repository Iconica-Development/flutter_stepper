// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:stepper/stepper.dart';

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
                    Text('Datum', style: Theme.of(context).textTheme.headline6),
                    Text('Datum', style: Theme.of(context).textTheme.bodyText2),
                  ],
                ),
                size: 100,
              ),
              MultiViewStep(
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tijd',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      'Selecteer een tijd',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
              MultiViewStep(
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Product'),
                    const Text('Welk product'),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
              MultiViewStep(
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Temperatuur'),
                    const Text('Selecteer gemeten temperatuur'),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
              MultiViewStep(
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Norm'),
                    const Text('Selecteer gemeten temperatuur'),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
              MultiViewStep(
                content: Column(
                  children: [
                    const Text('Maatregel'),
                    const Text('Omschrijving'),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
              const MultiViewStep(content: Text('Akkoord')),
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
