import '../models/models.dart';

class GameDatabase {
  static final List<Category> categories = [
    Category(
      id: 'makla',
      name: 'Makla (Food)',
      description: 'Lmakla dl mgharba',
      pairs: [
        WordPair(l3chirWord: 'Bissara', l7acharWord: 'Loubia'),
        WordPair(l3chirWord: 'Raib', l7acharWord: 'Danone'),
        WordPair(l3chirWord: 'Chwa', l7acharWord: 'Kebab'),
        WordPair(l3chirWord: 'Lmsmmn', l7acharWord: 'L7archa'),
        WordPair(l3chirWord: 'Zari3a', l7acharWord: 'Goufya'),
      ],
    ),
    Category(
      id: 'lbsala',
      name: 'Lbsala & Objects',
      description: 'Tkhirbi9 wlbsala',
      pairs: [
        WordPair(l3chirWord: 'Mika K7la', l7acharWord: 'Cabas'),
        WordPair(l3chirWord: 'Bota Sghira', l7acharWord: 'Bota Kbira'),
        WordPair(l3chirWord: 'Jffaf', l7acharWord: 'Chataaba'),
        WordPair(l3chirWord: 'Sandalat Mika', l7acharWord: 'Sbbat'),
        WordPair(l3chirWord: 'Tila', l7acharWord: 'Tlfaza'),
      ],
    ),
    Category(
      id: 'lm3icha',
      name: 'Lm3icha (Daily Life)',
      description: 'Hyatna lyawmiya',
      pairs: [
        WordPair(l3chirWord: 'Moul L7anout', l7acharWord: 'Moul Lkhodra'),
        WordPair(l3chirWord: 'L9hwa', l7acharWord: 'Snookar'),
        WordPair(l3chirWord: 'L7emmam', l7acharWord: 'Lb7er'),
        WordPair(l3chirWord: 'Souq', l7acharWord: 'Mall'),
      ],
    ),
    Category(
      id: 'mowasalat',
      name: 'Mowasalat (Transport)',
      description: 'Kifash kant7arko',
      pairs: [
        WordPair(l3chirWord: 'Honda', l7acharWord: 'Khatafa'),
        WordPair(l3chirWord: 'Petit Taxi', l7acharWord: 'Grand Taxi'),
        WordPair(l3chirWord: 'Tomobil d Lbouliss', l7acharWord: 'Sbitar'),
      ],
    ),
  ];
}