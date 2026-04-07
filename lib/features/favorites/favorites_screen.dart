import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasl_al_muslim/l10n/app_localizations.dart';
import '../../app/providers.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);
    final allAthkarAsync = ref.watch(allAthkarProvider);
    final l10n = AppLocalizations.of(context)!;
    final fontSize = ref.watch(fontSizeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.favorites),
      ),
      body: allAthkarAsync.when(
        data: (athkarList) {
          final favAthkarList = athkarList.where((a) => favorites.contains(a.id)).toList();
          
          if (favAthkarList.isEmpty) return Center(child: Text(l10n.noResults));

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: favAthkarList.length,
            itemBuilder: (context, index) {
              final athkar = favAthkarList[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text(athkar.title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue))),
                          IconButton(
                            icon: const Icon(Icons.favorite, color: Colors.red),
                            onPressed: () => ref.read(favoritesProvider.notifier).toggleFavorite(athkar.id),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(athkar.arabicText, style: TextStyle(fontSize: fontSize)),
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('خطأ: $err')),
      ),
    );
  }
}
