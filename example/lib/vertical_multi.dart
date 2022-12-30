// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:flutter_stepper/stepper.dart';

class VerticalMultiPageStepper extends StatefulWidget {
  const VerticalMultiPageStepper({Key? key}) : super(key: key);

  @override
  State<VerticalMultiPageStepper> createState() =>
      _VerticalMultiPageStepperState();
}

class _VerticalMultiPageStepperState extends State<VerticalMultiPageStepper> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // lorem ipsum for 5 lines long

        const Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do '
            'eiusmod tempor incididunt ut labore et dolore magna aliqua. '
            'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris'
            ' nisi ut aliquip ex ea commodo consequat.',
            style: TextStyle(color: Colors.white),
          ),
        ),
        MultiStepperView(
          theme: StepperTheme(
            stepIndicatorActiveTheme: StepIndicatorActiveTheme(
                backgroundColor: Colors.white,
                textStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: Colors.black,
                    ),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              stepIndicatorInactiveTheme: StepIndicatorInactiveTheme(
                backgroundColor: Colors.black,
                textStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: Colors.white,
                    ),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              stepIndicatorDoneTheme: StepIndicatorDoneTheme(
                backgroundColor: Colors.green,
                textStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: Colors.white,
                    ),
              ),
            lineColor: Colors.white,
          ),
          showAllSteps: false,
          currentStep: _currentStep,
          steps: [
            MultiViewStep(
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Wie ben je?',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Hobbies, wat vind je leuk om te doen?',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            MultiViewStep(
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Upload profiel foto',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Laat je zien aan je collega\'s',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            MultiViewStep(
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Smoelenboek',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Wat mogen collega\'s',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
        // button for forward and backward
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_currentStep > 0) {
                    _currentStep -= 1;
                  }
                });
              },
              child: const Text('Vorige'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_currentStep < 2) {
                    _currentStep += 1;
                  }
                });
              },
              child: const Text('Volgende'),
            ),
          ],
        ),
      ],
    );
  }
}
