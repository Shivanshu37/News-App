import 'package:flutter/material.dart';
import '../components/blog_tile.dart';
import '../models/article_fetch.dart';
import 'package:news_app/models/news_model.dart';
import '../models/category._data.dart';
import '../models/category_model.dart';
import '../components/category_tile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _NewsState();
}

class _NewsState extends State<Home> {
  List<NewsModel> articles = <NewsModel>[];
  List<CategoryModel> categories = <CategoryModel>[];
  bool _loading = false;
  @override
  initState() {
    super.initState();
    getNews();
    categories = getCategories();
  }

  getNews() async {
    setState(() {
      _loading = true;
    });
    News news = News();
    await news.fetchNews();
    articles = news.news;
    setState(() {
      _loading = false;
    });
  }

  Future<void> _getDataOnRefresh() async {
    setState(() {
      getNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Quick News",
          style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        )),
      ),
      body: _loading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: 70,
                    child: ListView.builder(
                        itemCount: categories.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CategoryTile(
                              title: categories[index].title.toString(),
                              imgURL: categories[index].imgURL.toString());
                        }),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 16),
                    child: RefreshIndicator(
                      onRefresh: _getDataOnRefresh,
                      child: ListView.builder(
                          itemCount: articles.length,
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return BlogTile(
                              imageUrl: articles[index].urlToImage,
                              title: articles[index].title,
                              desc: articles[index].desc,
                              url: articles[index].url,
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
