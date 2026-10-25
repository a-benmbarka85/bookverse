import 'package:flutter/material.dart';
import 'package:bookverse/screens/book_list_screen.dart';
import 'package:bookverse/styles/app_styles.dart';

void main() {
  runApp(const BookVerseApp());
}

class BookVerseApp extends StatelessWidget {
  const BookVerseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppStyles.primary,
          foregroundColor: AppStyles.onPrimary,
        ),
      ),
      home: BookListScreen(),
    );
  }
}