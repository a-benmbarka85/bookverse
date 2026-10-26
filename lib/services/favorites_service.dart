import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {
  static const String _storageKey = 'favorite_book_ids';

  Future<Set<String>> loadFavorites() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final List<String>? stored = preferences.getStringList(_storageKey);
    if (stored == null) {
      return <String>{};
    }
    return stored.toSet();
  }

  Future<void> saveFavorites(Set<String> favorites) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList(_storageKey, favorites.toList());
  }
}
