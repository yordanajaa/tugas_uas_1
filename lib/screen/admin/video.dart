import 'package:flutter/material.dart';
import '../../service/admin/video_service.dart';

import 'tambah_video_screen.dart';

class VideoScreen extends StatelessWidget {
  final VideoService videoService = VideoService();

  VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final videos = videoService.getVideos();

    return Scaffold(
      appBar: AppBar(
        title: const Text('LEARN'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(value: true, groupValue: true, onChanged: (value) {}),
              const Text('Video'),
              Radio(value: false, groupValue: true, onChanged: (value) {}),
              const Text('Artikel'),
            ],
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TambahVideoScreen(videoService: videoService),
                ),
              );
            },
            icon: const Icon(Icons.add),
            label: const Text('Tambah Video'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: videos.length,
              itemBuilder: (context, index) {
                final video = videos[index];
                return ListTile(
                  leading: const Icon(Icons.play_circle_fill),
                  title: Text(video.title),
                  subtitle: Text(video.description),
                  trailing: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      videoService.removeVideo(video.id);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Konseling'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Learn'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
        ],
      ),
    );
  }
}
