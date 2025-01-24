class VideoModel {
  final String id;
  final String title;
  final String description;
  final String url;
  final String thumbnailUrl;
  final int duration; // in seconds

  VideoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.url,
    required this.thumbnailUrl,
    required this.duration,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
      'duration': duration,
    };
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      url: map['url'],
      thumbnailUrl: map['thumbnailUrl'],
      duration: map['duration'],
    );
  }
}
