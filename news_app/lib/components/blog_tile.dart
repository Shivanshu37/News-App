import 'package:flutter/material.dart';
import 'article_read.dart';

class BlogTile extends StatelessWidget {
  final dynamic imageUrl, title, desc, url;
  const BlogTile(
      {Key? key,
      required this.imageUrl,
      required this.desc,
      required this.title,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleRead(
                articleUrl: url,
              ),
            ));
      },
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              desc,
              style: const TextStyle(color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
