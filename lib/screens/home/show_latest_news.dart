import 'package:alainclass/models/news.dart';
import 'package:alainclass/shared/news_card.dart';
import 'package:flutter/material.dart';

class HomeLatestNews extends StatelessWidget {
  final List<News> latest_news;

  const HomeLatestNews({Key key, this.latest_news}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < latest_news.length; i++) {
      NewsCard n = NewsCard(
        image: latest_news[i].image,
      );
      list.add(n);
    }
    return Column(
      children: list,
    );
  }
}
