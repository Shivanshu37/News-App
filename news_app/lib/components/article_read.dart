import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleRead extends StatefulWidget {
  final String? articleUrl;
  const ArticleRead({Key? key, this.articleUrl}) : super(key: key);
  @override
  _ArticleReadState createState() => _ArticleReadState();
}

class _ArticleReadState extends State<ArticleRead> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
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
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Icon(Icons.save),
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.articleUrl,
          onWebViewCreated: (WebViewController webViewController) {
            _completer.complete(webViewController);
          },
        ),
      ),
    );
  }
}
