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
        child: Consumer<GameProvider>(
          builder: (context, game, child) {
            return Column(
              children: [
                Expanded(
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
                        final isSelected = game.selectedCategories.any((c) => c.id == cat.id);
                        
                        return InkWell(
                          onTap: () {
                            game.toggleCategory(cat);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: isSelected 
                                  ? [Theme.of(context).colorScheme.secondary, const Color(0xFFD4AF37)] // Gold if selected
                                  : [Theme.of(context).primaryColor, const Color(0xFFA4031F)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: isSelected ? 12 : 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                              border: isSelected ? Border.all(color: Colors.white, width: 2) : null,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    _getIconForCategory(cat.id),
                                    size: 50,
                                    color: isSelected ? Colors.black87 : Theme.of(context).colorScheme.secondary,
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    cat.name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: isSelected ? Colors.black87 : Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    cat.description,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: isSelected ? Colors.black54 : Colors.white70,
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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: game.selectedCategories.isNotEmpty 
                          ? Theme.of(context).colorScheme.secondary 
                          : Colors.grey,
                      minimumSize: const Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: game.selectedCategories.isNotEmpty ? () {
                      game.startGame();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PassPlayScreen()),
                      );
                    } : null,
                    child: const Text(
                      'Yallah Bdaw',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
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

  IconData _getIconForCategory(String id) {
    switch (id) {
      case 'makla':
        return Icons.fastfood;
      case 'taqafa':
        return Icons.mosque;
      case 'ddar':
        return Icons.home;
      case 'hyatna':
        return Icons.people;
      case 'mowasalat':
        return Icons.directions_car;
      case 'koura':
        return Icons.sports_soccer;
      case 'blayssat':
        return Icons.place;
      case 'darija':
        return Icons.chat;
      case 'chari3':
        return Icons.speaker_notes;
      case 'motanawi3a':
        return Icons.dashboard_customize;
      case 'rwina':
        return Icons.shuffle;
      default:
        return Icons.category;
    }
  }
}