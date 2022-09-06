import 'package:flutter/material.dart';

// Reusable Background Img widget; placed as the first child within a Stack
class StackBgImg extends StatelessWidget {
  final String img;

  const StackBgImg({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          height: MediaQuery.of(context).size.height * .8,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(img),
            fit: BoxFit.cover,
          )),
        ))
      ],
    );
  }
}
