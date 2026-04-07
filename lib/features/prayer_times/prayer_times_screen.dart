import 'package:flutter/material.dart';
import 'package:wasl_al_muslim/l10n/app_localizations.dart';

class PrayerTimesScreen extends StatelessWidget {
  const PrayerTimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(title: Text(l10n.prayerTimes)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.access_time, size: 100, color: Colors.grey),
            const SizedBox(height: 16),
            Text('سيتم إضافة مواقيت الصلاة قريباً', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

