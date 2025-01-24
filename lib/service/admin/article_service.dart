import '../../models/admin/article_model.dart';

class ArticleService {
  List<Article> fetchArticles() {
    return [
      Article(
        title: 'Title 1',
        description: 'Supporting or descriptive text for the card goes here.', id: '', date: '',
      ),
      Article(
        title: 'Title 2',
        description: 'Another supporting or descriptive text for the card.', id: '', date: '',
      ),
    ];
  }
}
