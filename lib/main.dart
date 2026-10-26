import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bookverse/providers/favorites_provider.dart';
import 'package:bookverse/screens/catalog_screen.dart';
import 'package:bookverse/theme/app_theme.dart';

void main() {
  runApp(const BookVerseApp());
}

class BookVerseApp extends StatelessWidget {
  const BookVerseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FavoritesProvider(),
      child: MaterialApp(
        title: 'BookVerse',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const CatalogScreen(),
      ),
    );
  }
}
