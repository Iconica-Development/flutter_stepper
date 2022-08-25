import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: StepperDemo()));
}

class StepperDemo extends StatelessWidget {
  const StepperDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text('StepperDemo'));
  }
}
