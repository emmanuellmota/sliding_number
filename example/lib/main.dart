import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sliding_number/sliding_number.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ValueNotifier<num> _pointsNotifier = ValueNotifier(3.21);
  final random = Random();

  void _incrementPoints() {
    _pointsNotifier.value = num.parse((_pointsNotifier.value + 1.22).toStringAsFixed(2));
  }

  void _decrementPoints() {
    _pointsNotifier.value = num.parse((_pointsNotifier.value - 1.22).toStringAsFixed(2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SlidingNumber Demo'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(child: Container()),
            const Text('Your points:'),
            ValueListenableBuilder(
                valueListenable: _pointsNotifier,
                builder: (_, num points, __) {
                  return SlidingNumber(
                    numberString: 'R\$ ' + points.toString().replaceAll('.', ','),
                    style: Theme.of(context).textTheme.displaySmall!,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOutQuint,
                  );
                }),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    onPressed: _decrementPoints,
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: _incrementPoints,
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
