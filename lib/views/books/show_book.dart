import 'package:flutter/material.dart';
import 'package:minerva_meditation/models/book_model.dart';
import 'package:minerva_meditation/shared/stack_bg_img.dart';

import 'chapter_card.dart';

class ShowBook extends StatelessWidget {
  final Book book;

  const ShowBook({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Stack(
        children: [
          StackBgImg(img: book.getBackgroundPhoto()),
          ListView(
              children: book.chapters.map((chapter) =>
                  ChapterCard(key: key, book: book, chapter: chapter)).toList()
          ),
        ],
      )
    );
  }
}
