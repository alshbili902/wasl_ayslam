import 'package:flutter/material.dart';

class PrayerTimesScreen extends StatelessWidget {
  const PrayerTimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مواقيت الصلاة')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.access_time, size: 100, color: Colors.grey),
            SizedBox(height: 16),
            Text('سيتم إضافة مواقيت الصلاة قريباً', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
