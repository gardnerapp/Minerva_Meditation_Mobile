class Chapter {
  final String title;
  final String track;
  final int id;

  Chapter({required this.title, required this.track, required this.id});

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      title: json['title'],
      track: json['track'],
      id: json['id'],
    );
  }
}
