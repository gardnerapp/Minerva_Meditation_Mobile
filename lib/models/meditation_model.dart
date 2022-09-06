class Meditation {
  final String title;
  final String subtitle;
  final String track;

  Meditation({required this.title, required this.subtitle, required this.track});

  factory Meditation.fromJson(Map<String, dynamic> body) {
    return Meditation(
        title: body['title'],
        subtitle: body['subtitle'],
        track: body['track']);
  }
}
