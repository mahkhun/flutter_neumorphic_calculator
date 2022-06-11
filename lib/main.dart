import 'package:flutter/material.dart';
import 'calculator_widgets/calculator_main.dart';

void main() {
  runApp(const CalculatorApplication());
}

class CalculatorApplication extends StatelessWidget {
  const CalculatorApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalculatorWidget(),
    );
  }
}
