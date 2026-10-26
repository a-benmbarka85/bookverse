import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bookverse/data/sample_books.dart';
import 'package:bookverse/models/book.dart';
import 'package:bookverse/providers/favorites_provider.dart';
import 'package:bookverse/screens/book_detail_screen.dart';
import 'package:bookverse/widgets/book_card.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoritesProvider favorites = context.watch<FavoritesProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('BookVerse'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Badge(
              isLabelVisible: favorites.favoriteIds.isNotEmpty,
              label: Text('${favorites.favoriteIds.length}'),
              child: const Icon(Icons.favorite),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.65,
        ),
        itemCount: sampleBooks.length,
        itemBuilder: (BuildContext context, int index) {
          final Book book = sampleBooks[index];

          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => BookDetailScreen(book: book),
                ),
              );
            },
            child: BookCard(
              key: ValueKey<String>(book.id),
              book: book,
              isFavorite: favorites.isFavorite(book.id),
              onFavoriteToggle: () => favorites.toggleFavorite(book.id),
            ),
          );
        },
      ),
    );
  }
}
