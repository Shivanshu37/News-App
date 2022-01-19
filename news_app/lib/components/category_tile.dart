import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../screens/category_news.dart';

class CategoryTile extends StatelessWidget {
  final String title;
  final String imgURL;
  const CategoryTile({Key? key, required this.title, required this.imgURL})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryNews(title: title),
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imgURL,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
