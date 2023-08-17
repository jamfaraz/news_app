import 'package:news_api/models/category_model.dart';
import 'package:news_api/models/headlines_model.dart';
import 'package:news_api/repository/news_repository.dart';

class NewsModel {
  final rep = NewsRepository();

  Future<HeadlinesModel> fetchHeadlines(String channelName) async {
    final response = await rep.fetchHeadlines(channelName);
    return response;
  }
   Future<CategoryModel> fetchCategories(String category) async {
    final response = await rep.fetchCategories(category);
    return response;
  }
}
