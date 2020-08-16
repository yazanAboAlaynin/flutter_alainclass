import 'package:alainclass/models/models.dart';
import 'package:alainclass/screens/news/view_news.dart';
import 'package:alainclass/screens/view_car/view_car.dart';
import 'package:alainclass/shared/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

class EventCard extends StatelessWidget {
  News news;
  EventCard({this.news});

  @override
  Widget build(BuildContext context) {
    final sizeAware = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ViewNews(news: news)),
          );
        },
        child: Container(
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                      height: sizeAware.height * 0.34,
                      width: sizeAware.width,
                      child: Image.network(
                        'https://www.alainclass.com/' + news.image,
                        fit: BoxFit.cover,
                        width: sizeAware.width,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: sizeAware.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Html(
                            data: """
          ${news.title}
        """,
                            style: {
                              "html": Style(
                                color: Colors.white,
                              ),
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: sizeAware.height * 0.06,
                  child: Html(
                    data: """
          ${news.content}
        """,
                    style: {
                      "*": Style(
                        color: Colors.grey,
                        fontSize: FontSize(sizeAware.width * 0.04),
                      ),
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 4.0),
                  child: Text(
                    "Read More",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
