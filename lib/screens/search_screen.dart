import 'package:alainclass/blocs/blocs.dart';
import 'package:alainclass/models/models.dart';
import 'package:alainclass/repositories/repositories.dart';
import 'package:alainclass/shared/car_card.dart';
import 'package:alainclass/shared/loading.dart';
import 'package:alainclass/shared/my_drawer.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class SearchScreen extends StatefulWidget {
  final String brand;
  final String neworused;
  final String year;

  SearchScreen({Key key, this.brand, this.neworused, this.year})
      : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  calling() async {
    print('here');
    const url = 'tel:0097143782222';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final options = LiveOptions(
    // Start animation after (default zero)
    delay: Duration(milliseconds: 500),

    // Show each item through (default 250)
    showItemInterval: Duration(milliseconds: 100),

    // Animation duration (default 250)
    showItemDuration: Duration(milliseconds: 500),

    // Animations starts at 0.05 visible
    // item fraction in sight (default 0.025)
    visibleFraction: 0.03,

    // Repeat the animation of the appearance
    // when scrolling in the opposite direction (default false)
    // To get the effect as in a showcase for ListView, set true
    reAnimateOnVisibility: false,
  );
// Build animated item (helper for all examples)
  Widget buildAnimatedItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) =>
      // For example wrap with fade transition
      FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        // And slide transition
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, -0.1),
            end: Offset.zero,
          ).animate(animation),
          // Paste you Widget
          child: CarCard(
            car: search_res.elementAt(index),
          ),
        ),
      );
  final HomeRepository homeRepository = HomeRepository(
    api: Api(
      httpClient: http.Client(),
    ),
  );

  HomeBloc homeBloc;

  List<Car> search_res = [];
  @override
  void initState() {
    super.initState();
    homeBloc = HomeBloc(homeRepository: homeRepository);
  }

  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final sizeAware = MediaQuery.of(context).size;

    return BlocBuilder(
      cubit: homeBloc,
      builder: (context, state) {
        if (state is HomeInitial) {
          homeBloc.add(SearchRequested(
              brand: widget.brand,
              neworused: widget.neworused,
              year: widget.year));
        }
        if (state is HomeLoadInProgress) {
          return Loading();
        }
        if (state is SearchLoadSuccess) {
          search_res = state.cars;
          return Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.black,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.menu,
                  size: 45,
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
                  child: IconButton(
                    icon: Icon(
                      Icons.call,
                      size: 40,
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
            body: search_res.length == 0
                ? Center(
                    child: Text(
                    'No Results',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ))
                : LiveList.options(
                    options: options,
                    itemBuilder: buildAnimatedItem,
                    // scrollDirection: Axis.horizontal,
                    itemCount: search_res.length,
                  ),
          );
        }

        if (state is HomeLoadFailure) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: FlatButton(
                  color: Colors.white,
                  onPressed: () {
                    homeBloc.add(SearchRequested(
                        brand: widget.brand,
                        neworused: widget.neworused,
                        year: widget.year));
                  },
                  child: Text('Try Again')),
            ),
          );
        }
      },
    );
  }
}
