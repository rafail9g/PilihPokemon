import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(const PokemonApp());
}

class PokemonApp extends StatelessWidget {
  const PokemonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(), // mulai dari login
    );
  }
}

class LobbyScreen extends StatefulWidget {
  const LobbyScreen({super.key});

  @override
  State<LobbyScreen> createState() => _LobbyScreenState();
}

class _LobbyScreenState extends State<LobbyScreen> {
  int index = 0;

  final List<Map<String, dynamic>> pokemon = [
    {
      "name": "Pikachu",
      "type": "Electric",
      "icon": Icons.flash_on,
      "color": Colors.yellow
    },
    {
      "name": "Charmander",
      "type": "Fire",
      "icon": Icons.local_fire_department,
      "color": Colors.red
    },
    {
      "name": "Squirtle",
      "type": "Water",
      "icon": Icons.water_drop,
      "color": Colors.blue
    },
  ];

  void changePokemon() {
    setState(() {
      index = (index + 1) % pokemon.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    var p = pokemon[index];

    return Scaffold(
      backgroundColor: p["color"].withOpacity(0.2),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // PROFILE
            Row(
              children: const [
                CircleAvatar(
                  child: Icon(Icons.person),
                ),
                SizedBox(width: 10),
                Text("Rafail", style: TextStyle(fontSize: 18)),
              ],
            ),

            const SizedBox(height: 30),

            // POKEMON
            GestureDetector(
              onTap: changePokemon,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: p["color"],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Icon(p["icon"], size: 80, color: Colors.white),
                    const SizedBox(height: 10),
                    Text(p["name"],
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20)),
                    Text(p["type"],
                        style: const TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
