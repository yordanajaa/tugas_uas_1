import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoListScreen extends StatelessWidget {
  final List<Map<String, String>> videos = [
    {
      'title': 'Video 1',
      'url': 'https://www.example.com/sample_video1.mp4', // Ganti dengan URL video Anda
      'thumbnail': 'https://via.placeholder.com/150', // URL gambar placeholder
      'description': 'Deskripsi singkat video 1',
    },
    {
      'title': 'Video 2',
      'url': 'https://www.example.com/sample_video2.mp4', // Ganti dengan URL video Anda
      'thumbnail': 'https://via.placeholder.com/150', // URL gambar placeholder
      'description': 'Deskripsi singkat video 2',
    },
    {
      'title': 'Video 3',
      'url': 'https://www.example.com/sample_video3.mp4', // Ganti dengan URL video Anda
      'thumbnail': 'https://via.placeholder.com/150', // URL gambar placeholder
      'description': 'Deskripsi singkat video 3',
    },
  ];

   VideoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Video'),
        backgroundColor: const Color(0xFF7165D6),
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerScreen(url: video['url'] ?? ''),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        video['thumbnail'] ?? '',
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      video['title'] ?? 'Unknown Video',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      video['description'] ?? '',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String url;

  const VideoPlayerScreen({key, required this.url}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      })
      ..setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
        backgroundColor: const Color(0xFF7165D6),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),
                        onPressed: () {
                          setState(() {
                            if (_controller.value.isPlaying) {
                              _controller.pause();
                            } else {
                              _controller.play();
                            }
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.replay),
                        onPressed: () {
                          _controller.seekTo(Duration.zero);
                          _controller.play();
                        },
                      ),
                    ],
                  ),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
