import 'package:flutter/material.dart';
import '../../models/admin/article_model.dart'; // Import model dari folder admin
import '../../service/admin/article_service.dart';


class AdminScreen extends StatelessWidget {
  final ArticleService _articleService = ArticleService();

  @override
  Widget build(BuildContext context) {
    List<Article> articles = _articleService.fetchArticles();

    return Scaffold(
      appBar: AppBar(
        title: Text('EduLearn'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mulai lah hari dengan bismillah dan jangan lupa untuk bersyukur',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Nama',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              _buildCard('MOOD', 'CATAT LAH MOOD UNTUK HARI INI', Icons.mood),
              _buildCard(
                  'Catatan Harian', 'Catat lah kegiatan untuk HARI INI', Icons.note),
              SizedBox(height: 20.0),
              Text(
                'ARTIKEL',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              ...articles.map((article) => _buildArticleCard(article)).toList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Konseling'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Learn'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String subtitle, IconData icon) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        leading: Icon(icon, size: 40.0),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: ElevatedButton(onPressed: () {}, child: Text('MULAI')),
      ),
    );
  }

  Widget _buildArticleCard(Article article) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        leading: Icon(Icons.article, size: 40.0),
        title: Text(article.title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(article.description),
      ),
    );
  }
}
