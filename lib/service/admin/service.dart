import '../../models/admin/article_model.dart';


class ArticleService {
  final List<Article> _articles = [];

  List<Article> get articles => _articles;

  void addArticle(Article article) {
    _articles.add(article);
  }

  void deleteArticle(String id) {
    _articles.removeWhere((article) => article.id == id);
  }

  getArticles() {}
}