import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasl_al_muslim/l10n/app_localizations.dart';
import '../../app/providers.dart';

class TasbeehScreen extends ConsumerWidget {
  const TasbeehScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(tasbeehProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.tasbeeh),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(tasbeehProvider.notifier).reset(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'سبحان الله، والحمد لله، ولا إله إلا الله، والله أكبر',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            GestureDetector(
              onTap: () {
                HapticFeedback.lightImpact();
                ref.read(tasbeehProvider.notifier).increment();
              },
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.4),
                      spreadRadius: 10,
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    '$count',
                    style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 48),
            Text('اضغط على الدائرة للتسبيح', style: TextStyle(color: Colors.grey.shade600)),
          ],
        ),
      ),
    );
  }
}
