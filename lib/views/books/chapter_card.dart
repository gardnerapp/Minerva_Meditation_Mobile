import 'package:flutter/material.dart';
import 'package:minerva_meditation/models/book_model.dart';
import 'package:minerva_meditation/models/chapter_model.dart';
import 'package:minerva_meditation/views/player.dart';

class ChapterCard extends StatelessWidget {
  final Book book;
  final Chapter chapter;
  const ChapterCard({Key key, this.chapter, this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      padding: EdgeInsets.all(1),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: ListTile(
          leading: Icon(
            Icons.book,
            size: 40.0,
            color: Colors.orange,
          ),
          title: Text(
            this.chapter.title,
            style: TextStyle(fontSize: 22.0),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Player(
                          title: this.chapter.title,
                          track: this.chapter.track,
                          backGroundAsset: this.book.getBackgroundPhoto(),
                          key: key,
                        )));
          },
        ),
      ),
    );
  }
}
