import 'dart:math';
import 'package:flutter/material.dart';
import '../models/models.dart';
import '../data/database.dart';

class GameProvider with ChangeNotifier {
  int numPlayers = 3;
  int numRounds = 3;
  int currentRound = 1;
  List<Player> players = [];
  List<Category> selectedCategories = [];
  Category? currentRoundCategory;
  WordPair? currentPair;
  int currentPlayerTurnIndex = 0;
  
  void setNumPlayers(int n) {
    numPlayers = n;
    notifyListeners();
  }

  void setNumRounds(int n) {
    numRounds = n;
    notifyListeners();
  }

  void initializePlayers() {
    final currentNames = players.map((e) => e.name).toList();
    players = List.generate(numPlayers, (index) {
      String defaultName = 'L3ab ${index + 1}';
      if (index < currentNames.length) {
        return Player(id: index.toString(), name: currentNames[index], score: 0, votes: 0);
      }
      return Player(id: index.toString(), name: defaultName, score: 0, votes: 0);
    });
    notifyListeners();
  }

  void updatePlayerName(int index, String name) {
    if (name.trim().isNotEmpty) {
      players[index].name = name;
      notifyListeners();
    }
  }

  void toggleCategory(Category cat) {
    if (selectedCategories.any((c) => c.id == cat.id)) {
      selectedCategories.removeWhere((c) => c.id == cat.id);
    } else {
      selectedCategories.add(cat);
    }
    notifyListeners();
  }

  void startGame() {
    currentRound = 1;
    for (var p in players) {
      p.score = 0;
    }
    startRound();
  }

  void startRound() {
    if (selectedCategories.isEmpty) return;
    
    final random = Random();
    
    // Pick a random category from selected ones
    currentRoundCategory = selectedCategories[random.nextInt(selectedCategories.length)];
    List<String> words = [];
    
    if (currentRoundCategory!.id == 'rwina') {
      // Gather all words from all categories except rwina
      for (var cat in GameDatabase.categories) {
        if (cat.id != 'rwina') {
          words.addAll(cat.words);
        }
      }
    } else {
      words = currentRoundCategory!.words;
    }
    
    // Randomly pick two distinct words from the massive list
    String l3chirWord = words[random.nextInt(words.length)];
    String l7acharWord;
    do {
      l7acharWord = words[random.nextInt(words.length)];
    } while (l7acharWord == l3chirWord);
    
    currentPair = WordPair(l3chirWord: l3chirWord, l7acharWord: l7acharWord);
    
    for (var p in players) {
      p.isL7achar = false;
      p.word = '';
      p.votes = 0; // Reset votes for the round
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

  void voteForPlayer(String playerId) {
    var player = players.firstWhere((p) => p.id == playerId);
    player.votes += 1;
    notifyListeners();
  }

  // Calculate results for the round
  bool endRound() {
    int maxVotes = 0;
    List<Player> mostVoted = [];
    
    for (var p in players) {
      if (p.votes > maxVotes) {
        maxVotes = p.votes;
        mostVoted = [p];
      } else if (p.votes == maxVotes) {
        mostVoted.add(p);
      }
    }

    bool l7acharCaught = mostVoted.length == 1 && mostVoted.first.isL7achar;

    if (l7acharCaught) {
      // L3echran win this round, everyone EXCEPT L7achar gets 1 point
      for (var p in players) {
        if (!p.isL7achar) p.score += 1;
      }
    } else {
      // L7achar wins, gets 2 points
      for (var p in players) {
        if (p.isL7achar) p.score += 2;
      }
    }
    
    notifyListeners();
    return l7acharCaught;
  }

  void nextRound() {
    currentRound++;
    startRound();
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