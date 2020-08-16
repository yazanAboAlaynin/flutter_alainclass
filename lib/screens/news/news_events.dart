import 'package:alainclass/blocs/blocs.dart';
import 'package:alainclass/models/models.dart';
import 'package:alainclass/repositories/repositories.dart';
import 'package:alainclass/screens/news/all_news.dart';
import 'package:alainclass/screens/news/event_card.dart';
import 'package:alainclass/shared/footer.dart';
import 'package:alainclass/shared/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

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

  NewsBloc newsBloc;

  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<News> news = [];

  @override
  void initState() {
    super.initState();
    newsBloc = NewsBloc(newsRepository: newsRepository);
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
            return Center(child: CircularProgressIndicator());
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
                    size: sizeAware.width * 0.1,
                  ),
                  onPressed: () => _scaffoldKey.currentState.openDrawer(),
                ),
                backgroundColor: Colors.black,
                centerTitle: true,
                title: Image.asset(
                  'assets/images/black_logo.png',
                  fit: BoxFit.cover,
                  width: sizeAware.width * 0.4,
                  //height: sizeAware.height * 0.01,
                ),
                actions: <Widget>[
                  Icon(
                    Icons.call,
                    size: sizeAware.width * 0.1,
                  ),
                ],
              ),
              drawer: Drawer(
                child: MyDrawer(),
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
            return Container();
          }
        });
  }
}
