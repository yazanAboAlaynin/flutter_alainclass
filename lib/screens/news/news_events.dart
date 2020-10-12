import 'package:alainclass/blocs/blocs.dart';
import 'package:alainclass/models/models.dart';
import 'package:alainclass/repositories/repositories.dart';
import 'package:alainclass/repositories/shared_pref.dart';
import 'package:alainclass/screens/news/all_news.dart';
import 'package:alainclass/screens/news/event_card.dart';
import 'package:alainclass/screens/notifications/notifications.dart';
import 'package:alainclass/shared/footer.dart';
import 'package:alainclass/shared/loading.dart';
import 'package:alainclass/shared/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class NewsEvents extends StatefulWidget {
  @override
  _NewsEventsState createState() => _NewsEventsState();
}

class _NewsEventsState extends State<NewsEvents> {
  final NewsRepository newsRepository = NewsRepository(
    api: NewsApi(
      httpClient: http.Client(),
    ),
  );
  int notificationsNumber = 0;

  Future<int> getNotificationsNumber() async {
    int x = await SharedPrefs.getNotificationsNumber();
    setState(() {
      notificationsNumber = x;
    });
  }

  NewsBloc newsBloc;

  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<News> news = [];

  @override
  void initState() {
    super.initState();
    getNotificationsNumber();
    newsBloc = NewsBloc(newsRepository: newsRepository);
  }

  calling() async {
    print('here');
    const url = 'tel:0097143782222';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeAware = MediaQuery.of(context).size;
    return BlocBuilder(
        cubit: newsBloc,
        builder: (context, state) {
          if (state is NewsInitial) {
            newsBloc.add(NewsRequested());
          }
          if (state is NewsLoadInProgress) {
            return Loading();
          }
          if (state is NewsLoadSuccess) {
            news = state.news;
            return Scaffold(
              key: _scaffoldKey,
              backgroundColor: Colors.black,
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(
                    Icons.menu,
                    size: 35,
                  ),
                  onPressed: () => _scaffoldKey.currentState.openDrawer(),
                ),
                backgroundColor: Colors.black,
                centerTitle: true,
                title: Image.asset(
                  'assets/images/black_logo.png',
                  fit: BoxFit.cover,
                  width: 130,
                  //height: sizeAware.height * 0.01,
                ),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 6, 2),
                    child: Stack(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.notifications,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Notifications(),
                              ),
                            ).then((value) => getNotificationsNumber());
                          },
                        ),
                        notificationsNumber == 0
                            ? Container()
                            : Positioned(
                                bottom: 10,
                                right: 2,
                                child: Container(
                                  width: 18,
                                  height: 18,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Center(
                                    child: Text(
                                      '$notificationsNumber',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 6, 2),
                    child: IconButton(
                      icon: Icon(
                        Icons.call,
                        size: 30,
                      ),
                      onPressed: calling,
                    ),
                  ),
                ],
              ),
              drawer: Container(
                width: sizeAware.width,
                child: Drawer(
                  child: MyDrawer(),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    ShowNews(
                      news: news,
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
          if (state is NewsLoadFailure) {
            return Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: FlatButton(
                    color: Colors.white,
                    onPressed: () {
                      newsBloc.add(NewsRequested());
                    },
                    child: Text('Try Again')),
              ),
            );
          }
        });
  }
}
