import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minerva_meditation/models/meditation_model.dart';
import '../player.dart';


class MeditationCard extends StatelessWidget {
  final Meditation meditation;

  const MeditationCard({Key? key, required this.meditation, })
      : super(key: key);

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
            Icons.all_inclusive,
            size: 60.0,
            color: Colors.orange,
          ),
          title: Text(
            meditation.title,
            style: const TextStyle(fontSize: 22.0),
          ),
          subtitle: Text(
            meditation.subtitle,
            style: const TextStyle(fontSize: 18.0),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Player(
                          title: meditation.title,
                          track: meditation.track,
                          backGroundAsset: "lib/assets/img/school_of_athens.jpg",
                        )));
          },
        ),
      ),
    );
  }
}
