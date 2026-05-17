import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/database.dart';
import '../providers/game_provider.dart';
import 'pass_play_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = GameDatabase.categories;

    return Scaffold(
      appBar: AppBar(
        title: const Text('3zel Lkategori', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.85,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final cat = categories[index];
              return InkWell(
                onTap: () {
                  final game = Provider.of<GameProvider>(context, listen: false);
                  game.selectCategory(cat);
                  game.startGame();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PassPlayScreen()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor,
                        const Color(0xFFA4031F),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _getIconForCategory(cat.id),
                          size: 50,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          cat.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          cat.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  IconData _getIconForCategory(String id) {
    switch (id) {
      case 'makla':
        return Icons.fastfood;
      case 'lbsala':
        return Icons.shopping_bag;
      case 'lm3icha':
        return Icons.storefront;
      case 'mowasalat':
        return Icons.directions_car;
      default:
        return Icons.category;
    }
  }
}