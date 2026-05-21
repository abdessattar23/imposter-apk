import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';
import 'category_screen.dart';

class PlayerSetupScreen extends StatefulWidget {
  const PlayerSetupScreen({super.key});

  @override
  State<PlayerSetupScreen> createState() => _PlayerSetupScreenState();
}

class _PlayerSetupScreenState extends State<PlayerSetupScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GameProvider>(context, listen: false).initializePlayers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chkoun ghayl3ab?', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Consumer<GameProvider>(
          builder: (context, game, child) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Ch7al bikom?',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle, color: Colors.white, size: 30),
                            onPressed: game.numPlayers > 3
                                ? () {
                                    game.setNumPlayers(game.numPlayers - 1);
                                    game.initializePlayers();
                                  }
                                : null,
                          ),
                          Text(
                            '${game.numPlayers}',
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_circle, color: Colors.white, size: 30),
                            onPressed: game.numPlayers < 15
                                ? () {
                                    game.setNumPlayers(game.numPlayers + 1);
                                    game.initializePlayers();
                                  }
                                : null,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Ch7al mn Jwala (Rounds)?',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle, color: Colors.white, size: 30),
                            onPressed: game.numRounds > 1
                                ? () {
                                    game.setNumRounds(game.numRounds - 1);
                                  }
                                : null,
                          ),
                          Text(
                            '${game.numRounds}',
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_circle, color: Colors.white, size: 30),
                            onPressed: game.numRounds < 10
                                ? () {
                                    game.setNumRounds(game.numRounds + 1);
                                  }
                                : null,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    itemCount: game.players.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: TextFormField(
                          key: ValueKey(game.players[index].id),
                          initialValue: game.players[index].name.startsWith('L3ab') ? '' : game.players[index].name,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'L3ab ${index + 1}',
                            hintText: 'Smiya dl l3ab',
                            hintStyle: const TextStyle(color: Colors.white30),
                            labelStyle: const TextStyle(color: Colors.white70),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white30),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            filled: true,
                            fillColor: Colors.black12,
                          ),
                          onChanged: (val) {
                            game.updatePlayerName(index, val);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      minimumSize: const Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CategoryScreen()),
                      );
                    },
                    child: const Text(
                      'Zid Lgoudam',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}