import 'package:flutter/material.dart';
import 'package:minerva_meditation/api/meditation_api.dart';
import 'package:minerva_meditation/shared/infographic.dart';
import 'package:minerva_meditation/shared/progress.dart';
import 'meditation_card.dart';

class IndexMeditation extends StatelessWidget {
  const IndexMeditation({Key? key}) : super(key: key);

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
                  return const SizedBox(height: 40);
                },
                itemCount: snapShot.data.length);
          } else if (snapShot.hasError) {
            return const InfoGraphic(msg: "Error :(\n\n Please Try Later");
          }
          return const Progress();
      },
    );
  }
}
