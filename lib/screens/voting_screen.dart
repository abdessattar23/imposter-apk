import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';
import 'round_result_screen.dart';

class VotingScreen extends StatefulWidget {
  const VotingScreen({super.key});

  @override
  State<VotingScreen> createState() => _VotingScreenState();
}

class _VotingScreenState extends State<VotingScreen> {
  int currentPlayerVotingIndex = 0;
  String? selectedVoteId;
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    if (isFinished) {
      return const Scaffold(body: Center(child: CircularProgressIndicator(color: Color(0xFFD4AF37))));
    }

    return Consumer<GameProvider>(
      builder: (context, game, child) {
        if (currentPlayerVotingIndex >= game.players.length) {
           return const Scaffold(body: Center(child: CircularProgressIndicator(color: Color(0xFFD4AF37))));
        }

        final voter = game.players[currentPlayerVotingIndex];

        return Scaffold(
          appBar: AppBar(
            title: const Text('Tswit (Voting)', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    '${voter.name}, chkoun f nadarak l7achar?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: ListView.builder(
                      itemCount: game.players.length,
                      itemBuilder: (context, index) {
                        final candidate = game.players[index];
                        // Cannot vote for self
                        if (candidate.id == voter.id) return const SizedBox.shrink();

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedVoteId = candidate.id;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: selectedVoteId == candidate.id ? Theme.of(context).colorScheme.secondary : Colors.black12,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: selectedVoteId == candidate.id ? Colors.white : Colors.white30,
                                  width: 2,
                                ),
                              ),
                              child: Text(
                                candidate.name,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: selectedVoteId == candidate.id ? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedVoteId != null ? Theme.of(context).primaryColor : Colors.grey,
                      minimumSize: const Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: selectedVoteId != null
                        ? () {
                            game.voteForPlayer(selectedVoteId!);
                            if (currentPlayerVotingIndex < game.players.length - 1) {
                              setState(() {
                                currentPlayerVotingIndex++;
                                selectedVoteId = null;
                              });
                            } else {
                              setState(() {
                                isFinished = true;
                              });
                              bool caught = game.endRound();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => RoundResultScreen(l7acharCaught: caught)),
                              );
                            }
                          }
                        : null,
                    child: const Text(
                      'Sawwet (Vote)',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
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