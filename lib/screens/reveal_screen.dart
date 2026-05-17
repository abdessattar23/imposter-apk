import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';
import 'category_screen.dart';

class RevealScreen extends StatefulWidget {
  const RevealScreen({super.key});

  @override
  State<RevealScreen> createState() => _RevealScreenState();
}

class _RevealScreenState extends State<RevealScreen> {
  bool _revealed = false;
  bool _drumroll = false;

  void _revealImposter() {
    setState(() {
      _drumroll = true;
    });
    
    Future.delayed(const Duration(seconds: 3), () {
      if(mounted) {
        setState(() {
          _drumroll = false;
          _revealed = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<GameProvider>(context);
    final l7achar = game.players.firstWhere((p) => p.isL7achar);
    
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!_revealed && !_drumroll) ...[
                  const Text(
                    "Sawtou b jhd!",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: _revealImposter,
                    child: const Text(
                      'Chkon l 7achar?',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
                
                if (_drumroll) ...[
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.secondary,
                      strokeWidth: 8,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Kan9elbou...",
                    style: TextStyle(fontSize: 28, color: Colors.white70),
                  ),
                ],

                if (_revealed) ...[
                  const Text(
                    "L7achar howa:",
                    style: TextStyle(fontSize: 32, color: Colors.white70),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    l7achar.name,
                    style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Klmat L7achar: ${game.currentPair!.l7acharWord}",
                          style: TextStyle(fontSize: 22, color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Klmat L3chir: ${game.currentPair!.l3chirWord}",
                          style: const TextStyle(fontSize: 22, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const CategoryScreen()),
                        (route) => route.isFirst,
                      );
                    },
                    child: const Text(
                      'L3ab Tani',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}