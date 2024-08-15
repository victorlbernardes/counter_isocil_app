import 'package:counter_isocil_app/screens/MainScreen.dart';
import 'package:counter_isocil_app/service/AppwriteService.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AppwriteService appwriteService = AppwriteService();
  String? selectedUser;
  String? selectedMachine;
  List<Map<String, dynamic>> userList = [];
  List<Map<String, dynamic>> machineList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final documentUser = await appwriteService.fetchDocuments(
          '66aa4055003a590a40ce', '66aa522d003e7c88f4e9');
      final documentMachine = await appwriteService.fetchDocuments(
          '66aa4055003a590a40ce', '66aa524f003b8a919890');

      setState(() {
        userList = documentUser.map((doc) {
          return {
            'id': doc.data['nome'] ?? 'Sem nome',
            'name': doc.data['nome'] ?? 'Sem nome',
          };
        }).toList();
        machineList = documentMachine.map((doc) {
          return {
            'id': doc.data['nome'] ?? 'Sem nome',
            'name': doc.data['nome'] ?? 'Sem nome',
          };
        }).toList();
      });
    } catch (e) {
      // Tratar erro aqui
      print('Erro ao buscar dados: $e');
    }
  }

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
            userList.isEmpty
                ? CircularProgressIndicator()
                : DropdownButton<String>(
                    value: selectedUser,
                    items: userList.map((item) {
                      return DropdownMenuItem<String>(
                        value: item['id'],
                        child: Text(item['name']),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedUser = value;
                      });
                    },
                    hint: Text('Selecione um usuário'),
                  ),
            SizedBox(height: 20),
            machineList.isEmpty
                ? CircularProgressIndicator()
                : DropdownButton<String>(
                    value: selectedMachine,
                    items: machineList.map((item) {
                      return DropdownMenuItem<String>(
                        value: item['id'],
                        child: Text(item['name']),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedMachine = value;
                      });
                    },
                    hint: Text('Selecione uma máquina'),
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
