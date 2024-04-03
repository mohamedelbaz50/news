import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getNewsByCategory(
      {required String category}) async {
    try {
      var response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=3c88955c487e4d9db668f011dd85e737&category=$category');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articlesList = [];
      for (var article in articles) {
        articlesList.add(ArticleModel.fromJson(article));
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }

  Future<List<ArticleModel>> searchInNews({required String query}) async {
    try {
      var response = await dio.get(
          'https://newsapi.org/v2/everything?q=$query&apiKey=b7c61fc6e86d4a82a8a5caa4871a7f66');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> searchResult = [];
      for (var article in articles) {
        searchResult.add(ArticleModel.fromJson(article));
      }
      return searchResult;
    } catch (e) {
      return [];
    }
  }
}
