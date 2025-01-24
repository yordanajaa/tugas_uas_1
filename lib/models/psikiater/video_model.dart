// lib/models/video_model.dart

class VideoModel {
  final String title;
  final String description;
  final String url;
  final String thumbnailUrl;

  VideoModel({
    required this.title,
    required this.description,
    required this.url,
    required this.thumbnailUrl,
  });

  // Convert a map into a VideoModel object
  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
      thumbnailUrl: map['thumbnailUrl'] ?? '',
    );
  }
}
