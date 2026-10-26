import 'package:flutter/foundation.dart';

import 'package:bookverse/services/favorites_service.dart';

class FavoritesProvider extends ChangeNotifier {
  FavoritesProvider() {
    _service = FavoritesService();
    _init();
  }

  late final FavoritesService _service;
  Set<String> _favoriteIds = <String>{};

  Set<String> get favoriteIds => Set<String>.unmodifiable(_favoriteIds);

  bool isFavorite(String bookId) => _favoriteIds.contains(bookId);

  Future<void> _init() async {
    _favoriteIds = await _service.loadFavorites();
    notifyListeners();
  }

  Future<void> toggleFavorite(String bookId) async {
    if (_favoriteIds.contains(bookId)) {
      _favoriteIds.remove(bookId);
    } else {
      _favoriteIds.add(bookId);
    }
    notifyListeners();
    await _service.saveFavorites(_favoriteIds);
  }
}
