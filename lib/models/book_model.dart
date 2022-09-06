import 'chapter_model.dart';

class Book {
  final int id;
  final String title;
  final String author;
  final List<dynamic> chapters;

  Book({required this.title, required this.author, required this.chapters, required this.id});

  factory Book.fromJson(Map<String, dynamic> json) {

    var chapters = json['chapters'].map((e) => Chapter.fromJson(e)).toList();
    return Book(
        title: json['title'],
        id: json['id'],
        author: json['author'],
        chapters: chapters);
  }

  String getCoverPhoto() {
    switch (this.title) {
      case "The Art Of War":
        return "lib/assets/img/art_of_war.jpg";
      default:
        return "lib/assets/img/default_book.jpg";
    }
  }

  String getBackgroundPhoto() {
    switch (this.title) {
      case "The Art Of War":
        return "lib/assets/img/sun_tzu.jpg";
      default:
        return "lib/assets/img/school_of_athens.jpg";
    }
  }
}
