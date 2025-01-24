import '../../models/admin/video_model.dart';


class VideoService {
  final List<Video> _videos = [];

  List<Video> getVideos() {
    return _videos;
  }

  void addVideo(Video video) {
    _videos.add(video);
  }

  void removeVideo(String id) {
    _videos.removeWhere((video) => video.id == id);
  }
}
