import 'package:flutter/foundation.dart';

@immutable
class Book {
  const Book({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.category,
    required this.pages,
    required this.chapters,
    required this.chapterTitles,
    required this.summary,
  });

  final String id;
  final String title;
  final String imageUrl;
  final String category;
  final int pages;
  final int chapters;
  final List<String> chapterTitles;
  final List<String> summary;

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      category: json['category'] as String,
      pages: json['pages'] as int,
      chapters: json['chapters'] as int,
      chapterTitles: (json['chapterTitles'] as List<dynamic>)
          .map((item) => item as String)
          .toList(growable: false),
      summary: (json['summary'] as List<dynamic>)
          .map((item) => item as String)
          .toList(growable: false),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'category': category,
      'pages': pages,
      'chapters': chapters,
      'chapterTitles': chapterTitles,
      'summary': summary,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is Book && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
