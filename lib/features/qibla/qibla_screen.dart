import 'package:flutter/material.dart';

class QiblaScreen extends StatelessWidget {
  const QiblaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('القبلة')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.explore, size: 100, color: Colors.grey),
            SizedBox(height: 16),
            Text('سيتم إضافة بوصلة القبلة قريباً', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
