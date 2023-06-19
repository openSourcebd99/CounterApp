import 'package:flutter/material.dart';

class CounterDialog extends StatelessWidget {
  const CounterDialog(this.counter, {Key? key}) : super(key: key);

  final int counter;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Counter Alert'),
      content: Text('Counter value is $counter!'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
