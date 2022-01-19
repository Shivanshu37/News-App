import 'package:flutter/material.dart';
import '../models/news_model.dart';
import '../models/article_fetch.dart';
import '../components/blog_tile.dart';

class CategoryNews extends StatefulWidget {
  final String title;
  const CategoryNews({Key? key, required this.title}) : super(key: key);
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<NewsModel> categoryNews = <NewsModel>[];
  bool _loading = false;
  @override
  initState() {
    super.initState();
    getCategoryNews();
  }

  Future<void> _getDataOnRefresh() async {
    setState(() {
      getCategoryNews();
    });
  }

  void getCategoryNews() async {
    setState(() {
      _loading = true;
    });
    News news = News();
    await news.fetchCategoryNews(widget.title);
    categoryNews = news.categoryNews;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
            child: Text(
          "Quick News",
          style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        )),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _getDataOnRefresh,
              child: Container(
                child: ListView.builder(
                  itemCount: categoryNews.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return BlogTile(
                        imageUrl: categoryNews[index].urlToImage,
                        desc: categoryNews[index].desc,
                        title: categoryNews[index].title,
                        url: categoryNews[index].url);
                  },
                ),
              ),
            ),
    );
  }
}
