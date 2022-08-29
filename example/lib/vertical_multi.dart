import 'package:flutter/material.dart';
import 'package:stepper/stepper.dart';

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
          ),
        ),
        MultiStepperView(
          showAllSteps: false,
          currentStep: _currentStep,
          steps: [
            MultiViewStep(
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Wie ben je?'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Hobbies, wat vind je leuk om te doen?'),
                ],
              ),
            ),
            MultiViewStep(
              content: Column(
                children: [
                  const Text('Upload profiel foto'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Laat je zien aan je collega\'s'),
                ],
              ),
            ),
            MultiViewStep(
              content: Column(
                children: [
                  const Text('Smoelenboek'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Wat mogen collega\'s'),
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