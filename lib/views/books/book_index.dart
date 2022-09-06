import 'package:flutter/material.dart';
import 'package:minerva_meditation/api/book_api.dart';
import 'package:minerva_meditation/shared/infographic.dart';

import 'book_card.dart';

class BookIndex extends StatelessWidget {
  const BookIndex({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookAPI bookAPI = BookAPI();

    return FutureBuilder(
        future: bookAPI.index(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return ListView.separated(
              padding: EdgeInsets.all(25.0),
                itemBuilder: (BuildContext context, int index) {
                  return BookCard(
                    book: snapShot.data[index], key: null,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 40);
                },
                itemCount: snapShot.data.length);
          } else if (snapShot.hasError) {
            print(snapShot.error.toString());
            print(snapShot.error);
            return Container(
                child: InfoGraphic(msg: "Error :(\n\n Please Try Later", key: null,));
          }
          return Container(
              height: 100.0,
              child: Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 10.0,
              )));
        });
  }
}
