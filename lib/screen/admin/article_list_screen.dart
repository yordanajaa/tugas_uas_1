import 'package:flutter/material.dart';
import '../../service/admin/service.dart';
import '../../models/admin/article_model.dart';
import 'add_article_screen.dart';
import 'package:flutter/material.dart';

class Article {
  final String id;
  final String date;
  final String description;

  Article({
    required this.id,
    required this.date,
    required this.description,
  });
}

class ArticleService {
  Future<List<Article>> getArticles() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Article(id: '1', date: '2024-01-23', description: 'Artikel pertama'),
      Article(id: '2', date: '2024-01-22', description: 'Artikel kedua'),
    ];
  }

  Future<void> deleteArticle(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Artikel dengan ID $id telah dihapus.');
  }
}

class ArticleListScreen extends StatelessWidget {
  final ArticleService articleService = ArticleService();

  ArticleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LEARN'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Article>>(
              future: articleService.getArticles(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('Tidak ada artikel.'));
                } else {
                  final articles = snapshot.data!;
                  return ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      final article = articles[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        child: ListTile(
                          title: Text(article.date),
                          subtitle: Text(article.description),
                          trailing: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              articleService.deleteArticle(article.id).then((_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Artikel berhasil dihapus.')),
                                );
                              }).catchError((error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Gagal menghapus artikel: $error')),
                                );
                              });
                            },
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

