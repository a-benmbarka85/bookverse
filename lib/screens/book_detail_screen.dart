import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bookverse/models/book.dart';
import 'package:bookverse/providers/favorites_provider.dart';
import 'package:bookverse/styles/app_styles.dart';
import 'package:bookverse/widgets/icon_text.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    final FavoritesProvider favorites = context.watch<FavoritesProvider>();
    final bool isFavorite = favorites.isFavorite(book.id);
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          book.title,
          style: theme.textTheme.titleLarge,
        ),
        actions: <Widget>[
          Semantics(
            button: true,
            label: isFavorite
                ? 'Eliminar de preferits'
                : 'Afegir a preferits',
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : null,
              ),
              onPressed: () {
                final bool wasFavorite = isFavorite;
                favorites.toggleFavorite(book.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      wasFavorite
                          ? 'Eliminat de preferits'
                          : 'Afegit a preferits',
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: book.id,
              child: Image.network(
                book.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                cacheWidth: 800,
                cacheHeight: 500,
                loadingBuilder: (
                  BuildContext context,
                  Widget child,
                  ImageChunkEvent? loadingProgress,
                ) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Container(
                    height: 250,
                    width: double.infinity,
                    color: colorScheme.primaryContainer,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
                errorBuilder: (
                  BuildContext context,
                  Object error,
                  StackTrace? stackTrace,
                ) {
                  return Container(
                    height: 250,
                    width: double.infinity,
                    color: colorScheme.primaryContainer,
                    child: Center(
                      child: Icon(
                        Icons.menu_book,
                        size: 64,
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    book.title,
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    book.category,
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconText(
                        icon: Icons.menu_book_outlined,
                        text: '${book.pages} pàgines',
                      ),
                      IconText(
                        icon: Icons.list_alt_outlined,
                        text: '${book.chapters} capítols',
                      ),
                    ],
                  ),
                  AppStyles.mediumSeparator,
                  Text(
                    'Capítols',
                    style: theme.textTheme.titleMedium,
                  ),
                  AppStyles.smallSeparator,
                  for (final String chapter in book.chapterTitles)
                    Text('· $chapter'),
                  AppStyles.mediumSeparator,
                  Text(
                    'Resum',
                    style: theme.textTheme.titleMedium,
                  ),
                  AppStyles.smallSeparator,
                  for (var i = 0; i < book.summary.length; i++)
                    Text('${i + 1}. ${book.summary[i]}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
