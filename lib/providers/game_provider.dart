import 'dart:math';
import 'package:flutter/material.dart';
import '../models/models.dart';

class GameProvider with ChangeNotifier {
  int numPlayers = 3;
  List<Player> players = [];
  Category? selectedCategory;
  WordPair? currentPair;
  int currentPlayerTurnIndex = 0;
  
  void setNumPlayers(int n) {
    numPlayers = n;
    notifyListeners();
  }

  void initializePlayers() {
    final currentNames = players.map((e) => e.name).toList();
    players = List.generate(numPlayers, (index) {
      String defaultName = 'L3ab ${index + 1}';
      if (index < currentNames.length) {
        return Player(id: index.toString(), name: currentNames[index]);
      }
      return Player(id: index.toString(), name: defaultName);
    });
    notifyListeners();
  }

  void updatePlayerName(int index, String name) {
    if (name.trim().isNotEmpty) {
      players[index].name = name;
      notifyListeners();
    }
  }

  void selectCategory(Category cat) {
    selectedCategory = cat;
    notifyListeners();
  }

  void startGame() {
    if (selectedCategory == null) return;
    
    final random = Random();
    
    final pairs = selectedCategory!.pairs;
    currentPair = pairs[random.nextInt(pairs.length)];
    
    for (var p in players) {
      p.isL7achar = false;
      p.word = '';
    }
    
    int l7acharIndex = random.nextInt(players.length);
    players[l7acharIndex].isL7achar = true;
    
    for (var i = 0; i < players.length; i++) {
      if (i == l7acharIndex) {
        players[i].word = currentPair!.l7acharWord;
      } else {
        players[i].word = currentPair!.l3chirWord;
      }
    }
    
    currentPlayerTurnIndex = 0;
    notifyListeners();
  }

  void nextPlayerTurn() {
    currentPlayerTurnIndex++;
    notifyListeners();
  }
  
  bool get isPassingPhaseComplete => currentPlayerTurnIndex >= players.length;

  Player get randomPlayerToStart {
    final random = Random();
    return players[random.nextInt(players.length)];
  }
}