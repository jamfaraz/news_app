import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:news_api/models/category_model.dart';
import 'package:news_api/models/headlines_model.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  Future<HeadlinesModel> fetchHeadlines(String channelName) async {
    String url =
        'https://newsapi.org/v2/top-headlines?sources=$channelName&apiKey=149c00cc51d64abb8888417aaae46f1e';
        print(url);
    final response = await http.get(Uri.parse(url));

    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return HeadlinesModel.fromJson(body);
    }
    throw Exception('Error');
  }
   Future<CategoryModel> fetchCategories(String category) async {
    String url =
        'https://newsapi.org/v2/everything?q=$category&apiKey=149c00cc51d64abb8888417aaae46f1e';
                print(url);

    final response = await http.get(Uri.parse(url));

    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return CategoryModel.fromJson(body);
    }
    throw Exception('Error');
  }
}
