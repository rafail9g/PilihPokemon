import 'package:flutter/material.dart';
import 'main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hide = true;

  final user = TextEditingController();
  final pass = TextEditingController();

  void login() {
    if (user.text == "rafail" && pass.text == "123") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LobbyScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Salah")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Login", style: TextStyle(fontSize: 24)),

            const SizedBox(height: 20),

            TextField(
              controller: user,
              decoration: const InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: pass,
              obscureText: hide,
              decoration: InputDecoration(
                labelText: "Password",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(hide ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() => hide = !hide),
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: login,
              child: const Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}