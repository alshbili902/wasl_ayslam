import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasl_al_muslim/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/services/notification_service.dart';

class RemindersScreen extends ConsumerStatefulWidget {
  const RemindersScreen({super.key});

  @override
  ConsumerState<RemindersScreen> createState() => _RemindersScreenState();
}

class _RemindersScreenState extends ConsumerState<RemindersScreen> {
  bool _remindersEnabled = false;
  TimeOfDay _selectedTime = const TimeOfDay(hour: 7, minute: 0);

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _remindersEnabled = prefs.getBool('reminders_enabled') ?? false;
      final hour = prefs.getInt('reminder_hour') ?? 7;
      final min = prefs.getInt('reminder_minute') ?? 0;
      _selectedTime = TimeOfDay(hour: hour, minute: min);
    });
  }

  Future<void> _saveSettings(bool enabled, TimeOfDay time) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('reminders_enabled', enabled);
    await prefs.setInt('reminder_hour', time.hour);
    await prefs.setInt('reminder_minute', time.minute);

    if (enabled) {
      await NotificationService.scheduleDailyNotification(
        id: 1,
        title: 'أذكار الصباح',
        body: 'حان وقت أذكار الصباح لتطمئن قلبك.',
        hour: time.hour,
        minute: time.minute,
      );
    } else {
      await NotificationService.cancelNotification(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.reminders),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title: Text(l10n.enableReminders),
            value: _remindersEnabled,
            onChanged: (val) {
              setState(() => _remindersEnabled = val);
              _saveSettings(val, _selectedTime);
            },
          ),
          if (_remindersEnabled)
            ListTile(
              title: Text(l10n.reminderTime),
              trailing: Text(_selectedTime.format(context)),
              onTap: () async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: _selectedTime,
                );
                if (picked != null && picked != _selectedTime) {
                  setState(() => _selectedTime = picked);
                  _saveSettings(true, picked);
                }
              },
            ),
        ],
      ),
    );
  }
}
