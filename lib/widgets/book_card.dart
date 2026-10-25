import 'package:flutter/material.dart';
import 'package:bookverse/models/book.dart';
import 'package:bookverse/styles/app_styles.dart';
import 'package:bookverse/widgets/icon_text.dart';

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
    return Card(
      clipBehavior: .antiAlias,
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              book.imageUrl,
              width: .infinity,
              fit: .cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.deepOrange.shade100,
                  child: const Center(
                    child: Icon(Icons.menu_book, size: 48, color: Colors.deepOrange),
                  ),
                );
              },
            ),
          ),
          Column(
            crossAxisAlignment: .center,
            children: [
              Text(
                book.title,
                maxLines: 1,
                overflow: .ellipsis,
                style: AppStyles.cardTitle,
              ),
              Row(
                mainAxisAlignment: .spaceBetween,
                mainAxisSize: .min,
                children: [
                  IconText(
                    icon: Icons.timer_outlined,
                    text: '${book.minutes} min.',
                    iconSize: 16,
                    textStyle: const TextStyle(fontSize: 12),
                  ),
                  const SizedBox(width: 2),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    iconSize: 16,
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: onFavoriteToggle,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}