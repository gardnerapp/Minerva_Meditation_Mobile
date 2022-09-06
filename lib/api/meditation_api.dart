import 'dart:convert';
import 'package:minerva_meditation/api/base_api.dart';
import 'package:http/http.dart' as http;
import 'package:minerva_meditation/models/meditation_model.dart';

class MeditationAPI {
  final String path = "${BaseAPI.root}/meditations";

  Future<List<dynamic>> index() async {
    final response = await http.get(Uri.parse(path), headers: BaseAPI.headers);

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return body.map((e) => Meditation.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
