import 'package:flutter/material.dart';
import 'package:minerva_meditation/api/book_api.dart';
import 'package:minerva_meditation/shared/infographic.dart';

import '../../shared/progress.dart';
import 'book_card.dart';

class BookIndex extends StatelessWidget {
  const BookIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookAPI bookAPI = BookAPI();

    return FutureBuilder(
        future: bookAPI.index(),
        builder: (context, snapShot) {
          if (snapShot.hasData && snapShot.data! != []) {
            return ListView.separated(
              padding: const EdgeInsets.all(25.0),
                itemBuilder: (BuildContext context, int index) {
                  return BookCard(
                    book: snapShot.data![index]
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 40);
                },
                itemCount: snapShot.data!.length);
          } else if (snapShot.hasError) {
            print(snapShot.error);
            return const InfoGraphic(msg: "Error :(\n\n Please Try Later");
          }
          return const Progress();
        });
  }
}
