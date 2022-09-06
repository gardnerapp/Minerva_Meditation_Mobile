import 'package:flutter/material.dart';

class InfoGraphic extends StatelessWidget {
  final String msg;
  const InfoGraphic({Key? key, required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      msg,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 75.0,
        color: Colors.white,
      ),
    ));
  }
}
