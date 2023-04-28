import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bandit Manchot',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _icons = [
    'assets/images/bar.png',
    'assets/images/cerise.png',
    'assets/images/cloche.png',
    'assets/images/diamant.png',
    'assets/images/fer-a-cheval.png',
    'assets/images/pasteque.png',
    'assets/images/sept.png',
  ];

  String _leftIcon = 'assets/images/bar.png';
  String _centerIcon = 'assets/images/diamant.png';
  String _rightIcon = 'assets/images/sept.png';

  void _spin() {
    setState(() {
      final random = Random();
      _leftIcon = _icons[random.nextInt(_icons.length)];
      _centerIcon = _icons[random.nextInt(_icons.length)];
      _rightIcon = _icons[random.nextInt(_icons.length)];
    });

    if (_leftIcon == _centerIcon && _leftIcon == _rightIcon) {
      _showDialog('Jackpot !');
    } else {
      _showDialog('You Loose... Try again !');
    }
  }

  void _showDialog(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(message),
            actions: [
              FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bandit Manchot'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(_leftIcon, width: 100.0, height: 100.0),
              Image.asset(_centerIcon, width: 100.0, height: 100.0),
              Image.asset(_rightIcon, width: 100.0, height: 100.0),
            ],
          ),
          const SizedBox(height: 50.0),
          FloatingActionButton(
            onPressed: _spin,
            child: const Text('Spin'),
          ),
        ],
      ),
    );
  }
}
