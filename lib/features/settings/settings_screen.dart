import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasl_al_muslim/l10n/app_localizations.dart';
import '../../app/providers.dart';
import '../../core/services/storage_service.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = ref.watch(darkModeProvider);
    final fontSize = ref.watch(fontSizeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title: Text(l10n.darkMode),
            value: isDark,
            onChanged: (val) {
              ref.read(darkModeProvider.notifier).state = val;
              StorageService.setDarkMode(val);
            },
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.fontSize),
                Text(fontSize.toInt().toString()),
              ],
            ),
          ),
          Slider(
            value: fontSize,
            min: 16.0,
            max: 40.0,
            divisions: 12,
            label: fontSize.round().toString(),
            onChanged: (val) {
              ref.read(fontSizeProvider.notifier).state = val;
              StorageService.setFontSize(val);
            },
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
