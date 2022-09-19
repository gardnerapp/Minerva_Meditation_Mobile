import 'package:flutter/material.dart';
import 'package:minerva_meditation/views/books/books_main.dart';
import 'package:minerva_meditation/views/meditations/meditation_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Minerva',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          splashColor: Colors.orange,
          appBarTheme: const AppBarTheme(elevation: 16.0),
          cardTheme: const CardTheme(elevation: 20.0, shadowColor: Colors.deepOrange),
          sliderTheme: const SliderThemeData(
            activeTrackColor: Colors.deepOrange,
            inactiveTrackColor: Colors.grey,
            trackHeight: 3.0,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
          ),
        ),
        home: Home());
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Minerva", style: TextStyle(fontSize: 25)),
          bottom: const TabBar(
            labelStyle: TextStyle(fontSize: 20),
            tabs: [
              Tab(
                  text: "Monastery",
                  icon: Icon(
                    Icons.spa,
                    size: 35.0,
                  )),
              Tab(
                  text: "Library",
                  icon: Icon(
                    Icons.local_library,
                    size: 35.0,
                  ))
            ],
          ),
        ),
        body: const TabBarView(children: [MeditationMain(), BooksMain()]),
      ),
    );
  }
}



