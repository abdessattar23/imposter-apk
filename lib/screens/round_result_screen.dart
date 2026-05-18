import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';
import 'pass_play_screen.dart';
import 'final_results_screen.dart';

class RoundResultScreen extends StatelessWidget {
  final bool l7acharCaught;
  const RoundResultScreen({super.key, required this.l7acharCaught});

  @override
  Widget build(BuildContext context) {
    // We fetch game once without listening for the whole screen to avoid rebuild issues during navigation
    final game = Provider.of<GameProvider>(context, listen: false);
    final l7acharPlayer = game.players.firstWhere((p) => p.isL7achar);
    
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                l7acharCaught ? 'L7achar Tchad!' : 'L7achar Hrab!',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: l7acharCaught ? Colors.greenAccent : Colors.redAccent,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'L7achar kan howa: ${l7acharPlayer.name}',
                style: const TextStyle(fontSize: 24, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Lkelma dial l7achar kant: ${game.currentPair?.l7acharWord}\nLkelma dial l3echran kant: ${game.currentPair?.l3chirWord}',
                style: const TextStyle(fontSize: 18, color: Colors.white70),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              const Text(
                'Nta2ij (Scores):',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: game.players.length,
                  itemBuilder: (context, index) {
                    final p = game.players[index];
                    return ListTile(
                      title: Text(p.name, style: const TextStyle(color: Colors.white, fontSize: 20)),
                      trailing: Text('${p.score} pt(s)', style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 20, fontWeight: FontWeight.bold)),
                    );
                  },
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  final navigator = Navigator.of(context);
                  if (game.currentRound < game.numRounds) {
                    game.nextRound();
                    navigator.pushReplacement(
                      MaterialPageRoute(builder: (context) => const PassPlayScreen()),
                    );
                  } else {
                    navigator.pushReplacement(
                      MaterialPageRoute(builder: (context) => const FinalResultsScreen()),
                    );
                  }
                },
                child: Text(
                  game.currentRound < game.numRounds ? 'Round Jdid (Next Round)' : 'Chouf Chkoun Rba7 (Final Results)',
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}