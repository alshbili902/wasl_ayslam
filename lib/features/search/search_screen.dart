import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/models/athkar.dart';
import '../../app/providers.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final allAthkarAsync = ref.watch(allAthkarProvider);
    final l10n = AppLocalizations.of(context)!;
    final fontSize = ref.watch(fontSizeProvider);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: l10n.searchAthkar,
            border: InputBorder.none,
            hintStyle: const TextStyle(color: Colors.grey),
          ),
          onChanged: (val) => setState(() => _query = val),
        ),
      ),
      body: allAthkarAsync.when(
        data: (athkarList) {
          final results = _query.isEmpty
              ? <Athkar>[]
              : athkarList.where((a) => a.arabicText.contains(_query) || a.title.contains(_query)).toList();

          if (_query.isNotEmpty && results.isEmpty) {
            return Center(child: Text(l10n.noResults));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: results.length,
            itemBuilder: (context, index) {
              final athkar = results[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(athkar.title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                      const SizedBox(height: 8),
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
