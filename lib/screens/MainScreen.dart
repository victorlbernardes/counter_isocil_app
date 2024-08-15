import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final String machineName;
  final String userName;

  const MainScreen(this.machineName, this.userName, {super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int counter = 0;
  bool _isButtonEnabled = false;

  void _increment() {
    setState(() {
      counter++;
    });
    if (counter > 0) {
      setState(() {
        _isButtonEnabled = !_isButtonEnabled;
      });
    }
  }

  void _decrement() {
    setState(() {
      counter--;
    });
    if (counter < 1) {
      setState(() {
        _isButtonEnabled = !_isButtonEnabled;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Contador Isocil'),
          backgroundColor: const Color(0xAA00a0db)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Usuário: ${widget.userName}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Máquina: ${widget.machineName}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Contador: $counter',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isButtonEnabled ? _decrement : null,
                  child: const Text('-'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _increment,
                  child: const Text(
                    '+',
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
