import 'package:flutter/material.dart';

import '../widget/button.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Demo Button Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 30),
            Button(
              label: Text('Button'),
              buttonType: ButtonType.elevated,
              onPressed: _incrementCounter,
            ),
            const SizedBox(height: 30),
            Button(
              label: Text('Button'),
              buttonType: ButtonType.filled,
              onPressed: _incrementCounter,
            ),
            const SizedBox(height: 30),
            Button(
              label: Text('Button'),
              buttonType: ButtonType.outlined,
              onPressed: _incrementCounter,
            ),
            const SizedBox(height: 30),
            Button(
              label: Text('Button'),
              buttonType: ButtonType.text,
              onPressed: _incrementCounter,
            ),
            const SizedBox(height: 30),
            Button(
              label: Text('Button with icon'),
              buttonType: ButtonType.elevated,
              icon: const Icon(Icons.add),
              onPressed: _incrementCounter,
            ),
            const SizedBox(height: 30),
            Button(
              label: Text('Button with right icon'),
              buttonType: ButtonType.outlined,
              icon: const Icon(Icons.add),
              iconAlignment: IconAlignment.end,
              onPressed: _incrementCounter,
            ),
            const SizedBox(height: 30),
            Button(
              buttonType: ButtonType.filled,
              icon: const Icon(Icons.add),
              iconAlignment: IconAlignment.end,
              onPressed: _incrementCounter,
            ),
            const SizedBox(height: 30),
            Button(
              label: Text('Full width button'),
              buttonType: ButtonType.elevated,
              onPressed: _incrementCounter,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
