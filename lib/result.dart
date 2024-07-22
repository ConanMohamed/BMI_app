import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key,
      required this.result,
      required this.isMale,
      required this.age});
  final double result;
  final bool isMale;
  final int age;

  String get resultHealth {
    String resultTest = '';
    if (result >= 30) {
      resultTest = 'Obese';
    } else if (result >= 25 && result < 30) {
      resultTest = 'Overweight';
    } else if (result >= 18.5 && result <= 24.99) {
      resultTest = 'Normal';
    } else {
      resultTest = 'Thin';
    }
    return resultTest;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Gender : ${isMale ? 'male' : 'Female'}',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              'Result : ${result.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              'Healthness : $resultHealth',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              'Age : $age',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      )),
    );
  }
}
