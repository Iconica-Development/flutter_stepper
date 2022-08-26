import 'package:flutter/material.dart';
import 'package:stepper/stepper.dart';

class VerticalMultiPageStepper extends StatefulWidget {
  const VerticalMultiPageStepper({Key? key}) : super(key: key);

  @override
  State<VerticalMultiPageStepper> createState() =>
      _VerticalMultiPageStepperState();
}

class _VerticalMultiPageStepperState extends State<VerticalMultiPageStepper> {
  final int _currentStep = 1;

  @override
  Widget build(BuildContext context) {
    return MultiStepperView(
      showAllSteps: false,
      currentStep: _currentStep,
      steps: [
        MultiViewStep(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Wie ben je?'),
              const SizedBox(
                height: 50,
              ),
              const Text('Hobbies, wat vind je leuk om te doen?'),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
        MultiViewStep(
          content: Column(
            children: [
              const Text('Upload profiel foto'),
              const SizedBox(
                height: 200,
              ),
              const Text('Laat je zien aan je collega\'s')
            ],
          ),
        ),
      ],
    );
  }
}
