import 'package:flutter/material.dart';
import 'package:minerva_meditation/api/meditation_api.dart';
import 'package:minerva_meditation/shared/infographic.dart';
import 'meditation_card.dart';

class IndexMeditation extends StatelessWidget {
  const IndexMeditation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MeditationAPI meditationAPI = MeditationAPI();
    return FutureBuilder(
        future: meditationAPI.index(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return ListView.separated(
                itemBuilder: (BuildContext context, int indx) {
                  return MeditationCard(
                    meditation: snapShot.data[indx],
                  );
                },
                separatorBuilder: (BuildContext context, int indx) {
                  return SizedBox(height: 40);
                },
                itemCount: snapShot.data.length);
          } else if (snapShot.hasError) {
            return Container(
              child:  InfoGraphic(msg: "Error :(\n\n Please Try Later"));
          }
          return Container(
            height: 100.0,
            child: Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.white,
                  strokeWidth: 10.0,
            )));
      },
    );
  }
}
