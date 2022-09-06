import 'package:flutter/material.dart';
import 'package:minerva_meditation/models/book_model.dart';
import 'package:minerva_meditation/models/chapter_model.dart';
import 'package:minerva_meditation/views/player.dart';

class ChapterCard extends StatelessWidget {
  final Book book;
  final Chapter chapter;
  const ChapterCard({Key? key, required this.chapter, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      padding: const EdgeInsets.all(1),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: ListTile(
          leading: const Icon(
            Icons.book,
            size: 40.0,
            color: Colors.orange,
          ),
          title: Text(
            chapter.title,
            style: const TextStyle(fontSize: 22.0),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Player(
                          title: chapter.title,
                          track: chapter.track,
                          backGroundAsset: book.getBackgroundPhoto(),
                        )));
          },
        ),
      ),
    );
  }
}
