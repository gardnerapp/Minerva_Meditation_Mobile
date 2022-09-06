import 'package:flutter/material.dart';
import 'package:minerva_meditation/shared/stack_bg_img.dart';
import 'index_meditation.dart';


class MeditationMain extends StatelessWidget {
  const MeditationMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StackBgImg(img: 'lib/assets/img/monastary.jpg'),
        Center(
            child: IndexMeditation())
      ],
    );
  }




}
