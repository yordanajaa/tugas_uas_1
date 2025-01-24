import 'package:flutter/material.dart';
import 'package:tugas_uas_1/models/psikiater/video_model.dart';
import 'package:tugas_uas_1/screen/psikiater/artikel_p.dart';
import 'package:tugas_uas_1/service/video_service.dart';
import 'package:video_player/video_player.dart';
class LearnPsikiaterScreen extends StatefulWidget {
  const LearnPsikiaterScreen({key}) : super(key: key);

  @override
  _LearnScreenState createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnPsikiaterScreen> {
  late List<VideoModel> videos;
  String _selectedChip = 'Video';

  @override
  void initState() {
    super.initState();
    // Fetch videos from service
    videos = VideoService.fetchVideos().cast<VideoModel>();
  }

  void _handleChipSelection(String selection) {
    setState(() {
      _selectedChip = selection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  ActionChip(
                    label: Text(
                      'Video',
                      style: TextStyle(
                        color: _selectedChip == 'Video' ? Colors.white : Colors.black,
                      ),
                    ),
                    backgroundColor:
                        _selectedChip == 'Video' ? Colors.blue : Colors.grey[300],
                    onPressed: () => _handleChipSelection('Video'),
                  ),
                  const SizedBox(width: 10),
                  ActionChip(
                    label: Text(
                      'Artikel',
                      style: TextStyle(
                        color: _selectedChip == 'Artikel' ? Colors.white : Colors.black,
                      ),
                    ),
                    backgroundColor:
                        _selectedChip == 'Artikel' ? Colors.blue : Colors.grey[300],
                    onPressed: () => _handleChipSelection('Artikel'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _selectedChip == 'Video' ? _buildVideoList() : ArtikelScreen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoList() {
    return ListView.builder(
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final video = videos[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VideoPlayerScreen(url: video.url),
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
                      video.thumbnailUrl,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    video.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    video.description,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
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
                          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
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
