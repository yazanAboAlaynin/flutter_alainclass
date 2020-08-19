import 'package:alainclass/models/news.dart';
import 'package:alainclass/shared/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewNews extends StatelessWidget {
  final News news;

  calling() async {
    print('here');
    const url = 'tel:0097143782222';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  const ViewNews({Key key, this.news}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final sizeAware = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Image.network(
          'assets/images/black_logo.png',
          fit: BoxFit.cover,
          width: sizeAware.width * 0.4,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.call,
                size: sizeAware.width * 0.1,
              ),
              onPressed: calling)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: sizeAware.width,
              height: sizeAware.height * 0.3,
              child: Image.network(
                'https://www.alainclass.com/' + news.image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Html(
                data: """
          ${news.content}
        """,
                style: {
                  "html": Style(
                    color: Colors.white54,
                    fontSize: FontSize(sizeAware.width * 0.05),
                  ),
                  "img": Style(width: sizeAware.width),
                },
              ),
            ),
            Divider(
              color: Colors.red,
            ),
            MyFooter(),
          ],
        ),
      ),
    );
  }
}
