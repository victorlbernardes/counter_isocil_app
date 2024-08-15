import 'package:counter_isocil_app/screens/MainScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? selectedUser;
  String? selectedMachine;

  final List<String> users = ['Baltazar', 'Gaspar', 'Melchior'];
  final List<String> machines = [
    'Bloqueira',
    'Corte 1',
    'Corte 2',
    'Expansor',
    'Pré Expansor'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador Isocil'),
        backgroundColor: const Color(0xAA00a0db),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/isocil_logo.png'),
            DropdownButton<String>(
              value: selectedUser,
              hint: const Text(
                'Selecione o Usuário',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              items: users.map((user) {
                return DropdownMenuItem(
                  value: user,
                  child: Text(user),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedUser = value;
                });
              },
            ),
            DropdownButton<String>(
              value: selectedMachine,
              hint: const Text(
                'Selecione à Máquina',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              items: machines.map((machine) {
                return DropdownMenuItem(
                  value: machine,
                  child: Text(machine),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedMachine = value;
                });
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xAA00a0db),
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 15,
              ),
              onPressed: () {
                if (selectedMachine != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MainScreen(selectedMachine!, selectedUser!),
                    ),
                  );
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
