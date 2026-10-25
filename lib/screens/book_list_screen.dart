import 'package:flutter/material.dart';
import 'package:bookverse/data/sample_books.dart';
import 'package:bookverse/widgets/book_card.dart';
import 'package:bookverse/screens/book_detail_screen.dart';

class BookListScreen extends StatefulWidget {
  const BookListScreen({super.key});

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  final Set<int> _favorites = <int>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BookVerse"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Badge(
              isLabelVisible: _favorites.isNotEmpty,
              label: Text('${_favorites.length}'),
              child: const Icon(Icons.favorite),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
        ),
        itemCount: sampleBooks.length,
        itemBuilder: (context, index) {
          final book = sampleBooks[index];

          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => BookDetailScreen(book: book),
                ),
              );
            },
            child: BookCard(
              book: book,
              isFavorite: _favorites.contains(index),
              onFavoriteToggle: () {
                setState(() {
                  if (_favorites.contains(index)) {
                    _favorites.remove(index);
                  } else {
                    _favorites.add(index);
                  }
                });
              },
            ),
          );
        },
      ),
    );
  }
}