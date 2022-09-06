import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minerva_meditation/models/meditation_model.dart';
import '../player.dart';


class MeditationCard extends StatelessWidget {
  final Meditation meditation;

  const MeditationCard({Key key, this.meditation, })
      : super(key: key);

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
            Icons.all_inclusive,
            size: 60.0,
            color: Colors.orange,
          ),
          title: Text(
            meditation.title,
            style: TextStyle(fontSize: 22.0),
          ),
          subtitle: Text(
            meditation.subtitle,
            style: TextStyle(fontSize: 18.0),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Player(
                          title: this.meditation.title,
                          track: this.meditation.track,
                          backGroundAsset: "lib/assets/img/school_of_athens.jpg",
                          key: key,
                        )));
          },
        ),
      ),
    );
  }
}
