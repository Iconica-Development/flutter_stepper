import 'package:flutter/material.dart';
import 'package:stepper_example/vertical_multi.dart';
import 'package:stepper_example/vertical_single.dart';

void main() {
  runApp(const MaterialApp(home: StepperDemo()));
}

class StepperDemo extends StatefulWidget {
  const StepperDemo({Key? key}) : super(key: key);

  @override
  State<StepperDemo> createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  bool _showAllSteps = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          top: MediaQuery.of(context).size.height * 0.05,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  const Text('Show all steps'),
                  Switch(
                    value: _showAllSteps,
                    onChanged: (value) {
                      setState(() {
                        _showAllSteps = value;
                      });
                    },
                  ),
                ],
              ),
              if (_showAllSteps) ...[
                const VerticalSinglePageStepper()
              ] else ...[
                const VerticalMultiPageStepper(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
