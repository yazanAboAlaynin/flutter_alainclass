import 'package:alainclass/screens/news/view_news.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatefulWidget {
  String image;
  NewsCard({
    this.image,
  });
  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    final sizeAware = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ViewNews()));
      },
      child: Container(
        height: sizeAware.height,
        width: sizeAware.width * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          semanticContainer: true,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          color: Colors.black,
          child: Stack(
            children: <Widget>[
              Container(
                height: sizeAware.width * 0.6,
                width: sizeAware.width,
                child: Image.network(
                  "https://www.alainclass.com/" + widget.image,
                  fit: BoxFit.cover,
                  width: sizeAware.width,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
