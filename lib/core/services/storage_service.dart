import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/athkar.dart';
import '../models/category.dart';

class StorageService {
  static late SharedPreferences _prefs;
  
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Favorites
  static Future<void> toggleFavorite(String athkarId) async {
    List<String> favs = _prefs.getStringList('favorites') ?? [];
    if (favs.contains(athkarId)) {
      favs.remove(athkarId);
    } else {
      favs.add(athkarId);
    }
    await _prefs.setStringList('favorites', favs);
  }

  static List<String> getFavorites() {
    return _prefs.getStringList('favorites') ?? [];
  }

  // Tasbeeh
  static int getTasbeehCount() {
    return _prefs.getInt('tasbeeh_count') ?? 0;
  }

  static Future<void> setTasbeehCount(int count) async {
    await _prefs.setInt('tasbeeh_count', count);
  }

  // Settings
  static double getFontSize() {
    return _prefs.getDouble('font_size') ?? 24.0;
  }

  static Future<void> setFontSize(double size) async {
    await _prefs.setDouble('font_size', size);
  }

  static bool isDarkMode() {
    return _prefs.getBool('dark_mode') ?? false;
  }

  static Future<void> setDarkMode(bool isDark) async {
    await _prefs.setBool('dark_mode', isDark);
  }

  // Data Source
  static Future<List<Category>> loadCategories() async {
    final String response = await rootBundle.loadString('assets/data/categories.json');
    final data = await json.decode(response) as List<dynamic>;
    return data.map((e) => Category.fromJson(e)).toList();
  }

  static Future<List<Athkar>> loadAthkar() async {
    final String response = await rootBundle.loadString('assets/data/athkar.json');
    final data = await json.decode(response) as List<dynamic>;
    return data.map((e) => Athkar.fromJson(e)).toList();
  }
}
