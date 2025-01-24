import '../models/video_model.dart';

class VideoService {
  static List<VideoModel> fetchVideos() {
    return [
      VideoModel(
        id: '1',
        title: 'Video 1',
        description: 'Deskripsi singkat video 1',
        url: 'https://www.example.com/sample_video1.mp4',
        thumbnailUrl: 'https://via.placeholder.com/150',
        duration: 300,
      ),
      VideoModel(
        id: '2',
        title: 'Video 2',
        description: 'Deskripsi singkat video 2',
        url: 'https://www.example.com/sample_video2.mp4',
        thumbnailUrl: 'https://via.placeholder.com/150',
        duration: 450,
      ),
      VideoModel(
        id: '3',
        title: 'Video 3',
        description: 'Deskripsi singkat video 3',
        url: 'https://www.example.com/sample_video3.mp4',
        thumbnailUrl: 'https://via.placeholder.com/150',
        duration: 600,
      ),
    ];
  }
}
