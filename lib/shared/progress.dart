import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 100.0,
        child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 10.0,
            )));;
  }
}
