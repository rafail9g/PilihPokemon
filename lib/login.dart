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

            InputField("Username", user),

            const SizedBox(height: 15),

            InputField(
              "Password",
              pass,
              obscure: hide,
              icon: IconButton(
                icon: Icon(hide ? Icons.visibility_off : Icons.visibility),
                onPressed: () => setState(() => hide = !hide),
              ),
            ),

            const SizedBox(height: 20),

            LoginButton(onPressed: login),
          ],
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscure;
  final Widget? icon;

  const InputField(
    this.label,
    this.controller, {
    this.obscure = false,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        suffixIcon: icon,
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LoginButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text("Login"),
    );
  }
}