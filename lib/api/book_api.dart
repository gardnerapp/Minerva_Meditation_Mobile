import 'package:minerva_meditation/models/book_model.dart';

// switch s3 buckets and/or create CDN to improve load times
// push to git and redploy

import 'base_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookAPI{
  final String path = "${BaseAPI.root}/books";

  Future<List<dynamic>> index() async {
    final response = await http.get(Uri.parse(path), headers: BaseAPI.headers);

    if (response.statusCode == 200){
      var body = jsonDecode(response.body);
      return body.map((e) => Book.fromJson(e)).toList();
    }else{
      return [];
    }
  }

}