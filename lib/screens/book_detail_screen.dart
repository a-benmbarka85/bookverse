import 'package:flutter/material.dart';
import 'package:bookverse/styles/app_styles.dart';
import 'package:bookverse/widgets/icon_text.dart';

import '../models/book.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BookVerse")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Stack(
              children: [
                Image.network(
                  book.imageUrl,
                  height: 250,
                  width: .infinity,
                  fit: .cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 250,
                      width: .infinity,
                      color: Colors.deepOrange.shade100,
                      child: const Center(
                        child: Icon(Icons.menu_book, size: 64, color: Colors.deepOrange),
                      ),
                    );
                  },
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(gradient: AppStyles.imageShade),
                  ),
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 16,
                  child: Text(book.title, style: AppStyles.mainTitle),
                ),
                Positioned(
                  left: 16,
                  top: 16,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppStyles.tagBackground,
                      borderRadius: .circular(16),
                    ),
                    child: Text(book.category),
                  ),
                ),
              ],
            ),
            Padding(
              padding: .all(16),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    mainAxisAlignment: .spaceEvenly,
                    children: [
                      IconText(
                        icon: Icons.menu_book_outlined,
                        text: '${book.minutes} pàgines',
                      ),
                      IconText(
                        icon: Icons.list_alt_outlined,
                        text: '${book.servings} capítols',
                      ),
                    ],
                  ),
                  AppStyles.mediumSeparator,
                  Text("Capítols", style: AppStyles.sectionTitle),
                  AppStyles.smallSeparator,
                  for (final chapter in book.chapters) Text("· $chapter"),
                  AppStyles.mediumSeparator,
                  Text("Resum", style: AppStyles.sectionTitle),
                  AppStyles.smallSeparator,
                  for (var i = 0; i < book.steps.length; i++)
                    Text("${i + 1}. ${book.steps[i]}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
