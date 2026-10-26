import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bookverse/data/sample_books.dart';
import 'package:bookverse/models/book.dart';
import 'package:bookverse/providers/favorites_provider.dart';
import 'package:bookverse/screens/book_detail_screen.dart';
import 'package:bookverse/widgets/book_card.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  String _searchQuery = '';
  String? _selectedCategory;
  bool _sortByTitle = false;

  List<Book> _filteredBooks() {
    Iterable<Book> result = sampleBooks;

    final String query = _searchQuery.trim().toLowerCase();
    if (query.isNotEmpty) {
      result = result.where(
        (Book book) => book.title.toLowerCase().contains(query),
      );
    }

    if (_selectedCategory != null) {
      result = result.where((Book book) => book.category == _selectedCategory);
    }

    final List<Book> filtered = result.toList(growable: false);

    if (_sortByTitle) {
      filtered.sort(
        (Book a, Book b) =>
            a.title.toLowerCase().compareTo(b.title.toLowerCase()),
      );
    }

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    final FavoritesProvider favorites = context.watch<FavoritesProvider>();
    final List<Book> books = _filteredBooks();

    final List<String> categories =
        sampleBooks
            .map((Book book) => book.category)
            .toSet()
            .toList(growable: false)
          ..sort();

    return Scaffold(
      appBar: AppBar(
        title: const Text('BookVerse'),
        actions: <Widget>[
          IconButton(
            icon: Icon(_sortByTitle ? Icons.sort_by_alpha : Icons.sort),
            tooltip: 'Ordenar per títol',
            onPressed: () {
              setState(() {
                _sortByTitle = !_sortByTitle;
              });
            },
          ),
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
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SearchBar(
              hintText: 'Buscar llibres...',
              leading: const Icon(Icons.search),
              onChanged: (String value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FilterChip(
                    label: const Text('Totes'),
                    selected: _selectedCategory == null,
                    onSelected: (_) {
                      setState(() {
                        _selectedCategory = null;
                      });
                    },
                  ),
                ),
                for (final String category in categories)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FilterChip(
                      label: Text(category),
                      selected: _selectedCategory == category,
                      onSelected: (_) {
                        setState(() {
                          _selectedCategory = category;
                        });
                      },
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: books.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.search_off,
                          size: 72,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No s\'han trobat llibres que coincideixin amb la cerca',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                              ),
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(16.0),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          crossAxisSpacing: 16.0,
                          mainAxisSpacing: 16.0,
                          childAspectRatio: 0.65,
                        ),
                    itemCount: books.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Book book = books[index];

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
                          onFavoriteToggle: () =>
                              favorites.toggleFavorite(book.id),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
