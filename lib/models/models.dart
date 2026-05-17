class WordPair {
  final String l3chirWord;
  final String l7acharWord;

  WordPair({required this.l3chirWord, required this.l7acharWord});
}

class Category {
  final String id;
  final String name;
  final String description;
  final List<WordPair> pairs;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.pairs,
  });
}

class Player {
  final String id;
  String name;
  bool isL7achar;
  String word;

  Player({
    required this.id,
    required this.name,
    this.isL7achar = false,
    this.word = '',
  });
}