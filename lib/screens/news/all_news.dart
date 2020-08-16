import 'package:alainclass/models/models.dart';
import 'package:alainclass/screens/news/event_card.dart';
import 'package:flutter/material.dart';

class ShowNews extends StatelessWidget {
  List<News> news;

  ShowNews({this.news});

  @override
  Widget build(BuildContext context) {
    List<Widget> res = [];
    for (int i = 0; i < news.length; i++) {
      Widget w = EventCard(
        news: news.elementAt(i),
      );
      res.add(w);
    }
    return Column(
      children: res,
    );
  }
}
