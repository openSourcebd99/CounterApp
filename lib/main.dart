import 'package:flutter/material.dart';

import 'counter_dialog.dart';

import 'second_screen.dart';

void main() {
  runApp(const MyCouterApp());
}

class MyCouterApp extends StatelessWidget {
  const MyCouterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterApp(title: 'Counter App'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CounterApp extends StatefulWidget {
  const CounterApp({super.key, required this.title});

  final String title;

  @override
  State<CounterApp> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterApp> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter == 5) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CounterDialog(_counter);
            });
      } else if (_counter == 10) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SecondScreen()));
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--;
      if (_counter == 5) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CounterDialog(_counter);
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter Value:',
            ),
            SizedBox(height: 10),
            Text(
              '$_counter',
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 2,
                  child: FractionallySizedBox(
                    widthFactor: 0.6,
                    child: ElevatedButton(
                      onPressed: _incrementCounter,
                      child: const Text('+'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Color of '+' button
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: FractionallySizedBox(
                    widthFactor: 0.4,
                    child: ElevatedButton(
                      onPressed: _decrementCounter,
                      child: const Text('-'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Color of '+' button
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
