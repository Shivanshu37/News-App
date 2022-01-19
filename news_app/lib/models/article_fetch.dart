import 'dart:convert';
import 'package:news_app/models/category_model.dart';

import 'news_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<NewsModel> news = [];
  List<NewsModel> categoryNews = [];
  Future<void> fetchNews() async {
    var aPIkey = "apiKey=a746130a6e394fedaaa9e50562a52c39";
    var prefixAPIUrl = "https://newsapi.org/v2/top-headlines?country=in";
    var url = "$prefixAPIUrl&$aPIkey";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null &&
            element['content'] != null &&
            element['title'] != null &&
            element['description'] != null) {
          NewsModel articleModel = NewsModel(
              content: element['content'],
              title: element['title'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              desc: element['description']);
          news.add(articleModel);
        }
      });
    }
  }

  Future<void> fetchCategoryNews(String title) async {
    var url =
        "https://newsapi.org/v2/top-headlines?country=in&category=${title.toLowerCase()}&apiKey=a746130a6e394fedaaa9e50562a52c39";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null &&
            element['content'] != null &&
            element['title'] != null &&
            element['description'] != null) {
          NewsModel categoryArticle = NewsModel(
              content: element['content'],
              title: element['title'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              desc: element['description']);
          categoryNews.add(categoryArticle);
        }
      });
    }
  }
}
