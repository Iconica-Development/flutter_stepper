// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import 'package:flutter/material.dart';
import 'package:flutter_stepper/stepper.dart';

class VerticalMultiPageStepper extends StatefulWidget {
  const VerticalMultiPageStepper({super.key});

  @override
  State<VerticalMultiPageStepper> createState() =>
      _VerticalMultiPageStepperState();
}

class _VerticalMultiPageStepperState extends State<VerticalMultiPageStepper> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          // lorem ipsum for 5 lines long

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do '
              'eiusmod tempor incididunt ut labore et dolore magna aliqua. '
              'Ut enim ad minim veniam, quis nostrud exercitation ullamco'
              ' laboris nisi ut aliquip ex ea commodo consequat.',
              style: TextStyle(color: Colors.white),
            ),
          ),
          MultiStepperView(
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
            showAllSteps: false,
            currentStep: _currentStep,
            steps: const [
              MultiViewStep(
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wie ben je?',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
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
                    Text(
                      'Upload profiel foto',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
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
                    Text(
                      'Smoelenboek',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
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
