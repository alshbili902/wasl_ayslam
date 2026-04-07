import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.about),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.mosque, size: 80, color: Colors.blue),
            const SizedBox(height: 16),
            const Text(
              'وصل المسلم',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('الإصدار 1.0.0', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 32),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                'تطبيق وصل المسلم هو رفيقك اليومي للأذكار والسبحة، مصمم بعناية ليقدم لك تجربة مريحة وسهلة الاستخدام خالية من الإعلانات المزعجة.',
                textAlign: TextAlign.center,
                style: TextStyle(height: 1.5),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: const Icon(Icons.star),
              label: const Text('قيم التطبيق'),
              onPressed: () async {
                final url = Uri.parse('https://play.google.com/store');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
