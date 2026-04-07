import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/models/athkar.dart';
import '../core/models/category.dart';
import '../core/services/storage_service.dart';

// Settings Providers
final darkModeProvider = StateProvider<bool>((ref) => StorageService.isDarkMode());
final fontSizeProvider = StateProvider<double>((ref) => StorageService.getFontSize());

// Data Providers
final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  return await StorageService.loadCategories();
});

final allAthkarProvider = FutureProvider<List<Athkar>>((ref) async {
  return await StorageService.loadAthkar();
});

final athkarByCategoryProvider = Provider.family<AsyncValue<List<Athkar>>, String>((ref, categoryId) {
  final allAthkar = ref.watch(allAthkarProvider);
  return allAthkar.whenData((athkarList) => athkarList.where((a) => a.categoryId == categoryId).toList());
});

// Favorites Provider
class FavoritesNotifier extends StateNotifier<List<String>> {
  FavoritesNotifier() : super(StorageService.getFavorites());

  void toggleFavorite(String id) async {
    await StorageService.toggleFavorite(id);
    state = StorageService.getFavorites();
  }
}

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, List<String>>((ref) {
  return FavoritesNotifier();
});

// Tasbeeh Provider
class TasbeehNotifier extends StateNotifier<int> {
  TasbeehNotifier() : super(StorageService.getTasbeehCount());

  void increment() async {
    state++;
    await StorageService.setTasbeehCount(state);
  }

  void reset() async {
    state = 0;
    await StorageService.setTasbeehCount(0);
  }
}

final tasbeehProvider = StateNotifierProvider<TasbeehNotifier, int>((ref) {
  return TasbeehNotifier();
});
