import 'package:flutter/material.dart';
import '../../models/admin/article_model.dart';


import '../../service/admin/service.dart';

class AddArticleScreen extends StatelessWidget {
  final ArticleService articleService;

  AddArticleScreen({required this.articleService, super.key});

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Artikel')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(
                hintText: 'DD/MM/YYYY',
                prefixIcon: Icon(Icons.calendar_today),
              ),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: const Center(
                  child: Icon(Icons.add),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(hintText: 'Deskripsi Artikel'),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                final newArticle = Article(
                  id: DateTime.now().toString(),
                  date: _dateController.text,
                  description: _descriptionController.text, title: '',
                );
                articleService.addArticle(newArticle);
                Navigator.pop(context);
              },
              child: const Text('Tambah'),
            ),
          ],
        ),
      ),
    );
  }
}