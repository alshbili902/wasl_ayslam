import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../app/providers.dart';

class AthkarScreen extends ConsumerStatefulWidget {
  final String categoryId;
  final String categoryName;

  const AthkarScreen({super.key, required this.categoryId, required this.categoryName});

  @override
  ConsumerState<AthkarScreen> createState() => _AthkarScreenState();
}

class _AthkarScreenState extends ConsumerState<AthkarScreen> {
  final Map<String, int> _progress = {};

  @override
  Widget build(BuildContext context) {
    final athkarAsync = ref.watch(athkarByCategoryProvider(widget.categoryId));
    final fontSize = ref.watch(fontSizeProvider);
    final favorites = ref.watch(favoritesProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: athkarAsync.when(
        data: (athkarList) {
          if (athkarList.isEmpty) return Center(child: Text(l10n.noResults));
          
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: athkarList.length,
            itemBuilder: (context, index) {
              final athkar = athkarList[index];
              final isFav = favorites.contains(athkar.id);
              final currentCount = _progress[athkar.id] ?? 0;
              final isCompleted = currentCount >= athkar.repetitionCount;

              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              athkar.title,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                            ),
                          ),
                          IconButton(
                            icon: Icon(isFav ? Icons.favorite : Icons.favorite_border, color: Colors.red),
                            onPressed: () => ref.read(favoritesProvider.notifier).toggleFavorite(athkar.id),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        athkar.arabicText,
                        style: TextStyle(fontSize: fontSize, height: 1.8),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '${l10n.source}: ${athkar.source}',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const Divider(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.copy),
                                onPressed: () {
                                  Clipboard.setData(ClipboardData(text: athkar.arabicText));
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.copied)));
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.share),
                                onPressed: () => Share.share(athkar.arabicText),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              if (!isCompleted) {
                                setState(() {
                                  _progress[athkar.id] = currentCount + 1;
                                });
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              decoration: BoxDecoration(
                                color: isCompleted ? Colors.green : Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Text(
                                isCompleted ? l10n.completed : '$currentCount / ${athkar.repetitionCount}',
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
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
