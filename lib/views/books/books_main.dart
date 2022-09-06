import 'package:flutter/material.dart';
import 'package:minerva_meditation/shared/stack_bg_img.dart';
import 'package:minerva_meditation/views/books/book_index.dart';

import 'book_card.dart';

class BooksMain extends StatelessWidget {
  const BooksMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StackBgImg(img: 'lib/assets/img/library.jpg'),
       BookIndex()
      ],
    );
  }
}
