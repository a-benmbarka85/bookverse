import 'package:flutter/material.dart';

import 'package:bookverse/models/book.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.book,
    this.isFavorite = false,
    this.onFavoriteToggle,
  });

  final Book book;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final CardThemeData cardTheme = theme.cardTheme;

    return Card(
      elevation: cardTheme.elevation ?? 0,
      color: cardTheme.color,
      shape: cardTheme.shape ??
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: book.id,
              child: Image.network(
                book.imageUrl,
                fit: BoxFit.cover,
                cacheWidth: 300,
                loadingBuilder: (
                  BuildContext context,
                  Widget child,
                  ImageChunkEvent? loadingProgress,
                ) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Container(
                    color: theme.colorScheme.surfaceContainerHighest,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                        color: theme.colorScheme.primary,
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
                    color: theme.colorScheme.surfaceContainerHighest,
                    child: Center(
                      child: Icon(
                        Icons.broken_image_outlined,
                        size: 48,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  book.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  book.category,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.menu_book,
                            size: 16,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              '${book.pages} pàgines',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Semantics(
                      button: true,
                      label: isFavorite
                          ? 'Eliminar de preferits'
                          : 'Afegir a preferits',
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 48,
                          minHeight: 48,
                        ),
                        iconSize: 24,
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite
                              ? Colors.red
                              : theme.colorScheme.onSurfaceVariant,
                        ),
                        onPressed: onFavoriteToggle == null
                            ? null
                            : () {
                                final bool wasFavorite = isFavorite;
                                onFavoriteToggle!();
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
