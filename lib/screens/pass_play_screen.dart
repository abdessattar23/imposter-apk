import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';
import 'interrogation_screen.dart';

class PassPlayScreen extends StatefulWidget {
  const PassPlayScreen({super.key});

  @override
  State<PassPlayScreen> createState() => _PassPlayScreenState();
}

class _PassPlayScreenState extends State<PassPlayScreen> {
  bool _isShowing = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, game, child) {
        if (game.isPassingPhaseComplete) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const InterrogationScreen()),
            );
          });
          return const Scaffold(backgroundColor: Color(0xFF1B4332));
        }

        final player = game.players[game.currentPlayerTurnIndex];

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    _isShowing ? "Serek Howa:" : "3ti ltilifon l'",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24, color: Colors.white70),
                  ),
                  const SizedBox(height: 20),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: _isShowing
                        ? Column(
                            key: const ValueKey('showing'),
                            children: [
                              Text(
                                player.isL7achar ? "Nta l7achar!" : "Nta l3chir!",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              const SizedBox(height: 30),
                              Container(
                                padding: const EdgeInsets.all(25),
                                decoration: BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Theme.of(context).colorScheme.secondary, width: 2),
                                ),
                                child: Text(
                                  player.word,
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Text(
                            player.name,
                            key: const ValueKey('hiding'),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  ),
                  const SizedBox(height: 60),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isShowing ? Colors.grey[800] : Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      if (_isShowing) {
                        setState(() {
                          _isShowing = false;
                        });
                        game.nextPlayerTurn();
                      } else {
                        setState(() {
                          _isShowing = true;
                        });
                      }
                    },
                    child: Text(
                      _isShowing ? 'Khebbi' : 'Werrini',
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}